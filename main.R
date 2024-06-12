
#### LASSO prediction for the linear model y_{t+h} = W_t'\theta + u_{t+h} for h = 1, 2, ..., h.max

# empirical.predict <- function(name.outcome, transform, accumulative, Width = NULL, lag4 = 1, factor = 1, h.max = 3, 
#                               start.time = "1/1/1990", growthrate = TRUE,
#                               NolagY = F,
#                               method.set = c("RWWD","AR","Plasso.min","Slasso.min"))

### name.outcome: variable name of outcome
### transform: 0 for NT; 1 for ST 
### accumulative: transformation of outcome. 0 for no transformation, 1 for \sum_{s=1}^h y_{t-s}
### Width: Rolling window length
### lag4: 0 for not including further lags; 1 to include lags up to the 4th order 
### factor: 0 for not including common factors; 1 for the first four principal component factors 
### h.max: the maximum forecasting horizon 
### start.time: starting time of the rolling prediction target period 
### growthrate: 0 for no transformation of outcome, 1 for 100*(log(y_t) - log(y_{t-1}))
### NolagY: 1 for NOT including lagged outcome
### method.set: RWWD for random walk without drift, AR for autoregression, Plasso.min/Slasso.min for plain/standardized LASSO with cross-validation

## load functions 
source("empirical.R")
################ 121 predictors 
empirical.predict("UNRATE",transform = 0, accumulative = 0, start.time = "1/1/1990",
                  Width = 120, lag4 = 0, factor = 0, NolagY = T,
                  growthrate = FALSE, method.set = c("RWWD","AR","Plasso.min","Slasso.min"))
empirical.predict("UNRATE",transform = 1, accumulative = 0, start.time = "1/1/1990",
                  Width = 120, lag4 = 0, factor = 0, NolagY = T,
                  growthrate = FALSE, method.set = c("RWWD","AR","Plasso.min","Slasso.min"))


empirical.predict("UNRATE",transform = 0, accumulative = 0, start.time = "1/1/1990",
                  Width = 240, lag4 = 0, factor = 0, NolagY = T,
                  growthrate = FALSE, method.set = c("RWWD","AR","Plasso.min","Slasso.min"))
empirical.predict("UNRATE",transform = 1, accumulative = 0, start.time = "1/1/1990",
                  Width = 240, lag4 = 0, factor = 0, NolagY = T,
                  growthrate = FALSE, method.set = c("RWWD","AR","Plasso.min","Slasso.min"))




empirical.predict("UNRATE",transform = 0, accumulative = 0, start.time = "1/1/1990",
                  Width = 360, lag4 = 0, factor = 0, NolagY = T,
                  growthrate = FALSE, method.set = c("RWWD","AR","Plasso.min","Slasso.min"))
empirical.predict("UNRATE",transform = 1, accumulative = 0, start.time = "1/1/1990",
                  Width = 360, lag4 = 0, factor = 0, NolagY = T,
                  growthrate = FALSE, method.set = c("RWWD","AR","Plasso.min","Slasso.min"))



################## 504 predictors

empirical.predict("UNRATE",transform = 0, accumulative = 0, start.time = "1/1/1990",
                  Width = 120, lag4 = 1, factor =1,
                  growthrate = FALSE, method.set = c("RWWD","AR","Plasso.min","Slasso.min"))
empirical.predict("UNRATE",transform = 1, accumulative = 0, start.time = "1/1/1990",
                  Width = 120, lag4 = 1, factor =1,
                  growthrate = FALSE, method.set = c("RWWD","AR","Plasso.min","Slasso.min"))


empirical.predict("UNRATE",transform = 0, accumulative = 0, start.time = "1/1/1990",
                  Width = 240, lag4 = 1, factor =1,
                  growthrate = FALSE, method.set = c("RWWD","AR","Plasso.min","Slasso.min"))
empirical.predict("UNRATE",transform = 1, accumulative = 0, start.time = "1/1/1990",
                  Width = 240, lag4 = 1, factor =1,
                  growthrate = FALSE, method.set = c("RWWD","AR","Plasso.min","Slasso.min"))


empirical.predict("UNRATE",transform = 0, accumulative = 0, start.time = "1/1/1990",
                  Width = 360,  lag4 = 1, factor = 1,
                  growthrate = FALSE, method.set = c("RWWD","AR","Plasso.min","Slasso.min"))
empirical.predict("UNRATE",transform = 1, accumulative = 0, start.time = "1/1/1990",
                  Width = 360, lag4 = 1, factor =1,
                  growthrate = FALSE, method.set = c("RWWD","AR","Plasso.min","Slasso.min"))
