setwd("D:\\Surfdrive\\scriptie\\Gerko")

#load required packages
require(survey)
require(MASS)

#load simulation functions
source("Functions/creatadata.R")
source("Functions/sampledata.R")
source("Functions/makemissing.R")
source("Functions/weeg.R")
source("Functions/simulate.R")

#set global simulation parameters 
nsim <- 1000 #number of simulations
n <- 100000 #size of population 
ss <- 5000 # size of sample

#start timing
st.global <- Sys.time()

#execute seperate simulations
source("Simulation conditions/Sim_MARleft_mis25_cor30.R")
source("Simulation conditions/Sim_MARleft_mis25_cor50.R")
source("Simulation conditions/Sim_MARleft_mis50_cor30.R")
source("Simulation conditions/Sim_MARleft_mis50_cor50.R")
source("Simulation conditions/Sim_MCAR_mis25_cor30.R")
source("Simulation conditions/Sim_MCAR_mis25_cor50.R")
source("Simulation conditions/Sim_MCAR_mis50_cor30.R")
source("Simulation conditions/Sim_MCAR_mis50_cor50.R")

#runtime
rt.global <- Sys.time() - st.global
cat(rt.global)

#save everything
save.image("Workspaces/Simulation/All_sims_combined.RData")