library(dbConnect)

# establish database connection and retrieve tb data
myDb = dbConnect(MySQL(), user='root', password='Aspire123', dbname='tb', host='127.0.0.1')
qry <- 'SELECT * FROM tb'
rs = dbSendQuery(myDb, qry)
tb = fetch(rs, n=-1)
# 3800 rows = 100 countries * 19 years * 2 genders

# import population data from csv
pop = read.csv('/Users/brucehao/Google Drive/CUNY/2016 Fall/DATA607/Week2/population.csv', stringsAsFactors = F)
# 1900 rows = 100 countries * 19 years

# merge dataframes on country and year
df = merge.data.frame(tb, pop, by = c('country', 'year'))
