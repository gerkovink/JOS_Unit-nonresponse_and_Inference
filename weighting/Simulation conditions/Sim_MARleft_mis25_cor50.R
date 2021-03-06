set.seed(123)

#set local parameters
mis  <- 0.25
mech <- "MARleft"
cor  <- 0.5

#start timing
st.local <- Sys.time()

#create population data (each file the same because of random seed)
sim.data <- createdata(n, cor)

#create sample data
#sample.data <- sample.d(sim.data, ss)

#run simulation
SIM.ML.m25c50 <- simulation(sim.data=sim.data,
                            sample.data = sample.data, 
                            tar.var1 = 3, tar.var2 = 4, aux.var1 = 1,
                            prop.mis = mis, 
                            m.mech = mech, 
                            nsim = nsim,
                            ss = ss) 

#print runtime to console
print(Sys.time() - st.local)

save(SIM.ML.m25c50, file = "Workspaces/Simulation/MARleft_mis25_cor50.Rdata")

