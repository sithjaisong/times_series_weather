# get Weather data
#

#checkDataAvailability(station_id, check_date, station_type = "airportCode")

library(weatherData)
library(lubridate)
library(ggplot2)
library(dplyr)

getStationCode("Bangkok")

# http://hangar1.net/mt-icao.html

tenyear_bkk <- getSummarizedWeather("VTBD", start_date = "2000-01-01", end_date="2015-01-01", station_type="id") 


d10<- getWeatherForDate("VTBD", start_date="2010-01-01",
                       end_date = "2015-11-01",
                       opt_detailed = TRUE,
                       opt_all_columns = TRUE)

bkkweather2016 <- getWeatherForDate("VTBD", start_date="2016-01-01",
                                    end_date = "2016-12-31",
                                    opt_detailed = TRUE,
                                    opt_all_columns = TRUE)

# clear the data
d10 <- d10 %>% filter(TemperatureC > 0)


d10 <- strftime(d10$Time, format="%y-%m-%d")

meanTemp <- d10 %>% 3, .(shortdate), summarize, mean_T=mean(TemperatureF))

ggplot(d10, aes(x = Time, y =TemperatureC)) + geom_line() 

tenyearTC$d10.Time <- as.Date(tenyearTC$d10.Time)

str(tenyearTC)

tenyearTC.ts.xts <- xts(as.Date(tenyearTC$d10.Time, format = "%y/%m/%d"), tenyearTC$d10.TemperatureC)

tenyearTC.ts <- as.ts(tenyearTC)
class(tenyearTC.ts)
autoplot(tenyearTC.ts)
#w2013$shortdate <- strftime(w2013$Time, format="%m-%d")

#meanTemp <- ddply(w2013, .(shortdate), summarize, mean_T=mean(TemperatureF))
#$meanTemp$shortdate <- as.Date(meanTemp$shortdate,format="%m-%d")

#ggplot(meanTemp, aes(shortdate, mean_T)) + geom_line() +
#  scale_x_date(labels=date_format("%m/%d")) + xlab("") + ylab("Mean Temp deg F") +
#  ggtitle("2013 Average Daily Temperature at SFO")