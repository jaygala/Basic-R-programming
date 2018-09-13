#date frames

#roll no, name, batch, gender, marks1, marks2

(rollno= 1:30)
name = paste('student',1:30,sep='-')   # student-1 student-2 and so on
name

(batch=sample(c(2016,2017,2018) ,size=30, replace=T))
table(batch)

(gender=sample(c('M','F'), size=30, replace=T))
table(gender)

(marks1= rnorm(30, mean=65, sd=7))
(marks2= rnorm(30,mean=60, sd=10))

df=data.frame(rollno, name, batch, gender, marks1, marks2, stringsAsFactors = F)  #so strings wont be converted to factors
df

summary(df)
str(df)

df$name  #prints name
df$batch

#i want to convert gender and batch into a factor
df$gender=factor(df$gender)
df$batch= factor(df$batch, ordered = T, levels = c('2016','2017','2018'))
str(df)
df

#converting numeric to charcter:
df$rollno=as.character(df$rollno)
summary(df)

str(df)    #structure
length(df)  #gives number of columns

head(df,n=3)   #prints first 3 rows.. if n=3 not mentioned then default is 6
tail(df,n=5)   #prints last 5 rows

dim(df)  #dimension

nrow(df)   #no. of rows
ncol(df)

names(df)  #name of columns

df[1:2, 1:4]   #first two rows and first four columns

df[c(1,3),c(1,2,6,5)]   #prints 1st and 3rd row and 1,2,6,5 th coulmns

df[df$gender=='M',]   #prints only males here and displays all the columns

df[df$gender=='M',1:2] #prints males and 3rd to 5th coulmns

df[df$gender=='M'&df$marks1>70,]  #prints males with marks1 more than 70

nrow(df[df$gender=='M'& df$batch=='2018',])  #number of males in 2018 batch


#SORTING AND ARRANGING
sort(df$marks1)   #sorts the marks them wrt marks1
order(df$marks1)   #prints the index number of ppl in asceding order of marks 

df[order(df$marks1),]  # sorts the dataframe wrt marks1

rev(sort(df$marks1))   #revereses the order

df[order(df$gender, df$batch),]  #arranges everyne first wrt gender and in that wrt batch

df[order(gender, -batch),]#same as above but 2018 comes first then 2017 then 2016



#SUMMARY/AGGREGATING
aggregate(df$marks1,by=list(df$batch), FUN=mean)  #finds mean of marks1 according to batch

aggregate(marks1~ batch, data=df, FUN=mean)

aggregate(cbind(marks1, marks2) ~ batch, data=df, FUN=mean)

aggregate(cbind(marks1, marks2) ~batch+gender, data=df, FUN=mean)

aggregate(cbind(marks1, marks2) ~gender+batch, data=df, FUN=mean)

aggregate(cbind(marks1, marks2) ~batch+gender, data=df, FUN=max)  #function changed to max 


#CONVERTING IT TO CSV FILE
df
write.csv(df,"./data/student_data.csv")

df3=read.csv("./data/student_data.csv")
df3
df3=df3[,-1]  #removing 1st column
