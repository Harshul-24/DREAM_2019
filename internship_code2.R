params <- matrix(nrow=200, ncol=50)
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
set.seed(100)
coeff.max <- c(1:50)
error <- rnorm(200,mean=10,sd=5)
coeff <- numeric(50)
result <- c()
reg_result <- c()
y <- params%*%coeffs +error
param$y = y
y_train <- as.matrix(param[,"y"])

for (j in 40:15){
  coeffs <- replace(coeff,1:j,coeff.max[1:j])
  outcome <- "y"
  variables <- colnames(param[1:j])
  f <- as.formula(
    paste(outcome, 
          paste(variables, collapse = " + "), 
          sep = " ~ "))
  linear <- lm(f,data=param)
  summary(linear)
  result <- append(result,sigma(linear))
  
  lambdas <- 10^seq(3, -2, by = -.1)
  fit <- glmnet(params,y_train,alpha = 0)
  cv_fit <- cv.glmnet(params,y_train,alpha=0,lambda=lambdas)
  opt_lambda <- cv_fit$lambda.min
  opt_lambda 
  fit <- cv_fit$glmnet.fit
  summary(fit)
  y_predicted <- predict(fit,s=opt_lambda,newx=params)
  #y_diff <- (y_predicted-y_train)
  #diff <- 200-j
  #rmse <- sqrt(mean(y_predicted - y_train)^2)
  #
  actuals_preds <- data.frame(cbind(actuals=param$y, predicteds=y_predicted))
  rmse <- sqrt(mean(y_predicted-param$y)^2)
  reg_result <- append(reg_result,rmse)
  
  
  
}
print(result)
#[1]   4.848534   4.833913   4.864240   4.858377   4.843474   4.840128
#[7]   4.832546   4.817997   4.834945   4.900628   4.891866   4.896523
#[13]   4.883368   4.888641   4.878565   4.864603   4.875539   4.877442
#[19]   4.879168   4.875875   4.871979 222.607433 274.516531 306.802592
#[25] 367.604585 401.039593

plot(c(40:15),result)


