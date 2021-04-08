library(glmnet)
param <- readline(prompt="Enter number of parameters: ")
param <- as.integer(param)
coeff <- 1:param
mat <- matrix(ncol=param,nrow=300)
set.seed(100)
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
test <- mat.data[-tr, ]  #x testing
x_train <- as.matrix(train[,-1])
y_train <- as.matrix(train[,"y"])
x_test <- as.matrix(test[,-1])
y_test <- as.matrix(test[,"y"])

lambdas <- 10^seq(3, -2, by = -.1)
fit <- glmnet(x_train,y_train,alpha = 0)
summary(fit)
cv_fit <- cv.glmnet(x_train,y_train,alpha = 0,lambda=lambdas)
plot(cv_fit)
opt_lambda <- cv_fit$lambda.min
opt_lambda                    
fit <- cv_fit$glmnet.fit
summary(fit)
y_predicted <- predict(fit, s = opt_lambda, newx = x_test)
sst <- sum((y_train - mean(y_test))^2)
sse <- sum((y_predicted - y_test)^2)
rsq <- 1 - (sse/sst)
rsq
rmse <- sqrt(mean(y_predicted - y_test)^2)
rmse

