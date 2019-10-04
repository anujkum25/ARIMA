
## Generating random data pattern
input_pattern= sample(c(100:200), 72, replace = T)

# save a numeric vector containing 72 monthly observations
# from Jan 2013 to Dec 2018 as a time series object
ts_input <- ts(input_pattern, start=c(2013, 1), end=c(2018, 12), frequency=12) 

# subset the time series (June 2018 to December 2018)
ts_subset <- window(ts_input, start=c(2018, 6), end=c(2018, 12)) 

# plot series
plot(ts_input)


# Seasonal decomposition
fit <- stl(ts_input, s.window="period")
plot(fit)

# additional plots
monthplot(ts_input)

library(forecast)
seasonplot(ts_input)


# fit an ARIMA model of order P, D, Q

p=0
d=0
q=0
fit <- arima(ts_input, order=c(p, d, q))


# predictive accuracy
accuracy(fit)

# predict next 5 observations
forecast(fit, 5)
plot(forecast(fit, 5))

forecast(fit, 15)
plot(forecast(fit, 15))


Acf(ts_input)
q=3

Pacf(ts_input)
p=3

diff(ts_input, differences = 1)
diff(ts_input, differences = 2)
ndiffs(ts_input)
d=0

fit <- arima(ts_input, order=c(p, d, q))


# predictive accuracy
accuracy(fit)

# predict next 5 observations
forecast(fit, 5)
plot(forecast(fit, 5))

# predict next 15 observations
forecast(fit, 15)
plot(forecast(fit, 15))


fit=auto.arima(ts_input)
accuracy(fit)
