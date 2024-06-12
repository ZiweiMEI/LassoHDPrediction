


RMSE.full <- NULL
MAE.full <- NULL
name =  "UNRATE" 
for (lag4 in c(FALSE,TRUE)){
    
    RMSE.Wid <- NULL 
    MAE.Wid <- NULL 
    
    
    
    
    for (Wid in c(120,240,360)){
      
      RMSE.Trans <- NULL 
      MAE.Trans <- NULL
      
      for (Trans in c(0,1)){
        
        Width = Wid
        
        RDSfile <- paste0("RDS/",name,"Trans",Trans,"Accum0Width",Width,"NolagY",!lag4,".RDS")
        out <- readRDS(RDSfile)
        
        
        
        
        
        RMSE_h <- NULL 
        MAE_h <- NULL 
        
        for (h in 1:3){
          
          
          RMSE <- sqrt(rowMeans(out[[h]]$SE)) 
          RMSE1 <- sqrt(rowMeans(out[[h]]$SE[,1:120]))
          RMSE2 <- sqrt(rowMeans(out[[h]]$SE[,121:240]))
          RMSE3 <- sqrt(rowMeans(out[[h]]$SE[,241:ncol(out[[h]]$SE)]))
          
          RMSE_h <- rbind(RMSE_h, RMSE,RMSE1, RMSE2,  RMSE3)
          
          MAE <- rowMeans(out[[h]]$AE)
          # print(MAE)
          MAE1 <- rowMeans(out[[h]]$AE[,1:120])
          MAE2 <- rowMeans(out[[h]]$AE[,121:240])
          MAE3 <- rowMeans(out[[h]]$AE[,241:ncol(out[[h]]$AE)])
          
          MAE_h <- rbind(MAE_h, MAE,MAE1, MAE2,  MAE3)
          
          
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
        
        RMSE.Trans <- cbind( RMSE.Trans, RMSE_h)
        MAE.Trans <- cbind( MAE.Trans, MAE_h)
        
        
        
      }
      
      
      Select.vars = cbind( Select.vars,  Select.var)
      RMSE.Wid <- rbind(RMSE.Wid,  RMSE.Trans)
      
      MAE.Wid <- rbind(MAE.Wid,  MAE.Trans)
      
      
      
    }
    
    vec <- c(1,1+12,1+24,5,5+12,5+24,9,9+12,9+24)
    RMSE.Wid <- RMSE.Wid[c(vec,vec+1,vec+2,vec+3),]
    MAE.Wid <- MAE.Wid[c(vec,vec+1,vec+2,vec+3),]
  
  RMSE.full <- cbind(RMSE.full,RMSE.Wid)
 
  MAE.full <- cbind(MAE.full,MAE.Wid)
}
n.vec = rep(c(120,240,360),12)
h.vec = rep(c(rep(1,3),rep(2,3),rep(3,3)), 4 )
period.vec = c(rep("Full Sample",9),rep("1990-1999",9),rep("2000-2009",9),rep("2010-2019",9))

RMSE.full <- cbind(h.vec, n.vec, RMSE.full[,c(1,2,3,4,7,8,11,12,15,16)])
rownames(RMSE.full) <- period.vec 
colnames(RMSE.full) <- c("h","n","RWwD","AR","Plasso_NT_121_Predictors","Slasso_NT_121_Predictors",
                         "Plasso_ST_121_Predictors","Slasso_ST_121_Predictors",
                         "Plasso_NT_504_Predictors","Slasso_NT_504_Predictors",
                         "Plasso_ST_504_Predictors","Slasso_ST_504_Predictors")



MAE.full <- cbind(h.vec, n.vec, MAE.full[,c(1,2,3,4,7,8,11,12,15,16)])
rownames(MAE.full) <- period.vec 
colnames(MAE.full) <- c("h","n","RWwD","AR","Plasso_NT_121_Predictors","Slasso_NT_121_Predictors",
                         "Plasso_ST_121_Predictors","Slasso_ST_121_Predictors",
                         "Plasso_NT_504_Predictors","Slasso_NT_504_Predictors",
                         "Plasso_ST_504_Predictors","Slasso_ST_504_Predictors")


write.csv(RMSE.full, file = "Tables/Table_3_RMSE.csv")
write.csv(MAE.full, file = "Tables/Table_C6_MAE.csv")