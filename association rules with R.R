###### run example to learn: load the grocery data into a sparse matrix
library(arules)
library (RColorBrewer) 
groceries <- read.transactions("~/Desktop/groceries.csv", sep = ",")
summary(groceries)
rules=apriori(groceries,parameter=list(support=0.02,confidence=0.3,minlen=2))  
rules
plot(rules, method = 'graph') 
#################################### couture 
couture <- read.transactions("~/Desktop/couture.csv", sep = ",")
rules= apriori(couture,parameter=list(support=0.03,confidence=0.3,minlen=2))  
rules
rules<-sort(rules,by='lift')
plot(rules[1:20], method = 'graph') 
plot(rules, method = 'grouped')
rulesdf <- as(rules, 'data.frame')  
write.table(rulesdf,'~/Desktop/rules111.csv',append = F,sep=',')

plot(rules[1:200], 
     control=list( col = rev(brewer.pal(8, 'red')), shading = 'lift',
     method = 'grouped'）
     
#################################### prestige 

prestige <- read.transactions("~/Desktop/prestige.csv", sep = ",")
rules2= apriori(prestige,parameter=list(support=0.03,confidence=0.3,minlen=2))  
rules2
rules2<-sort(rules2,by='lift')
plot(rules2[1:20], method = 'graph') 
rules2_df <- as(rules2, 'data.frame')  
write.table(rules2_df,'~/Desktop/rules22223.csv',append = F,sep=',')


rules2_df
plot(rules2[1:20], method = 'graph')  


plot(rules, method = 'grouped', control = list(k = 50))

plot(rules, method = 'paracoord')


plot(rules2[1:200],control=list( col = rev(brewer.pal(9, 'Greens')), shading = 'lift',method = 'grouped')

