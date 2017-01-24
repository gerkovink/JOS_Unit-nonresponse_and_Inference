makemissing <- function(data, 
                        tar.var1, 
                        tar.var2, 
                        aux.var1, 
                        prop.mis, 
                        m.mech){
  data.mis  <- data
  n         <- nrow(data.mis)
  inv.log   <- function(x){exp(x) / (1 + exp(x))}
  mis.cov <- data.mis[, "aux.var1"] #missingness covariate
  sd.cov <- sd(mis.cov) #sd of missingness covariate
  mean.cov <- mean(mis.cov) #mean of missingness covariate
  if (prop.mis==0.25){
    left <- (mean.cov - mis.cov) / sd.cov -1.3
  } else {
    left <- (mean.cov - mis.cov) / sd.cov
  }
  if (m.mech=="MARleft"){ #procedure to induce conditional MAR left missingness
    mis.prob <- inv.log(left) #probability for values to be missing
    draw <- rbinom(n, 1, mis.prob) #draw with mis.prob from binomial distrib.
    data.mis[draw == 1, c("tar.var1", "tar.var2")] <- NA #induce missingness
  }    	
  if (m.mech=="MCAR"){ #procedure to induce MCAR random missingness
    draw <- rbinom(n, 1, prop.mis) #draw with prop.mis from binomial distrib.
    data.mis[draw == 1, c("tar.var1", "tar.var2")] <- NA #induce missingness
  }
  output    <- as.data.frame(data.mis)
  return(output)
}

# #Test
# source("1. creatadata.R")
# A <- createdata(1000, .5)
# B <- makemissing(A, 3, 4, 1, .9625, "MCAR") 
# C <- makemissing(A, 3, 4, 1, .975, "MCAR")
# D <- makemissing(A, 3, 4, 1, .9625, "MARleft")
# E <- makemissing(A, 3, 4, 1, .975, "MARleft")
# apply(B, 2, function(x) sum(is.na(x))) #Test OKAY
# apply(C, 2, function(x) sum(is.na(x))) #Test OKAY
# apply(D, 2, function(x) sum(is.na(x))) #Test OKAY
# apply(E, 2, function(x) sum(is.na(x))) #Test OKAY
