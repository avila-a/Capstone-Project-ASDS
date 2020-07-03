a = '&includeStationLocation=1'
b = '&boundingBox=90,-180,-90,180'
c = '&startDate=2016-01-01&endDate=2016-01-02'
d = '&stations=AUCE'
e = '&dataTypes=WIND_DIR,WIND_SPEED' # DP01,DP05,DP10,DSND,DSNW,DT00,DT32,DX32,DX70,DX90,SNOW,PRCP
f = c('?dataset=daily-summaries', 
      '?dataset=global-marine',
      '?dataset=global-summary-of-the-year',
      'Global Climate Station Summaries')
start = 'https://www.ncei.noaa.gov/access/services/data/v1'

APIquerry = paste0(start, f, e, c, b)
result <- read.csv(APIquerry)
result

APIquerry <- paste0(start, f[2], e, '&stations=ASN00084027&startDate=1952-01-01&endDate=1970-12-31&includeAttributes=true')
APIquerry
