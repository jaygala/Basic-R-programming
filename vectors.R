#Hierarchial levels of analysis
  #1.Descriptive (what has happened) - Aggregation, Clustering Summary of Data
  #2.Diagnostics (Why did it happen) -  Correlation, relationships
  #3.Predictive (What will happen) - Linear regression, classification  // linear regression - continuous kind, logistic regression - binary output- like yes or no. 
  #4.Prescriptive (What to do?) - Linear programming


#vector

x = c(1,2,3) #makes a vector with 1,2,3. c is used to concatnate 
x1=1:100000 #makes a vector with numbers from 1 to 100000.
length(x1) #length of  a vector
x #prints the vector x

x2=seq(10,100,2) #A sequence startes from 10 to 100 and with gaps of 2
x2
?seq #manual page for seq command

x3=seq(from=10,to=100,by=3) #Here the gap between numbers is 3
x3

#creating a new bookmark with four -
#numeric vector ----

marks=rnorm(30, mean=60, sd=10)  #generates 30 random values using normal distribution with mean 60 and standard deviation of 10
marks
(marks=rnorm(30, mean=60, sd=10))   #assigns and prints together (we just added a bracket)

#To calculate mean, median, mode,sd, variance
mean(marks)
median(marks)
mode(marks) #no mode
sd(marks)
var(marks)

# 4 types of Data :-
#nominal type of data - no drder (eq: gender)
#ordinal type of data - there is an order i.e. something is better than the other thing. but we dont know the difference in magnitude between them. (eg- good and bad but we dont know the differnec btw good and bad) 
#interval data - there is no absolute zero
#ratio data - BEST TYPE OF DATA. we can do anything with this
# these are the 4 types of data

#can only find mean in interval and ratio
#can find mode in all 4 data types
#can find median in all except nominal

summary(marks) # shows minimum and max value, 1st and 3rd quantile, median, mode
range(marks)

#Properties of vector (DS):-
length(marks)  #length of the vector
str(marks)   #structure of the vector
class(marks)  #what class is it - numeric or what

#histogram is made for a continuous date not a discrete data
hist(marks)

#to plot a curve
plot(density(marks))




#character vector ----

names=c('Ram','Shyam', 'Messi', 'Iniesta')
names

length(names)
mean(names) #you cant have a mean of characters. ERROR
class(names)
summary(names)  #shows length, class, mode

gender=c('M','F','M')
summary(gender)

#but we want it to be a factor and a vector
genderf= factor(gender)
summary(genderf)

grades=c('A','B','C','D','A','D','A')
grades
#we want to create an hierarchy alson now
gradesF=factor(grades, ordered=T)  #we want it to be ordered data (hierarchial ddata) so we wrote ordered=T
summary(gradesF)
gradesF   #shows levels

#now we want diiffeeret hierarchy D,B,A,C
gradesF1= factor(grades, ordered=T, levels=c('D','B','A','C'))
summary(gradesF1)
gradesF1
table(gradesF1)

table(gender)
table(genderf)

#want to plot some graphs
barplot(table(gradesF1))
pie(table(gradesF1))


#logical vector ----

married=c(TRUE,FALSE,T,T,F,T,FALSE,TRUE)
married
sum(married)   #counts the number of trues
summary(married)    #why is false coming before true?? - because it follows alphabetical order
table(married)
class(married)

pie(table(married))


#subset of marks
marks
trunc(marks)  #truncates the values to integers DOESNT ROUNG OFF
round(marks,1)  #round of to 1 decimal place
floor(marks)  #takes the lower integer value
ceiling(marks)   #takes the higher integer value

marks1=trunc(marks)
marks1

marks1[1]
marks1[27]
marks1[1:5]  #first 5 values to be printed
marks1[-2]    #prints all values excppet 2nd position value
marks1[-c(10:15)]  
marks1[c(1,5,10,15)]    #prints only 1,5,10,15 th values
mean(marks1[c(1,5,10,15)])

marks1[marks1>60]   #prints only the ones above 60
marks1>60   #prints TRUE FLASE for each value
marks1[marks1>60 & marks1<65]




gender2=sample(c('M','F'), size=2)  #take 2 random samples
gender2

gender2=sample(c('M','F'), size=30, replace=T)  #take 30 random samples
gender2

gender2=sample(c('M','F'), size=30, replace=T, prob=c(.6,.4))
gender2
table(gender2)
prop.table(table(gender2))

set.seed(123)
gender3=sample(c('M','F'), size=30000, replace=T, prob=c(.6,.4))
gender3
table(gender3)
prop.table(table(gender3))
