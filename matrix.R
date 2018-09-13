#matrics

m=matrix(c(1,2,3,4,5,6,7,8,9), nrow=3, ncol=3)    #creeates a matrix. follow the syntax
m
?matrix

m1=matrix(1:12, nrow=4)
m1

marks3=floor(runif(30,50,90))    #30 values from uniform distribtuion btw 50 and 90
marks3   
?runif

m2=matrix(marks3,nrow=6)   #this prints column wise so 2nd element is below the first
m2 

m3=matrix(marks3,nrow=6, byrow=T)   #this prints row wise so 2nd element is next to the first 
m3

(x=1:5)   #mean the same thing. used to assign values.
(x1<-1:5)

colSums(m3)  #sum of each column
rowSums((m3))

colMeans(m3)  # calculates mean
rowMeans(m3)

sum(m3)  # sum of all elemts

m3 [m3>75]  #prints elemts greater thn 75

m3[1,]  #prints 1st row
m3[,3] #prints 3rd column

m3[3,5]  #3rd row n 5th coulmn elemeny ... so only one elemt

m3[1:2,3:5]
