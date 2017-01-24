require(mice)

#load evaluation functions
source("Functions/pool.finite.R")
source("Functions/evaluate.R")
source("Functions/creatadata.R")

#get populations
set.seed(123)
popu30 <- createdata(100000, .3)
pop30 <- popu30[sample(1:nrow(popu30), 5000), ]
set.seed(123)
popu50 <- createdata(100000, .5)
pop50 <- popu50[sample(1:nrow(popu50), 5000), ]

nsim = 1000

#evaluate simulations
#load simulation results
load("Workspaces/Simulation/MARleft_mis25_cor30.Rdata")
EVAL.ML.m25.c30 <- evaluation(SIM.ML.m25c30, pop30); rm(SIM.ML.m25c30)
load("Workspaces/Simulation/MARleft_mis25_cor50.Rdata")
EVAL.ML.m25.c50 <- evaluation(SIM.ML.m25c50, pop50); rm(SIM.ML.m25c50)
load("Workspaces/Simulation/MARleft_mis50_cor30.Rdata")
EVAL.ML.m50.c30 <- evaluation(SIM.ML.m50c30, pop30); rm(SIM.ML.m50c30)
load("Workspaces/Simulation/MARleft_mis50_cor50.Rdata")
EVAL.ML.m50.c50 <- evaluation(SIM.ML.m50c50, pop50); rm(SIM.ML.m50c50)
load("Workspaces/Simulation/MCAR_mis25_cor30.Rdata")
EVAL.MC.m25.c30 <- evaluation(SIM.MC.m25c30, pop30); rm(SIM.MC.m25c30)
load("Workspaces/Simulation/MCAR_mis25_cor50.Rdata")
EVAL.MC.m25.c50 <- evaluation(SIM.MC.m25c50, pop50); rm(SIM.MC.m25c50)
load("Workspaces/Simulation/MCAR_mis50_cor30.Rdata")
EVAL.MC.m50.c30 <- evaluation(SIM.MC.m50c30, pop30); rm(SIM.MC.m50c30)
load("Workspaces/Simulation/MCAR_mis50_cor50.Rdata")
EVAL.MC.m50.c50 <- evaluation(SIM.MC.m50c50, pop50); rm(SIM.MC.m50c50)

save(EVAL.ML.m25.c30,
     EVAL.ML.m25.c50,
     EVAL.ML.m50.c30,
     EVAL.ML.m50.c50,
     EVAL.MC.m25.c30,
     EVAL.MC.m25.c50,
     EVAL.MC.m50.c30,
     EVAL.MC.m50.c50, file = "Workspaces/Evaluation/All_evaluated.RData")