#LINEAR REGRESSION

#Simple linear regression - one independent variable only
#multiple linear reg- more than one independent variab
#the dependent variable (y)- has to be continuous(not discrete) || while independent variable (x) - can be numerical or binary
#examples- (Y|Xi)
  #1. weight ~ height
  #2. mpg~ wt+ hp+cyl+gear

#LR i sdone on a data frame
women
str(women)
cor(women$height, women$weight)   #correlational
cov(women$height, women$weight)   #covariance - positive or negative relation - if positive then- if one is increasing the other is increasing and vice versa for negative relation
plot(women$height, women$weight)

#creating lnear Model - 
fit1= lm(weight~ height, data=women)  #fit1 is just a name of variable. can be anything
#y(dependent variable) is on the left of ~ and all x (independent variables are on the right of the ~)
summary(fit1)

# F statistic ka p value - cut off is 0.05 .. if less than 0.05 then you can say that yes, there is a linear regession. i.e. if p<0.05 then you can do a linear modelling

#Multiple R squared value is used when theere is only one x. And adjusted r squared should be used when there are more than one x. R square is always between 0 to 1. Closer to 1 is better. it means that (r-square) % of the variation in y is because of the variation in x.

#y=mx+c.. c is intercept and m is slope(below the intercept in summary())

#p value of a particular indep variable(i.e. in the coefficents table of summary).. if p<0.05. then that variable is significant means that it is an imp part in predicting the dependent variable.

#we can use the linearmodel only in its range

#residuals are the diff netween the actual  value and the predicted value ()