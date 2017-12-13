library(httr); library(purrr); library(readr); library(dplyr); library(stringr)

check_url <- function(url) http_status(HEAD(url))$message
safe_check_url <- safely(check_url)

va_data_inventory <- read_csv("va_data_inventory.csv")

link_status <- vector(mode = "list", length = nrow(va_data_inventory))
for(i in 1:nrow(va_data_inventory)){
  cat(i, "; ")
  if(is.na(va_data_inventory$distribution_accessURL[i])){
    link_status[[i]] <- safe_check_url(va_data_inventory$distribution_downloadURL[i])
  } else {
    link_status[[i]] <- safe_check_url(va_data_inventory$distribution_accessURL[i])
  }
}

# This next section is incredibly messy but it seems to work.  Converts the above link status check
# to character and adds a new column to the "va_data_inventory"
va_data_inventory <- bind_cols(
  va_data_inventory, 
  data_frame(link_status_20171202_result = 
               unlist(lapply(link_status, function(x) if_else(is.null(x$result), NA_character_, x$result))),
             link_status_20171202_error = unlist(lapply(link_status, function(x){
    if(is.null(x$error)){
      return(NA_character_)
    } else {
      return(as.character(x$error))
    }
  })) %>%
    str_replace("Error in curl\\:\\:curl_fetch_memory\\(url, handle \\= handle\\)\\: ", ""))
  ) %>%
  mutate(link_status_20171202 = 
           if_else(is.na(va_data_inventory$distribution_accessURL) & is.na(va_data_inventory$distribution_downloadURL),
                 NA_character_,
                 if_else(is.na(link_status_20171202_result), link_status_20171202_error,
                         link_status_20171202_result))) %>%
  select(-link_status_20171202_result, -link_status_20171202_error) %>%
  mutate(url = case_when(
    is.na(distribution_accessURL) & is.na(distribution_downloadURL) ~ NA_character_,
    is.na(distribution_accessURL) ~ distribution_downloadURL,
    is.na(distribution_downloadURL) ~ distribution_accessURL
  )) %>%
  mutate(url = str_replace(url, "www1\\.va\\.gov", "www\\.va\\.gov"))

write_csv(va_data_inventory, "va_data_inventory_links_checked_20171202.csv", na = "")