sample.d <- function(sim.data,ss){
  sample.data <- sim.data[sample(nrow(sim.data),ss),]
  return(sample.data)
}