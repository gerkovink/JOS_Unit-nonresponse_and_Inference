set.seed(123)

#set local parameters
mis  <- 0.25
mech <- "MCAR"
cor  <- 0.3

#start timing
st.local <- Sys.time()

#create population data (each file the same because of random seed)
sim.data.pop <- createdata(n, cor)
sim.data <- sim.data.pop[sample(1:nrow(sim.data.pop), 5000), ]

#run simulation
SIM.MC.m25c30 <- simulation(sim.data = sim.data, tar.var1 = 3, tar.var2 = 4, aux.var1 = 1,
                            prop.mis = mis, 
                            m.mech = mech, 
                            maxit = maxit, 
                            nsim = nsim,
                            m = m) 

#print runtime to console
print(Sys.time() - st.local)

save(SIM.MC.m25c30, file = "Workspaces/Simulation/MCAR_mis25_cor30.Rdata")

