simulation <- function(sim.data, sample.data, tar.var1, tar.var2, aux.var1, prop.mis, m.mech, nsim, ss){
  OUT <- list(NA)
  pb <- txtProgressBar(min = 0, max = nsim, style = 3)
  for (i in 1:nsim){
    sample.data  <- sample.d(sim.data, ss)
    #make missing
    sim.data.mis <- makemissing(sample.data, tar.var1, tar.var2, aux.var1, prop.mis, m.mech)
    #impute
    OUT[[i]] <- weeg(sim.data.mis, sample.data)
    setTxtProgressBar(pb, i)
  }
  close(pb)  
  return(OUT)
}