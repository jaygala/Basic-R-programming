library(dplyr)
mtcars
head(mtcars)
names(mtcars)
mtcars %>% group_by(gear)
mtcars %>% group_by(gear) %>% summarise(mean(mpg),max(mpg))
mtcars %>% group_by(gear, carb) %>% summarise(mean(mpg),max(mpg),min(hp))
mtcars %>% group_by(gear) %>% summarise_all(mean)

mtcars %>% filter(mpg>25) %>%select(mpg, gear)
?summarise_if  #summarise_if(is.numeric, mean)

#SUMMARISE WILL WORK ON A GROUP ONLY.

iris
count(iris,Species)
#count(gear,3)
count(mtcars,gear)
