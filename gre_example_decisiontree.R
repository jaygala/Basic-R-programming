#DECISION TREE - LOGISTIC REGRESSION GRE EXAMPLE 

df =  read.csv("https://stats.idre.ucla.edu/stat/data/binary.csv")
head(df)
library(rpart)
library(rpart.plot)
df$rank= factor(df$rank)
df$admit= factor(df$admit)
dim(df)
dtree3= rpart(admit ~ . , data=df)
dtree3   #print tree  
rpart.plot(dtree3)   #plot tree
printcp(dtree3)   #print cp table

ptree3=prune(dtree3,cp=0.0236)
ptree3
rpart.plot(ptree3,nn=T)   #nn means node number

#predict
library(dplyr)
ndata2=sample_n(df,3)  #randomly chooses 3 cases
ndata2
predict(dtree3,newdata= ndata2, type="class")
predict(ptree3,newdata= ndata2, type="class")   #better do this than the above one 
predict(dtree3,newdata= ndata2, type="prob")
