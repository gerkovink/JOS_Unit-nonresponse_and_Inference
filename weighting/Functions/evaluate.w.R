evaluation <- function(object, population){
  mean.pop <- colMeans(population)
  OUT <- list(NA)
  pb <- txtProgressBar(min = 0, max = nsim, style = 3)

for (i in 1:length(object)){
  res <- as.data.frame(object[[i]])
  rownames(res) <- c("tar.var1", "tar.var2")
  res$pop.mean <- mean.pop[c("tar.var1", "tar.var2")]
  res$bias <- res$pop.mean - res$Q
  res$cov <- res$lower < res$pop.mean & res$pop.mean < res$upper
  res$ciw <- res$upper - res$lower
  
    OUT[[i]] <- res
    setTxtProgressBar(pb, i)
  }
  close(pb)
  RES <- Reduce("+", OUT) / length(OUT)
  return(list(sim = OUT, res = RES))
}

    
 