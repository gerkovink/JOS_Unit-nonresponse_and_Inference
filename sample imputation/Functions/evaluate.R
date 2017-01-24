evaluation <- function(object, population){
  mean.pop <- colMeans(population)
  OUT <- list(NA)
  N <- nrow(object[[1]]$data)
  pb <- txtProgressBar(min = 0, max = nsim, style = 3)
  for (i in 1:length(object)){
    # TARGET VARIABLE 1
    # extract mean of target variable 1 - name it Q cf. Rubin (1987, pp 76)
    Q1            <- unlist(with(object[[i]], mean(tar.var1))$analyses) 
    # extract variance of Q - name it U cf. Rubin (1987, pp 76)
    U1            <- unlist(with(object[[i]], var(tar.var1))$analyses) / N
    pool1         <- pool.finite(Q1, U1)
    pool1$lower   <- pool1$qbar - qt(.975, pool1$df) * sqrt(pool1$t)
    pool1$upper   <- pool1$qbar + qt(.975, pool1$df) * sqrt(pool1$t)
    pool1$lambda  <- (pool1$b + (pool1$b/pool1$m)) / pool1$t
    # TARGET VARIABLE 2
    # extract mean of target variable 2 - name it Q cf. Rubin (1987, pp 76)
    Q2            <- unlist(with(object[[i]], mean(tar.var2))$analyses)
    # extract variance of Q - name it U cf. Rubin (1987, pp 76)
    U2            <- unlist(with(object[[i]], var(tar.var2))$analyses) / N
    pool2         <- pool.finite(Q2, U2)
    pool2$lower   <- pool2$qbar - qt(.975, pool2$df) * sqrt(pool2$t)
    pool2$upper   <- pool2$qbar + qt(.975, pool2$df) * sqrt(pool2$t)
    pool2$lambda  <- (pool2$b + (pool2$b/pool2$m)) / pool2$t
    #save evaluations to list
    res      <- as.data.frame(rbind(unlist(pool1), unlist(pool2)))
    rownames(res) <- c("tar.var1", "tar.var2")
    res$pop.mean <- mean.pop[c("tar.var1", "tar.var2")]
    res$bias <- res$pop.mean - res$qbar
    res$cov <- res$lower < res$pop.mean & res$pop.mean < res$upper
    res$ciw <- res$upper - res$lower
    OUT[[i]] <- res
    setTxtProgressBar(pb, i)
  }
  close(pb)
  POOL <- Reduce("+", OUT) / length(OUT)
  return(list(sim = OUT, pool = POOL))
}
