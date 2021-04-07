writeLines('PATH="${RTOOLS40_HOME}\\usr\\bin;${PATH}"', con = "~/.Renviron")
gene.data  = get(load("HTA20_RMA.RData"))
gene.data = get("eset_HTA20")

gen <- data.frame(gene.data)
ano=read.csv("/Users/User/Downloads/anoSC1_v11_nokey.csv.xls",stringsAsFactors = FALSE)
symbs = c('ALAS2', 'ANXA3', 'ARG1', 'CASP8', 'CD14', 'CD163', 'CD2', 'CD209', 'CD247', 'CD27', 'CD34', 'CD3D', 'CD3E', 'CD3G', 
          'CD4', 'CD52', 'CD53', 'CD69', 'CD86', 'CD8B', 'CDH5', 'CGA', 'CNN1', 'COL1A1', 'CSF1R', 'CST7', 'CTSW', 'CYP19A1',
          'DKK1', 'FGFBP2', 'FIBIN', 'FMOD', 'GH2', 'GNLY', 'GZMA', 'GZMB', 'GZMH', 'HBA1', 'HBB', 'HBG1', 'HLA-A', 'HLA-B', 'HLA-C', 'HLA-E',
         'ICAM1', 'IGFBP1', 'IL7R', 'KLRC1', 'KLRF1', 'LCK', 'MMP11', 'MYH11', 'NKG7', 'PAPPA2', 'PAPPA2', 'PARP1', 'PLVAP', 'PRF1', 'PRL',
          'RPL7', 'RPS24', 'S100P', 'THY1', 'VIM')


library(org.Hs.eg.db)
hs <- org.Hs.eg.db
#my.symbols <- c("INSL4")   #next line to find entrezid from gene symbol
#select(hs,keys=my.symbols,columns = c("ENTREZID", "SYMBOL"),keytype = "SYMBOL")

symbol=as.vector(unlist(mget(gsub("_at","",rownames(eset_HTA20)), envir=org.Hs.egSYMBOL, ifnotfound=NA)))
mypreds=rownames(eset_HTA20)[match(symbs,symbol)] 

#running through dataset to find genes satisfying our criteria
#gene.names <- c()
#pval <- c()
#for (i in 1:32000){
  #samp <- gene.data[i,c(1:367)]
  #tra <- trainz$Y
  #res <- cor.test(samp,tra)
  #if (res$p.value < 0.005){
    #gene.names <- append(gene.names,rownames(gen[i,]))
    #pval<-append(pval,res$p.value)
  #}
#}
#gene.names
#selgene <- list(pval)
#names(selgene) <- list(gene.names)

mypreds2 <- c('51108_at','101927924_at','2359_at','114793_at', '105369454_at', '10321_at', '79980_at', '100506084_at', '3495_at', '5027_at', '646120_at', '6079_at', '6884_at', '105374377_at', '646517_at', 
              '974_at', '10946_at', '6772_at', '92249_at', '10425_at', '647302_at', '7071_at', '55313_at', '10919_at', '256223_at', '55176_at', '115361_at', '390162_at', '3934_at', '199675_at', '101928081_at', 
              '201158_at', '389386_at', '1892_at', '6498_at', '28394_at', '105376236_at', '101927392_at', '4317_at', '100130964_at', '100131801_at', '5169_at', '102723963_at', '7730_at', '100419489_at', '107985115_at',
              '9855_at', '3399_at', '147929_at', '100113373_at', '4057_at', '84650_at', '84899_at', '23512_at', '252884_at', '1088_at', '27197_at', '146923_at', '100499489_at', '23008_at', '100130742_at', '388512_at', 
              '220213_at', '101929715_at', '5366_at', '286336_at', '28449_at', '100288323_at', '84909_at', '28392_at', '51056_at', '2966_at', '151507_at', '10342_at', '100861520_at', '6925_at', '101928685_at', '5886_at', 
              '644451_at', '727677_at', '400759_at', '154664_at', '55272_at', '84658_at', '100616304_at', '10257_at', '162989_at', '1359_at', '10261_at', '105377125_at', '257019_at', '100506311_at', '6560_at', '28882_at',
              '144847_at', '106479545_at', '105370324_at', '4211_at', '80117_at', '22893_at', '441425_at', '105371343_at', '105370524_at', '5352_at', '653268_at', '574495_at', '442897_at', '692090_at', '51596_at', '267_at',
              '3067_at', '1958_at', '100420611_at', '4947_at', '10944_at', '125170_at', '106480664_at', '101929639_at', '101928036_at', '6507_at', '101927802_at', '100130417_at', '105369816_at', '100132774_at', '57707_at', 
              '387254_at', '100130624_at', '100500871_at', '7752_at', '105369579_at', '100996720_at', '84902_at', '728577_at', '79716_at', '7326_at', '644588_at', '55764_at', '84932_at', '440742_at', '1_at', '100506134_at', 
              '26796_at', '646531_at', '107984180_at', '130075_at', '100288831_at', '109616971_at', '110599564_at', '6446_at', '100130029_at', '10325_at', '58_at', '10490_at', '57419_at', '1073_at', '100033420_at', '100127952_at',
              '10591_at', '102724736_at', '56111_at', '100302195_at', '3451_at', '107986485_at', '107986229_at', '109617003_at', '92014_at', '100126446_at', '6165_at', '441272_at', '2026_at', '100874047_at', '107987011_at', '4779_at',
              '163778_at', '387032_at', '105376569_at', '100129808_at', '3652_at', '7163_at', '5627_at', '653753_at', '729307_at', '101928037_at', '105379104_at', '219595_at', '5606_at', '50861_at', '150478_at', '102546299_at', '4710_at',
              '728327_at', '10135_at', '83892_at', '3008_at', '401491_at', '101409258_at', '100505806_at', '107985950_at', '391356_at', '51312_at', 'AFFX-BkGr-GC10_at', '390059_at', '100189214_at', '100129858_at', '55510_at', '1743_at', '105374695_at',
              '133629_at', '105377953_at', '129607_at', '100130345_at', '28455_at', '107987116_at', '100873793_at', '105379157_at', '5119_at', '6229_at', '101928391_at', '100129297_at', '71_at', '83530_at', '8882_at', '100996251_at', '100287402_at', '10445_at', '114785_at', '100130746_at',
              '341418_at', '286065_at', '952_at', '27247_at', '105373604_at', '119774_at', '9093_at', '8273_at', '10762_at', '84878_at', '100616237_at', '100132015_at', '102724954_at', '285329_at', '100616349_at', '151176_at', '389906_at', '55852_at', '693213_at', '100289470_at', '692213_at', '51673_at', '84868_at', '5900_at', '7295_at', '90416_at', '100189344_at', '9753_at', '105374394_at', '101929425_at', '105379641_at', '26212_at',
              '642935_at', '100873917_at', '221756_at', '26239_at', '129880_at', '145864_at', '5795_at', '100421148_at', '101929142_at', '118490_at', '644903_at', '105377307_at', '144448_at', '101928336_at', '283629_at', '101928092_at', '140701_at', '105377286_at', '105370873_at', '112268447_at', '442131_at', '54602_at', '105375577_at', '390535_at', '26814_at', '10440_at', '100996415_at', '64976_at', '100271260_at', '4140_at', '203_at',
              '100874089_at', '408029_at', '65080_at', '101927709_at', '100506007_at', '5928_at', '347687_at', '100616213_at', '390113_at', '100288801_at', '6701_at', '375298_at', '100126340_at', '103752589_at', '3398_at', '105372473_at', '105375380_at', '100126572_at', '106479184_at', '105378291_at', '107987060_at', '105370035_at', '102724732_at', '132625_at', '222235_at', '105372441_at', '8548_at', '100874207_at', '103625681_at', '101929145_at',
              '389541_at', '9935_at', '105375750_at', '653160_at', '105370171_at', '4739_at', '100379661_at', '100271076_at', '100128126_at', '100337591_at', '5746_at', '28595_at', '100302203_at', '8220_at', '101930665_at', '101930149_at')

number_genes <- length(mypreds)
p.vals <- c()
p.val.sig <- c()
for (j in 1:length(test.genes)) {
  xvals <- gene.data[j,c(1:367)]
  yvals <- trainz.cor$Y
  corr <- cor.test(xvals,yvals)
  p.vals <- append(p.vals,corr$p.value)
  if (corr$p.value <0.05){
    p.val.sig <- append(p.val.sig,corr$p.value)
  }
}
length(p.val.sig)
p.val.sig
  
trainz = data.frame(Y=ano$GA[ano$Train==1],t(gene.data[mypreds2,ano$SampleID[ano$Train==1]]))
#trainz.cor =data.frame(Y=ano$GA[ano$Train==1],t(gene.data[test.genes,ano$SampleID[ano$Train==1]]))

set.seed(69)
tr <- sample(1:nrow(trainz), 0.8*nrow(trainz))
tes <- setdiff(1:nrow(trainz),trainz)
train <- trainz[tr, ]    # training
test <- trainz[-tr, ]  
x_train <- as.matrix(train[,-1]) #for GLMNET
y_train <- as.matrix(train[,1])  #for GLMNET
x_test <- as.matrix(test[,-1])
y_test <- as.matrix(test[,1])

#ridge regression, alpha = 1
library(glmnet)
lambdas <- 10^seq(3, -2, by = -.1)
glm.fit <- glmnet(x_train,y_train,alpha =1)
cv_fit <- cv.glmnet(x_train,y_train,alpha=1,lambda=lambdas)
opt_lambda <- cv_fit$lambda.min
fit <- cv_fit$glmnet.fit
y_predicted <- predict(glm.fit,s=opt_lambda,newx=x_test)
actuals_preds <- data.frame(cbind(actuals=test$Y, predicteds=y_predicted))
rmse1 <- sqrt(mean((y_predicted-test$Y)^2))
rmse1 #5.6

#iterative code of 100 steps to select best alpha and lambda
list.of.fits <- list()
for (i in 0:100) {
  fit.name <- paste0("alpha", i/100)
  list.of.fits[[fit.name]] <-
    cv.glmnet(x_train, y_train, type.measure="mse", alpha=i/100, 
              )
}

results <- data.frame()
for (i in 0:100) {
  fit.name <- paste0("alpha", i/100)
  
  predicted <- 
    predict(list.of.fits[[fit.name]], 
            s=list.of.fits[[fit.name]]$lambda.1se, newx=x_test)
  rmse2 <- sqrt(mean((y_test - predicted)^2))
  
  temp <- data.frame(alpha=i/100, rmse2, fit.name=fit.name)
  results <- rbind(results, temp)
}
results
glmnet.best.score <- min(results$rmse2)
glmnet.best.score #5.46

#old lars
library(lars)
fit <- lars(x_train,y_train, type="lasso",trace=TRUE)
cvfit <- cv.lars(x_train,y_train,mode="step", type="lasso",trace=TRUE)
a <- summary(fit)
best.step <- fit$df[which.min(fit$Cp)]
best.step1 <- which.min(cvfit$cv)
best.step2 <- cvfit$index[best.step1]
predictions1 <- predict(fit,x_test,s=best.step1, type="fit",mode="step")
rmse4 <- sqrt(mean((predictions1$fit-test$Y)^2))
print(rmse4)
b <- coef(fit, s=best_step, mode="step")

#partitioned LARS
fold.trainz <- trainz[sample(nrow(trainz)),]
folds <- cut(seq(1,nrow(fold.trainz)),breaks=5,labels=FALSE)
list.of.folds <- list()

for(i in 1:5){
  all.test <- paste0("test.data",i)
  all.train <- paste0("train.data", i)
  x.train <- paste0("x.train",i)
  y.train <- paste0("y.train",i)
  y.test <-  paste0("y.test",i)
  x.test <-  paste0("x.test",i)
  
  testIndexes <- which(folds==i,arr.ind=TRUE)
  all.test <- fold.trainz[testIndexes, ]
  all.train <- fold.trainz[-testIndexes, ]
  list.of.folds[[x.train]] <- all.train[,-1]
  list.of.folds[[y.train]] <- all.train[,1]
  list.of.folds[[y.test]] <- all.test[,1]
  list.of.folds[[x.test]] <- all.test[,-1]
}

result <- data.frame()
rmse.sum <- 0
for (i in 1:5) {
  x.train <- paste0("x.train",i)
  y.train <- paste0("y.train",i)
  y.test <-  paste0("y.test",i)
  x.test <-  paste0("x.test",i)
  rmse <- paste0("rmse.",i)
  normal.fit <- paste0("fit.",i)
  title <- paste0("RMSE fold - ",i)
  cv_title <- paste0("CV plot- ",i)
  cv.fit <- paste0("cvfit.",i)
  best_step <- paste0("best_step",i)
  best_stepcv <- paste0("best_stepcv",i)
  predictions <- paste0("predictions.",i)
  
  list.of.folds[[normal.fit]] <- lars(as.matrix(list.of.folds[[x.train]]),as.matrix(list.of.folds[[y.train]]),type="lasso")
  list.of.folds[[cv.fit]] <- cv.lars(as.matrix(list.of.folds[[x.train]]),as.matrix(list.of.folds[[y.train]]),type="lasso")
  plot(list.of.folds[[cv.fit]]$cv,main=cv_title,ylab="CV")
  list.of.folds[[best_step]] <- list.of.folds[[normal.fit]]$df[which.min(list.of.folds[[normal.fit]]$Cp)]
  list.of.folds[[best_stepcv]]  <- which.min(list.of.folds[[cv.fit]]$cv)
  #list.of.folds[[best_stepcv]] <- list.of.folds[[cv.fit]]$index[step.cv]
  
  list.of.folds[[predictions]] <- predict(list.of.folds[[normal.fit]],list.of.folds[[x.test]],s=list.of.folds[[best_stepcv]],type="fit")$fit
  actual_pred <- data.frame(cbind(actual=list.of.folds[[y.test]], predicted=list.of.folds[[predictions]]))
  plot(list.of.folds[[y.test]],list.of.folds[[predictions]],abline(a=0,b=1),main=title)
  list.of.folds[[rmse]] <- sqrt(mean((list.of.folds[[predictions]]-list.of.folds[[y.test]])^2))
  print(list.of.folds[[rmse]])
  rmse.sum <- rmse.sum + list.of.folds[[rmse]]
  result = cbind(append(result,as.vector(list.of.folds[[rmse]]))) 
}
avg.rmse <- rmse.sum/5
avg.rmse

