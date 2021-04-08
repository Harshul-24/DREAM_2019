library(glmnet)
params <- matrix(nrow=200, ncol=50)
set.seed(105)
for (i in 1:50) {
  if (i<10){
    params[,i]=rnorm(n=200,mean=-10,sd=10)
  }
  if(i<20){
    params[,i]=runif(n=200,min=10,max=50)
  }
  if(i<30){
    params[,i]=rnorm(n=200,mean=50,sd=10)
  }
  if(i<40) {
    params[,i]=runif(n=200,min=100,max=200)
  }
  if(i<51){
    params[,i]=rpois(200,lambda=300)
  }
}
param <- data.frame(params)
coeff.max <- c(1:50)
error <- rnorm(200,mean=10,sd=5)
coeff <- numeric(50)
result <- c()
reg_result <- c()
y <- params%*%coeffs +error
param$y = y

tr <- sample(1:nrow(params), 0.8*nrow(params))
tes <- setdiff(1:nrow(params), tr)
train <- param[tr, ]    # training
test <- param[-tr, ]  #x testing
x_train <- as.matrix(train[,-1])
y_train <- as.matrix(train[,"y"])
x_test <- as.matrix(test[,-1])
y_test <- as.matrix(test[,"y"])

for (j in 40:15){
  coeffs <- replace(coeff,1:j,coeff.max[1:j])
  y <- params%*%coeffs +error
  
  outcome <- "y"
  variables <- colnames(param[1:j])
  f <- as.formula(
    paste(outcome, 
          paste(variables, collapse = " + "), 
          sep = " ~ "))
  linear <- lm(f,data=param)
  result <- append(result,sigma(linear))
  
  lambdas <- 10^seq(3, -2, by = -.1)
  fit <- glmnet(x_train,y_train,alpha = 0)
  cv_fit <- cv.glmnet(x_train,y_train,alpha=0,lambda=lambdas)
  opt_lambda <- cv_fit$lambda.min
  opt_lambda 
  fit <- cv_fit$glmnet.fit
  summary(fit)
  y_predicted <- predict(fit,s=opt_lambda,newx=x_test)
  y_diff <- (y_predicted-y_test)
  diff <- 200-j
  rmse <- sqrt(sum(y_diff^2)/diff)
  reg_result <- append(reg_result,rmse)
}
print(result)
print(reg_result)
plot(c(40:15),result)
plot(c(40:15),reg_result)
