#DECISION TREE

#types:-  binary(yes/no) and this/that
#CART- Classification (binary- yes or no- coz buy was a factor) and regression tree (some numerical value)
# two types of decision trees - classification tree and regression tree

#import the rpart library

#cp= complexity parameter   if cp=-1 then it will be fully grown tree.
# default minimum split =20
# default minimum bucket = minsplit/3
#terminal node= leaf node  (these are marked by *)

library(rpart)
library(rpart.plot)

education=factor(c(3,2,2,3,2,2,3,2,2,2))
married=factor(c('S','M','S','M','M','M','S','S','M','S'))
income=c(125,100,70, 120, 95, 60, 220, 85, 75, 90)
buy=factor(c(0,0,0,0,1,0,0,1,0,1))
(data= data.frame(buy, education, married, income))
head(data)

xtabs( ~ buy + education, data=data)

table(data$buy, data$education)
dtree1 = rpart(buy ~ education + married, data=data,  minsplit=4, minbucket=2,cp=-1)
dtree1
rpart.plot(dtree1)
printcp(dtree1)

head(data)
ndata1 = data.frame(education=factor(2), married='S', income=110)
predict(dtree1, newdata=ndata1, type='class')  #want to predict if he will buy or not.
(p1=predict(dtree1, newdata=ndata1, type='prob'))
cbind(ndata1, p1)
