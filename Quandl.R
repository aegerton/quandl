library("Quandl", lib.loc="~/R/win-library/3.4")
library("tidyverse", lib.loc="~/R/win-library/3.4")
Quandl.api_key("UFb4zZy9Minr72EAQfu_")
hpidata <- Quandl("YALE/NHPI", type = "ts", start_date = "1990-01-01")
gdpdata <- Quandl("FRED/GDP", type = "ts", start_date = "1990-01-01")
pidata <- Quandl("FRED/PINCOME", type = "ts", start_date = "1990-01-01")
umdata <- Quandl("UMICH/SOC43", type = "ts")[,1]
plot.ts(hpidata, main = "Robert Shiller's Nominal Home Price Index")
print(hpidata)
gdpdata_ann <- Quandl("FRED/GDP", type = "ts", start_date = "1990-01-01", collapse = "annual")
gdpdata_pc <- Quandl("FRED/GDP", type = "ts", start_date = "1990-01-01", transform = "rdiff")
plot.ts(gdpdata_pc*100, ylab="% change", main = "US Gross Domestic Product, % change")

sgddata <- Quandl("FED/RXI_N_A_SI", type = "ts", start_date = "1981-01-01")
plot.ts(sgddata)
print(sgddata)

myrdata <- Quandl("FED/RXI_N_A_MA", type = "ts", start_date = "1971-01-01")
plot.ts(myrdata)
print(myrdata)

idrdata <- Quandl("INSEE/415_001504229_M", type = "ts", start_date = "2005-04-30")
plot.ts(idrdata)
print(idrdata)

eurdata <- Quandl("FED/RXI_US_N_M_EU", type = "ts", start_date = "2005-04-30", collapse = "monthly")
plot.ts(idrdata)
print(idrdata)

idrusd <- cbind(idrdata,eurdata)
idrusd <- as.tibble(idrusd)
idrusd <- mutate(idrusd, idr=idrdata/eurdata)
idrusd <- ts(idrusd, start = c(2005,4),frequency = 12)
plot(idrusd)

inrcpidata<- Quandl("WWDI/IND_FP_CPI_TOTL", type = "ts", start_date = "2000-01-01")
plot.ts(inrcpidata)
print(inrcpidata)

myrcpidata<- Quandl("ODA/MYS_PCPIE", type = "ts", start_date = "2009-01-01")
plot.ts(myrcpidata)
print(myrcpidata)

philcpidata<- Quandl("WWDI/PHL_FP_CPI_TOTL", type = "ts", start_date = "2012-01-01")
plot.ts(philcpidata)
print(philcpidata)

cnycpidata<- Quandl("WWDI/CHN_FP_CPI_TOTL", type = "ts", start_date = "2011-01-01")
plot.ts(cnycpidata)
print(cnycpidata)
