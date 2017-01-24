#load required packages
require(mice)
require(MASS)

#load simulation functions
source("Functions/creatadata.R")
source("Functions/makemissing.R")
source("Functions/simulate.R")

#set global simulation parameters 
nsim <- 1000 #number of simulations
n <- 100000 #size of population
m <- 5 #number of imputation
maxit <- 5 #maximum number of iterations

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