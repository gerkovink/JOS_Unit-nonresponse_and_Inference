require(MASS)
createdata <- function(n, cor){
  #varcov matrix for data with cor = .3
  if (cor==0.3){ 
    sigma <- matrix(c(1, 0.075, 1.341641, 1.897367,
                      0.075, 0.25, 0.6708294, 0.9486833,
                      1.341641, 0.6708294, 20, 4.242641,
                      1.897367, 0.9486833, 4.242641, 40),
                    4,4)
  }
  #varcov matrix for data with cor = .5
  if (cor==0.5){
    sigma <- matrix(c(1, 0.075, 2.236068, 3.162278,
                      0.075, 0.25, 1.118034, 1.581139,
                      2.236068, 1.118034, 20, 4.242641,
                      3.162278, 1.581139, 4.242641, 40),
                    4,4)
  }
  #draw data from multiv. normal distribution give varcov matrix sigma
  data <- as.data.frame(mvrnorm(n, c(3, 2, 0, 170), sigma))
  #add column names
  colnames(data) <- c("aux.var1", "aux.var2", "tar.var1", "tar.var2")
  #make categorical var1 based on following bounds
  data$aux.var1[data$aux.var1 >= 5] <- 6
  data$aux.var1[data$aux.var1 >= 4 & data$aux.var1 < 5] <- 5
  data$aux.var1[data$aux.var1 >= 3 & data$aux.var1 < 4] <- 4
  data$aux.var1[data$aux.var1 >= 2 & data$aux.var1 < 3] <- 3
  data$aux.var1[data$aux.var1 >= 1 & data$aux.var1 < 2] <- 2
  data$aux.var1[data$aux.var1 < 1] <- 1
  #make categorical var2 based on following bounds
  data$aux.var2[data$aux.var2 >= 3] <- 4
  data$aux.var2[data$aux.var2 >= 2 & data$aux.var2 < 3] <- 3
  data$aux.var2[data$aux.var2 >= 1 & data$aux.var2 < 2] <- 2
  data$aux.var2[data$aux.var2 < 1] <- 1
  return(data)
}



