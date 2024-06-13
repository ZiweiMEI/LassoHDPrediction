
This repository provides replication files and documents of the empirical results in the paper 

* Ziwei Mei and Zhentao Shi (2024): “[On LASSO for High Dimensional Predictive Regression](https://arxiv.org/abs/2212.07052),” forthcoming at *Journal of Econometrics*.

`current.csv` includes the FRED-MD dataset from 1960 to 2019. 

`trans.csv` includes the TCODEs. 

`empirical.R` includes the R functions that are used for rolling forecasting. 

`main.R` generates the forecasting results and stores them in the RDS files in the folder `RDS`. The results in the RDS files will be summarized into tables by the following two R scripts. 

`Summarize_RMSE_MAE.R` replicates the Tables 3 and C.6 in Mei and Shi (2024) and stores the results in the files  `Table_3_RMSE.csv`  and `Table_C6_MAE.csv` of the `Tables` folder. 

`Summarize_variable_selection.R` replicates Table C.7 in Mei and Shi and stores stores the result in  `Table_C7(a).csv`  and ` Table_C7(b).csv` in the `Tables` folder. This R file also reports full results of variable selection under h = 1 and 121 predictors, storing them in `Selection_Full_121_Predictors_h=1.csv`.

