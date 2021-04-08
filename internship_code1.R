library(glmnet)
param <- readline(prompt="Enter number of parameters: ")
param <- as.integer(param)
coeff <- 1:param
mat <- matrix(ncol=param,nrow=300)
 for (i in 1:param) {
   mat[,i] <- rnorm(n=300, mean=100, sd=50)
 }
err<-rnorm(300,10,5)
mat.data <- data.frame(mat)
y=mat %*% coeff + err
mat.data$y = y
  
tr <- sample(1:nrow(mat), 0.8*nrow(mat))
 tes <- setdiff(1:nrow(mat), train)
 train <- mat.data[tr, ]    # training
 test <- mat.data[-tr, ]    #x testing
 
 outcome <- "y"
 variables <- colnames(mat.data[,-1])
 f <- as.formula(
   paste(outcome, 
         paste(variables, collapse = " + "), 
         sep = " ~ "))
 linear <- lm(f, data=train)
 pred <- predict(linear,test)
 
 actuals_preds <- data.frame(cbind(actuals=test$y, predicteds=pred))
 plot(pred,test$y)
 correlation_accuracy <- cor(actuals_preds)  
 head(actuals_preds)
 
 min_max_accuracy <- mean(apply(actuals_preds, 1, min) / apply(actuals_preds, 1, max))  
 
 mape <- mean(abs((actuals_preds$predicteds - actuals_preds$actuals))/actuals_preds$actuals)  
 
rmse <- sqrt(mean(pred-test$y)^2)
print(rmse)
 # no of params   rmse
#      10         5.94
#       9         6.54
#       8         6.93
#       7         8.25 
lambdas <- 10^seq(3, -2, by = -.1)
fit <- glmnet(as.matrix(train[,-y]),as.matrix(train[,"y"]),alpha = 0,lambda = lambdas)
summary(fit)
cv_fit <- cv.glmnet(as.matrix(train[,-y]),as.matrix(train[,"y"]) , alpha = 0)
plot(cv_fit)
opt_lambda <- cv_fit$lambda.min
opt_lambda                    
fit <- cv_fit$glmnet.fit
summary(fit)

