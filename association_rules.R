#MARKET BASKET ANALYSIS
#Association Rule Analysis


install.packages('arulesViz')
install.packages('timeSeries')
install.packages('forecast')
install.packages('zoo')
install.packages('lubridate')

#X => Y :
#  Support = number of times x and y are bought together / total number of buys
#  Confidence = number of time x and y are bought together / number of times x was bought
#  Lift = support(x and y) / [(number of times x was bought / total) * (number of times y was bought / total)]
  
#  Lift :  >1 - Strong relation
#          =1 - No relation
#          <1 - Negative relation
  


#What if we find (X => Y) they have high support, high confidence, high positive lift..
#  this means that if somone is buying x then it is more likely that he will also buy y. i.e. x and   y is usually bought together (eg: samosa, chai)
#    - put x and y closer in the store
#    - can put them far away also(so that customer moves around the store) - use only if 
#    - package x with y 
#    - package x and y with poorly selling item 
#    - give discoount only on one of x and y
#    - increases the price of x and lower the price of y (or vice versa)
  



 # Association Rules - Groceries data set ####
  
  library(arules)  #install first
  library(arulesViz) #install first
  library(datasets)  # no need to install, just load it reqd for Groceries
  data('Groceries')
  Groceries
  
  #Structure of Groceries
  str(Groceries)
  Groceries
  inspect(Groceries[1:5])  #view
  LIST(Groceries[1:6])  #another view
  
  #Find Frequent Itemset
  frequentItems = eclat (Groceries)   #default  supp = 0.1
  
  frequentItems = eclat (Groceries, parameter = list(supp = 0.01, minlen= 2, maxlen = 5)) # eclat - counts the number of items each combination of items were bought.   supp = 0.01 means an item should be purchased atleast 1% of the times
  #minlen =2 means that it will show bundle/combination of min 2 items   (i.e which two items were purchased togther and their count should be more than supp)
  #maxlen = 5 means that it will show bundle of max 5 items
  
  inspect(frequentItems)
  frequentItems
  inspect(frequentItems[10:100])
  #inspect(frequentItems[100:122])
  #Descending Sort frequent items by count : 1 to 25 itemsets
  inspect(sort (frequentItems, by="count", decreasing=TRUE)[1:25])   #sorting it
  inspect(sort (frequentItems, by="count", decreasing=F)[1:25])
  
  #Support is : support(A&B) = n(A&B)/ N
  #Plot the Frequency Plot
  itemFrequencyPlot(Groceries,topN = 15,type="absolute")  #plots the frequency of each item. and hence we can fing out which was sold maximum items. 
  itemFrequencyPlot(Groceries, topN = 10, type='relative')   #this is percentage wise
  abline(h=0.2)   #makes line at 20%. to check what is sold more than 20%of the times
  
  # Create rules and the relationship between items
  #parameters are min filter conditions 
  rules = apriori(Groceries, parameter = list(supp = 0.005, conf = 0.5, minlen=2))  #conf also there here. POWERFUL COMMAND
  rules
  inspect (rules[1:5])
  #Sort Rules by confidence, lift and see the data
  rulesc <- sort (rules, by="confidence", decreasing=TRUE)
  inspect(rulesc[1:5])
  rulesl <- sort (rules, by="lift", decreasing=TRUE)
  inspect (rulesl[1:5])
  #which items have strong confidence and lift 
  
  #How To Control The Number Of Rules in Output ?
  #maxlen, minlen, supp, conf
  rules2 = apriori (Groceries, parameter = list (supp = 0.001, conf = 0.5, minlen=2, maxlen=3)) 
  inspect(rules2[1:5])
  
  # Are there any duplicate/ Redundant Rules 
  #https://rdrr.io/cran/arules/man/is.redundant.html
  
  sum(is.redundant(rules2))
  (redundant = which(is.redundant(rules2)))
  inspect(rules2[redundant])
  #inspect(subset(rules2, subset=lhs %ain% c('citrus fruit','rice') & rhs %in% 'whole milk' ))
  #remove it
  rulesNR = rules2[-redundant] 
  is.redundant(rulesNR)
  sum(is.redundant(rulesNR))  #ok now
  
  
  
  #Find what factors influenced an event ‘X’
  rules3 = apriori (data=Groceries, parameter=list (supp=0.002,conf = 0.8), appearance = list (default="lhs",rhs="whole milk"), control = list (verbose=F))     #means that which all items are bought with whole milk with confidence>0.8
  inspect(rules3[1:5])
  inspect(rules3)
  
  #Find out what events were influenced by a given event
  subset1 = subset(rules2, appearance = list (default="lhs",rhs="whole milk"))
  inspect(subset1)
  subset1 = subset(rules2, subset=rhs %in% 'bottled beer' )
  inspect(subset1)
  inspect(rules2)
  subset2 = subset(rules2, subset=lhs %ain% c('baking powder','soda') )  #ain is and , in is or
  inspect(subset2)
  subset2a = subset(rules2, subset=lhs %in% c('baking powder','soda') )
  inspect(subset2a)
  
  
  
  
  subset3 = subset(rules2, subset=rhs %in% 'bottled beer' & confidence > .7, by = 'lift', decreasing = T)
  inspect(subset3)
  subset4 = subset(rules2, subset=lhs %in% 'bottled beer' & rhs %in% 'whole milk' )
  inspect(subset4)
  
  #Visualizing The Rules -----
  plot(subset1[1:10]) 
  plot(subset1[1:10], measure=c("support", "lift"), shading="confidence")
  
  #
  
  
  rules4 = apriori (data=Groceries, parameter=list (supp=0.001,conf = 0.4), appearance = list (default="rhs",lhs=c('tropical fruit','herbs')), control = list (verbose=F))
  inspect(rules4[1:5])
  inspect(rules4)