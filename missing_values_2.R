data=mtcars
data=fix(data)
sum(is.na(data))
complete.cases(data)   #shows true if it is complete i.e. no missing values.
sum(complete.cases(data))   #total number of rows with complete data
sum(!complete.cases(data))

data[!complete.cases(data),]  #prints the whole row which has incomplete data
