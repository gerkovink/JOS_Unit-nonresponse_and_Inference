simulation <- function(sim.data, tar.var1, tar.var2, aux.var1, prop.mis, m.mech,
                       m, maxit, nsim){
  OUT <- list(NA)
  pb <- txtProgressBar(min = 0, max = nsim, style = 3)
  for (i in 1:nsim){
    #make missing
    OUT[[i]] <- as.data.frame(makemissing(sim.data, tar.var1, tar.var2, aux.var1, prop.mis, m.mech))
    #impute
    setTxtProgressBar(pb, i)
  }
  close(pb)  
  return(OUT)
}
