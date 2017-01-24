evaluation <- function(object, population){
  mean.pop <- c(mean(population$tar.var1),mean(population$tar.var2))
  OUT <- list(NA)
  N <- nrow(object[[1]]$data)
  pb <- txtProgressBar(min = 0, max = nsim, style = 3)
  for (i in 1:length(object)){
    # TARGET VARIABLE 1
    Q1             <- mean(object[[i]]$tar.var1, na.rm=T)
    N1             <- nrow(na.omit(object[[i]]))
    U1             <- sd(object[[i]]$tar.var1, na.rm=T)/sqrt(N1)
    lower1         <- Q1-(qt(.975, N1-1) * U1)
    upper1         <- Q1+(qt(.975, N1-1) * U1)
    res1           <- list(Q = Q1, U = U1, N=N1, lower=lower1, upper=upper1)
    # TARGET VARIABLE 2
    Q2             <- mean(object[[i]]$tar.var2, na.rm=T)
    N2             <- nrow(na.omit(object[[i]]))
    U2             <- sd(object[[i]]$tar.var2, na.rm=T)/sqrt(N2)
    lower2         <- Q2-(qt(.975, N2-1) * U2)
    upper2         <- Q2+(qt(.975, N2-1) * U2)
    res2           <- list(Q = Q2, U = U2, N=N2, lower=lower2, upper=upper2)
    #save evaluations to list
    RES            <- rbind(unlist(res1), unlist(res2))
    rownames(RES)  <- c("tar.var1", "tar.var2")
    RES            <- as.data.frame(RES)
    RES$pop.mean <- mean.pop
    RES$bias <- RES$pop.mean - RES$Q
    RES$cov <- RES$lower < RES$pop.mean & RES$pop.mean < RES$upper
    RES$ciw <- RES$upper - RES$lower
  
    OUT[[i]] <- RES
    setTxtProgressBar(pb, i)
  }
  close(pb)
  POOL <- Reduce("+", OUT) / length(OUT)
  return(list(sim = OUT, pool=POOL))
}
