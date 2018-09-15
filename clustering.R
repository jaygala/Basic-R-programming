#  CLUSTERING

#all the data should be numerical

age= ceiling(rnorm(30, mean=22, sd=2))
age
df=data.frame(age)
km=kmeans(df,center=3)   #this will cluster it
km$withinss    #these are sum of squares.
km$iter

marks=ceiling(rnorm(30, mean=65,sd=10))
df=data.frame(age,marks)
head(df)
km= kmeans(df,center=4)
km

iris
table(iris$Species)

data=iris[-5]   #removes the last column
head(data)

km1=kmeans(data,centers = 1)
km1$tot.withinss

km2=kmeans(data,centers = 2)
km2$tot.withinss
km2$withinss

km3=kmeans(data,centers = 3)
km3$tot.withinss
km3$withinss

km4=kmeans(data,centers = 4)
km4$tot.withinss
km4$withinss

km5=kmeans(data,centers = 5)
km5$tot.withinss
km5$withinss

km1$tot.withinss; km2$tot.withinss ; km3$tot.withinss ; km4$tot.withinss ; km5$tot.withinss

#Selecting the number of clusters
library(NbClust)
nc = NbClust(data, distance="euclidean",min.nc=2, max.nc=15, method="average")

kiris = kmeans(data, centers=3)
kiris$centers

cbind(iris$Species, data, kiris$cluster)


names(mtcars)
data2 = mtcars[c('mpg','disp','hp','wt')]
head(data2)
nc = NbClust(data2, distance="euclidean",min.nc=2, max.nc=15, method="average")
det(as.matrix(mtcars))
?na.action
km3= kmeans(data,centers=3)
km3$tot.withinss

cbind(km1$tot.withinss, km2$tot.withinss, km3$tot.withinss, km4$tot.withinss,km5$tot.withinss)

#we select no clusters at elbow point
#adding more clusters does not significantly reduce total withinss