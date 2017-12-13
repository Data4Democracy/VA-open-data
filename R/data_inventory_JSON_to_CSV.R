library(jsonlite); library(stringr); library(readr); library(dplyr)

va_data_inventory <- fromJSON("https://www.data.va.gov/sites/default/files/VA%20EDI%20August%202017.json")

# Take va_data_inventory$dataset, flatten all non-data frame list cols into character vectors,
# and left join with data frame cols (each dataset can have multiple rows in this new data frame)

col_type <- function(x){
  first_level_list <- is.list(x) # this is true whether it's a list or data frame
  if(first_level_list){
    category <- 
      unique(case_when(
        "data.frame" %in% unlist(unique(lapply(x, class))) ~ "list --> data.frame",
        is.data.frame(x) ~ "data frame",
        unlist(unique(lapply(x, function(y) if(length(y) == 0) TRUE else is.character(y)))) == TRUE ~ 
          "list --> character"))
  } else{
    category <- "character"
  }
  return(category)
}

flatten_col <- function(col){
  type <- col_type(col)
  if(type == "character"){
    col
  } else if(type == "list --> character"){
    unlist(lapply(col, function(x){ 
      if(length(x) == 0) NA_character_ else paste(x, collapse = "; ")
    }))
  }           
}

distribution_colnames <- unique(unlist(lapply(va_data_inventory$dataset$distribution, names)))

dataset <- va_data_inventory$dataset

df1 <- dataset[,unlist(lapply(va_data_inventory$dataset, col_type)) %in% c("character", "list --> character")] %>%
  mutate_all(flatten_col)
df2 <- bind_cols(
  identifier = va_data_inventory$dataset$identifier,
  dataset$contactPoint %>% rename(contactPoint_fn = fn, contactPoint_hasEmail = hasEmail),
  dataset$publisher %>% rename(`publisher_@type` = `@type`, publisher_name = name)
)

distribution2 <- vector(mode = "list", length = nrow(va_data_inventory$dataset))
for(i in 1:nrow(dataset)){
  cat(i, "\n")
  distribution2[[i]] <- bind_cols(
    identifier = rep(dataset$identifier[i], 
                     times = if(is.null(dataset$distribution[[i]])) {
                       1
                     } else {
                       nrow(dataset$distribution[[i]])
                     }
    ),
    dataset$distribution[[i]]
  )
}
distribution2 <- bind_rows(distribution2)
names(distribution2) <- c("identifier", paste0("distribution_", names(distribution2)[which(names(distribution2) != "identifier")]))

new_dataset <- left_join(df1, df2, by = "identifier") %>% left_join(distribution2, by = "identifier")

# Add New Columns
new_dataset <- 
  new_dataset %>% 
  mutate(distribution_accessURL_format = str_extract(distribution_accessURL, "(?<=\\.).{1,4}$"))

write_csv(new_dataset, "va_data_inventory.csv", na = "")
