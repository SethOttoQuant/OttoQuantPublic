library(OttoML)

sim_linear <- function(r){
  Y <- matrix(rnorm(10*r), r, 10)
  b <- c(1,0,-3,2,6,-9,4,8,-4,1)
  x <- Y%*%b + rnorm(r)
  return(list(x = x,
              Y = Y))
}

keyval <- "your_keyval"

TestKey(keyval)

trn <- sim_linear(200)
obs <- sim_linear(100)
training_data <- cbind(trn$x, trn$Y)
observations <- obs$Y
res_out <- OttoML(keyval, training_data = training_data, observations = observations)
R2 <- 1 - mean((obs$x - res_out$x_point)^2)/(mean((obs$x - mean(obs$x))^2))
R2

res_out <- OttoBoot(keyval, training_data)
res_out$R2
