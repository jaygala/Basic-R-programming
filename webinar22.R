mtcars
women

dim(mtcars) #dimensions of data set i.e. rows and columns
names(mtcars) #column names
row.names(mtcars) #row names
str(mtcars)
head(mtcars)
summary(mtcars) #check it out, its useful

#nominal data - category without any order eg- gender 
# so you basically count the no. of men and women
# here am,vs are nominal data 

table(mtcars$am)  #this gives you the count of 0s and 1s in am

library(dplyr)
mtcars %>% group_by(am) %>% tally()
mtcars %>% group_by(am) %>% count()
mtcars %>% group_by(am) %>% summarise(n=n())
table(mtcars$am, mtcars$vs, dnn=c('am','vs'))


#group by am: find count and mean mileage
mtcars %>% group_by(am) %>% summarise(n=n(),mean(mpg))

#group by cyl: count and find min hp and max weight
mtcars %>% group_by(cyl) %>% summarise(n=n(),min(hp),max(wt))

#list all cars with mileage > 25
mtcars[ mtcars$mpg >25,]  #comma is put to say that i want all the columns
mtcars[ mtcars$mpg >25,c(1,3,5)] #select 1,3,5th columns
mtcars %>% filter(mpg>25)

#list all cars with wt>2 or gear=4  and select the columns - mpg,cyl,gear,wt
mtcars %>% filter(wt>2 | gear==4) %>% select(mpg,cyl,gear,wt)

#sort the above data based on mileage
mtcars %>% filter(wt>2 | gear==4) %>% select(mpg,cyl,gear,wt) %>% arrange(mpg)

#ascending and desceding
mtcars %>% arrange(mpg,desc(hp))

#random selection of rows
mtcars %>% sample_n(2)
mtcars %>% sample_frac(.2) #20% of the rows
