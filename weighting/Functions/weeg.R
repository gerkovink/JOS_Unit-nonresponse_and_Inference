weeg <- function(sim.data.mis, sample.data)
{
  sample.data <- as.data.frame(sample.data)
  sample.data$aux.var1  <- factor(sample.data$aux.var1)
  sample.data$aux.var2  <- factor(sample.data$aux.var2)
  
  pop.aux1       <- data.frame(summary(sample.data$aux.var1))
  pop.aux2       <- data.frame(summary(sample.data$aux.var2))
  sim.data.mis           <- na.omit(sim.data.mis)
  sim.data.mis["id"]     <- 1:nrow(sim.data.mis)
  sim.data.mis["fpc"]    <- 100000
  design         <- svydesign(id = ~id, fpc = ~fpc, data = sim.data.mis)
  pop.totals     <- c('Intercept)' = ss, pop.aux1$summary.sample.data.aux.var1.[-1], pop.aux2$summary.sample.data.aux.var2.[-1])
  w.design       <- calibrate(design, formula = ~factor(aux.var1) + factor(aux.var2), population = pop.totals)
  corw           <- 100000/nrow(sim.data.mis)
  
  Q1             <- (as.data.frame(svymean(~tar.var1, w.design)))$mean
  U1             <- (as.data.frame(svymean(~tar.var1, w.design)))$tar.var1
  N1             <- nrow(na.omit(sim.data.mis))
  lower1         <- Q1-(qt(.975, N1-1) * U1)
  upper1         <- Q1+(qt(.975, N1-1) * U1)
  min.w          <- min(weights(w.design))/corw
  res1           <- list(Q = Q1, U = U1, W = min.w, N=N1, lower=lower1, upper=upper1)
  Q2             <- (as.data.frame(svymean(~tar.var2, w.design)))$mean
  U2             <- (as.data.frame(svymean(~tar.var2, w.design)))$tar.var2
  N2             <- nrow(na.omit(sim.data.mis))
  lower2         <- Q2-(qt(.975,N2-1) * U2)
  upper2         <- Q2+(qt(.975,N2-1) * U2)
  max.w          <- max(weights(w.design))/corw
  res2           <- list(Q = Q2, U = U2, W= max.w, N=N2, lower=lower2, upper=upper2)
  RES            <- rbind(unlist(res1), unlist(res2))
  rownames(RES)  <- c("tar.var1", "tar.var2")
  return(RES)
}
