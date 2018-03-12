## VA Data tools - compact version

import csv, re, requests, io
import pandas as pd
# We will download the latest version of Brent's CSV file and save it 'locally.' I only need to do this if something changes, really.

In [8]:
VADataInventory = requests.get('https://raw.githubusercontent.com/bbrewington/VA-open-data-mysandbox/master/va_data_inventory_links_checked_20171202.csv')
VADataInventory.raise_for_status()

megadata = open('va_data_inventory.csv', 'wb')
for chunk in VADataInventory.iter_content(100000):
    megadata.write(chunk)
    
megadata.close

## Some variables and dictionaries that we will need

MegaData= open('va_data_inventory.csv', encoding = "utf8")
megasheet = csv.reader(MegaData) # read this using the CSV module
alldata = list(megasheet) # which is easier to work with in a list format
headers = alldata[0]      # easily grab the headers this way
file_extension_regex = re.compile(r'\.((pdf|csv|xlsx?|zip|asp))', re.IGNORECASE) 
states = ['Alabama' ,'Alaska' ,'Arizona' ,'Arkansas' ,'California' ,'Colorado' ,'Connecticut' ,'Delaware' ,'Florida' ,'Georgia' ,'Hawaii' ,'Idaho' ,'Illinois' ,'Indiana' ,'Iowa' ,'Kansas' ,'Kentucky' ,'Louisiana' ,'Maine' ,'Maryland' ,'Massachusetts' ,'Michigan' ,'Minnesota' ,'Mississippi' ,'Missouri' ,'Montana' ,'Nebraska' ,'Nevada' ,'New Hampshire' ,'New Jersey' ,'New Mexico' ,'New York' ,'North Carolina' ,'North Dakota' ,'Ohio' ,'Oklahoma' ,'Oregon' ,'Pennsylvania' ,'Rhode' 'Island' ,'South Carolina' ,'South Dakota' ,'Tennessee' ,'Texas' ,'Utah' ,'Vermont' ,'Virginia' ,'Washington' ,'West' 'Virginia' ,'Wisconsin' ,'Wyoming']
territories = ['American Samoa', 'Guam', 'Northern Mariana Islands', 'Puerto Rico']
states_territories = states + territories
StateDict= {"AL":"Alabama", "AS" : "American Samoa", "AK":"Alaska","AZ":"Arizona","AR":"Arkansas","CA":"California","CO":"Colorado","CT":"Connecticut", "DC": "District of Columbia", "DE":"Delaware","FL":"Florida","FM": "Federated States of Micronesia", "GA":"Georgia","HI":"Hawaii","GU": "Guam", "ID":"Idaho","IL":"Illinois","IN":"Indiana","IA":"Iowa","KS":"Kansas","KY":"Kentucky","LA":"Louisiana","ME":"Maine","MD":"Maryland","MA":"Massachusetts","MH": "Marshall Islands", "MI":"Michigan","MN":"Minnesota","MP" : "Northern Mariana Islands", "MS":"Mississippi","MO":"Missouri","MT":"Montana","NE":"Nebraska","NV":"Nevada","NH":"New Hampshire","NJ":"New Jersey","NM":"New Mexico","NY":"New York","NC":"North Carolina","ND":"North Dakota","OH":"Ohio","OK":"Oklahoma","OR":"Oregon","PA":"Pennsylvania","PR" : "Puerto Rico", "RI":"Rhode Island","SC":"South Carolina","SD":"South Dakota","TN":"Tennessee","TX":"Texas","UT":"Utah","VT":"Vermont","VA":"Virginia","VI": "Version Islands", "WA":"Washington","WV":"West Virginia","WI":"Wisconsin","WY":"Wyoming"}


# Our toolbox!

def vsearch(line, term): # search for any term in a line/dataset
    search_term = re.compile(r'.*(%s).*' % (term), re.IGNORECASE )
    fields = filter(search_term.match, alldata[line])
    return(list(fields))

def searchall(term): # search entire CSV file. The output will tell you what line it's on.
    searchresults = []  
    for line in range(0,len(alldata)):
        if not vsearch(line, term) == []:
            searchresults = searchresults + [vsearch(line, term), 'line:' + str(line -1)]
    return(searchresults)
    
def keywords(line): # What keywords descibe this file?
    return(alldata[line][7])

def whatformat(line):# This will tell you what format a datafile is in
    return(alldata[line][31])


def getheaders(line): # get headers of csv or excel file
    earl = whaturl(line) # assuming the headers are on the first line
    print('Getting file...') 
    # for excel files
    if whatformat(line) in ('xlsx', 'xls'): 
        print('Excel file. Getting headers...')
        try:
            df = pd.read_excel(earl)
            return(df.columns.tolist())
        except:
            print('There was some problem reading this file.')
            print('Try accessing ' + earl + ' directly from your browser.')
    # for CSV files
    elif whatformat(line) == 'csv':
        print('CSV file. Getting headers...')
        try:
            res = requests.get(whaturl(line))
            df = pd.read_csv(io.StringIO(res.text))
            return(df.columns.tolist())
        except:
            print('There was some problem reading this file.')
            print('Try accessing ' + earl + ' directly from your browser.')
    else:
        print('Oh dear! This does not appear to be an excel or CSV file.')
        
def whaturl(line): # Where can I find the file for download
    return(alldata[line][-1])
    
def VAPandas(line): # Pull down CSV or Excel files into Pandas Dataframe
    earl = whaturl(line) # assuming the headers are on the first line
    print('Getting file...') 
    # for excel files
    if whatformat(line) in ('xlsx', 'xls'): 
        print('Excel file. Retrieving into Pandas Dataframe...')
        try:
            df = pd.read_excel(earl)
            return(df)
        except:
            print('There was some problem reading this file.')
            print('Try accessing ' + earl + ' directly from your browser.')
    # for CSV files
    elif whatformat(line) == 'csv':
        print('CSV file. Retrieving into Pandas Dataframe...')
        try:
            res = requests.get(whaturl(line))
            df = pd.read_csv(io.StringIO(res.text))
            return(df)
        except:
            print('There was some problem reading this file.')
            print('Try accessing ' + earl + ' directly from your browser.')
    else:
        print('Oh dear! This does not appear to be an excel or CSV file.')

def whatstate(line): # see what state data is represented in a particular file
    which_states = []
    for x in alldata[line]:
        for state in states_territories:
            if state.lower() in x.lower():
                which_states = which_states + [state]
    if len(which_states) == 0:
        return("No state names found")
    else:
        return(list(set(which_states))) #turned into a set to remove dups, then back into list
        
 # the following allows you to use the state dictionary to easily search for state data
 # i.e. StateSearch("PA")
 
 
def StateSearch(StateAbbreviation):
    searchresults = []
    term = StateDict[StateAbbreviation]
    for line in range(0,len(alldata)):
        if not vsearch(line, term) == []:
            searchresults = searchresults + [vsearch(line, term), 'line:' + str(line -1)]
    return(searchresults)
