#########################################################
################################### 121 Predictors 
lag4 = FALSE
name = "UNRATE"  

df.Wid <- NULL 
df1.Wid <- NULL 
df2.Wid <- NULL 
df4.Wid <- NULL 
df5.Wid <- NULL 
df6.Wid <- NULL 
df7.Wid <- NULL 

Select.vars <- NULL

for (Wid in c(120,240,360)){
  
 
  df.Trans <- NULL
  df1.Trans <- NULL
  df2.Trans <- NULL
  df4.Trans <- NULL
  df5.Trans <- NULL
  df6.Trans <- NULL
  df7.Trans <- NULL
  
  Select.var <- NULL
  
  
  
  for (Trans in c(0,1)){
    
    Width = Wid
    
    RDSfile <- paste0("RDS/",name,"Trans",Trans,"Accum0Width",Width,"NolagY",!lag4,".RDS")
    out <- readRDS(RDSfile)
    
  
    
    Select.var <- cbind( Select.var, t(out[[1]]$Select.variable)[,3:4] )
    
     
    df_h <- NULL 
    df1_h <- NULL 
    df2_h <- NULL 
    df4_h <- NULL 
    df5_h <- NULL 
    df6_h <- NULL 
    df7_h <- NULL 
    for (h in 1:3){
      
       
      
      
      if (h==1){
        df_h <- rowMeans(out[[h]]$df)[3:4] 
        df1_h <- rowMeans(out[[h]]$df1)[3:4]
        df2_h <- rowMeans(out[[h]]$df2)[3:4]
        df4_h <- rowMeans(out[[h]]$df4)[3:4]
        df5_h <- rowMeans(out[[h]]$df5)[3:4]
        df6_h <- rowMeans(out[[h]]$df6)[3:4]
        df7_h <- rowMeans(out[[h]]$df7)[3:4]
        
        if (lag4){
          df10_h <- rowMeans(out[[h]]$df10)[3:4] 
          df11_h <- rowMeans(out[[h]]$df11)[3:4]
          df12_h <- rowMeans(out[[h]]$df12)[3:4]
          df14_h <- rowMeans(out[[h]]$df14)[3:4]
          df15_h <- rowMeans(out[[h]]$df15)[3:4]
          df16_h <- rowMeans(out[[h]]$df16)[3:4]
          df17_h <- rowMeans(out[[h]]$df17)[3:4]
          
          df20_h <- rowMeans(out[[h]]$df20)[3:4] 
          df21_h <- rowMeans(out[[h]]$df21)[3:4]
          df22_h <- rowMeans(out[[h]]$df22)[3:4]
          df24_h <- rowMeans(out[[h]]$df24)[3:4]
          df25_h <- rowMeans(out[[h]]$df25)[3:4]
          df26_h <- rowMeans(out[[h]]$df26)[3:4]
          df27_h <- rowMeans(out[[h]]$df27)[3:4]
          
          df30_h <- rowMeans(out[[h]]$df30)[3:4]
          df31_h <- rowMeans(out[[h]]$df31)[3:4]
          df32_h <- rowMeans(out[[h]]$df32)[3:4]
          df34_h <- rowMeans(out[[h]]$df34)[3:4]
          df35_h <- rowMeans(out[[h]]$df35)[3:4]
          df36_h <- rowMeans(out[[h]]$df36)[3:4]
          df37_h <- rowMeans(out[[h]]$df37)[3:4]
          
          df_h <- c(df_h,df10_h,df20_h,df30_h)
          df1_h <- c(df1_h,df11_h,df21_h,df31_h)
          df2_h <- c(df2_h,df12_h,df22_h,df32_h)
          df4_h <- c(df4_h,df14_h,df24_h,df34_h)
          df5_h <- c(df5_h,df15_h,df25_h,df35_h)
          df6_h <- c(df6_h,df16_h,df26_h,df36_h)
          df7_h <- c(df7_h,df17_h,df27_h,df37_h)
        }
        
      }
      
      
    }
    
    # if (Trans == 0){
    #   # RMSE_h <- RMSE_h[,-2]
    #   # MAE_h <- MAE_h[,-2]
    # }else{
    #   RMSE_h <- RMSE_h[,-(1:3)]
    #   MAE_h <- MAE_h[,-(1:3)]
    #   df_h <- df_h[-(1:3)]
    #   df1_h <- df1_h[-(1:3)]
    #   df2_h <- df2_h[-(1:3)]
    #   df4_h <- df4_h[-(1:3)]
    #   df5_h <- df5_h[-(1:3)]
    #   df6_h <- df6_h[-(1:3)]
    #   df7_h <- df7_h[-(1:3)]
    # }
    
    
    
    if (lag4){
      df.Trans <- c( df.Trans, df_h)
      df1.Trans <- c( df1.Trans, df1_h)
      df2.Trans <- c( df2.Trans, df2_h)
      df4.Trans <- c( df4.Trans, df4_h)
      df5.Trans <- c( df5.Trans, df5_h)
      df6.Trans <- c( df6.Trans, df6_h)
      df7.Trans <- c( df7.Trans, df7_h)
    }else{
      df.Trans <- c( df.Trans, df_h)
      df1.Trans <- c( df1.Trans, df1_h)
      df2.Trans <- c( df2.Trans, df2_h)
      df4.Trans <- c( df4.Trans, df4_h)
      df5.Trans <- c( df5.Trans, df5_h)
      df6.Trans <- c( df6.Trans, df6_h)
      df7.Trans <- c( df7.Trans, df7_h)
    }
    
    
    # if ((Trans %in% c(0,1)) & (Width == 240)){
    #   df.Y.hat = out[[1]]$PV
    #   write.csv(df.Y.hat, paste0("Tables/",name,"Trans",Trans,"predicted_value.csv") )
    # }
    
  }
  
 
  Select.vars = cbind( Select.vars,  Select.var)
  
  df.Wid <- rbind(df.Wid,  df.Trans)
  df1.Wid <- rbind(df1.Wid,  df1.Trans)
  df2.Wid <- rbind(df2.Wid,  df2.Trans)
  df4.Wid <- rbind(df4.Wid,  df4.Trans)
  df5.Wid <- rbind(df5.Wid,  df5.Trans)
  df6.Wid <- rbind(df6.Wid,  df6.Trans)
  df7.Wid <- rbind(df7.Wid,  df7.Trans)
  
}



Select.vars <- cbind(out[[1]]$ID,out[[1]]$TCODE,Select.vars)
colnames(Select.vars) <- c("name","TCODE","n=120_Plasso_NT","n=120_Slasso_NT","n=120_Plasso_ST","n=120_Slasso_ST",
                           "n=240_Plasso_NT","n=240_Slasso_NT","n=240_Plasso_ST","n=240_Slasso_ST",
                           "n=360_Plasso_NT","n=360_Slasso_NT","n=360_Plasso_ST","n=360_Slasso_ST")

write.csv(Select.vars, paste0("Tables/Selection_Full_121_Predictors_h=1.csv") )

df_present <- rbind( df.Wid ,
                     df1.Wid ,
                     df2.Wid ,
                     df4.Wid ,
                     df5.Wid ,
                     df6.Wid ,
                     df7.Wid )
rownames(df_present) <- NULL
n.vec = rep(c(120,240,360),7)
TCODE.vec = c(rep("All",3),rep(1,3),rep(2,3),rep(4,3),rep(5,3),rep(6,3),rep(7,3))
df_present = cbind(TCODE.vec, n.vec, df_present)
colnames(df_present) <- c("TCODE","n","Plasso_NT","Slasso_NT","Plasso_ST","Slasso_ST")
write.csv(df_present , paste0("Tables/Table_C7(a).csv"), row.names = F )

#################################################################
#################### 504 Predictors 

lag4 = TRUE
name = "UNRATE"  

df.Wid <- NULL 
df1.Wid <- NULL 
df2.Wid <- NULL 
df4.Wid <- NULL 
df5.Wid <- NULL 
df6.Wid <- NULL 
df7.Wid <- NULL 

Select.vars <- NULL

for (Wid in c(120,240,360)){
  
  
  df.Trans <- NULL
  df1.Trans <- NULL
  df2.Trans <- NULL
  df4.Trans <- NULL
  df5.Trans <- NULL
  df6.Trans <- NULL
  df7.Trans <- NULL
 
  
  
  
  for (Trans in c(0,1)){
    
    Width = Wid
    
    RDSfile <- paste0("RDS/",name,"Trans",Trans,"Accum0Width",Width,"NolagY",!lag4,".RDS")
    out <- readRDS(RDSfile)
    
    
    
    
    
    df_h <- NULL  
    for (h in 1:3){
      
      
      
      
      if (h==1){
        df_h <- rowMeans(out[[h]]$df)[3:4]  
        
        if (lag4){
          df10_h <- rowMeans(out[[h]]$df10)[3:4]  
          
          df20_h <- rowMeans(out[[h]]$df20)[3:4]  
          
          df30_h <- rowMeans(out[[h]]$df30)[3:4] 
          
          df_h <- c(df_h,df10_h,df20_h,df30_h) 
        }
        
      }
      
      
    }
    
    # if (Trans == 0){
    #   # RMSE_h <- RMSE_h[,-2]
    #   # MAE_h <- MAE_h[,-2]
    # }else{
    #   RMSE_h <- RMSE_h[,-(1:3)]
    #   MAE_h <- MAE_h[,-(1:3)]
    #   df_h <- df_h[-(1:3)]
    #   df1_h <- df1_h[-(1:3)]
    #   df2_h <- df2_h[-(1:3)]
    #   df4_h <- df4_h[-(1:3)]
    #   df5_h <- df5_h[-(1:3)]
    #   df6_h <- df6_h[-(1:3)]
    #   df7_h <- df7_h[-(1:3)]
    # }
    
    
    
    if (lag4){
      df.Trans <- c( df.Trans, df_h) 
    }else{
      df.Trans <- c( df.Trans, df_h) 
    }
    
    
    # if ((Trans %in% c(0,1)) & (Width == 240)){
    #   df.Y.hat = out[[1]]$PV
    #   write.csv(df.Y.hat, paste0("Tables/",name,"Trans",Trans,"predicted_value.csv") )
    # }
    
  }
  
  
  
  
  df.Wid <- rbind(df.Wid,  df.Trans) 
  
}

 
df_present <- rbind(df.Wid[,c(1,2,9,10)] + df.Wid[,c(3,4,11,12)] + df.Wid[,c(5,6,13,14)] + df.Wid[,c(7,8,15,16)],
                    df.Wid[,c(1,2,9,10)],
                    df.Wid[,c(3,4,11,12)],
                    df.Wid[,c(5,6,13,14)],
                    df.Wid[,c(7,8,15,16)] )  
rownames(df_present) <- NULL
n.vec = rep(c(120,240,360),5)
lag.vec = c(rep("All",3),rep(1,3),rep(2,3),rep(3,3),rep(4,3))
df_present = cbind(lag.vec, n.vec, df_present)
colnames(df_present) <- c("Lag","n","Plasso_NT","Slasso_NT","Plasso_ST","Slasso_ST")
write.csv(df_present , paste0("Tables/Table_C7(b).csv"), row.names = F )
 
 
