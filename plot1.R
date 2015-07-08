
# Setup
library(dplyr)
library(lubridate)

# Read data.
data <- tbl_df(read.table("household_power_consumption.txt",
                # nrows=1000,
                header=TRUE,
                sep=";",
                na.strings="?",
                col.names=c("date_s","time_s","active_power","reactive_power","voltage","current","sub_kitchen","sub_laundry","sub_utility"),
                )
) %>% mutate(date=dmy(date_s),time=hms(time_s)) %>% mutate(date_s=NULL,time_s=NULL)


