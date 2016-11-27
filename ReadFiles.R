# Creating graphs
setwd("C:/Users/Zou/Desktop/OPI") 

# Read csv files
mydata1 = read.csv("2016-08.csv")
mydata2 = read.csv("2016-09.csv")
mydata3 = read.csv("2016-10.csv")



#intall and Load library
install.packages("ggplot2")
library(ggplot2)


#Converting data into hours

#Hora_retiro
mydata1$Hora_Retiro <- strptime(mydata1$Hora_Retiro, format="%H:%M:%S")
mydata2$Hora_Retiro <- strptime(mydata2$Hora_Retiro, format="%H:%M:%S")
mydata3$Hora_Retiro <- strptime(mydata3$Hora_Retiro, format="%H:%M.%S")

na.omit(mydata1)
na.omit(mydata2)
na.omit(mydata3)

mydata1$hoursR <-  as.numeric(format(mydata1$Hora_Retiro, format="%H"))
mydata2$hoursR <-  as.numeric(format(mydata2$Hora_Retiro, format="%H"))
mydata3$hoursR <-  as.numeric(format(mydata3$Hora_Retiro, format="%H"))




#Hora_Aribo
mydata1$Hora_Arribo <- strptime(mydata1$Hora_Arribo, format="%H:%M:%S")
mydata2$Hora_Arribo <- strptime(mydata2$Hora_Arribo, format="%H:%M:%S")
mydata3$Hora_Arribo <- strptime(mydata3$Hora_Arribo, format="%H:%M:%S")

na.omit(mydata1) # remove imcomplete line (with NA value)
na.omit(mydata2)
na.omit(mydata3)

mydata1$hoursA <-  as.numeric(format(mydata1$Hora_Arribo, format="%H"))
mydata2$hoursA <-  as.numeric(format(mydata2$Hora_Arribo, format="%H"))
mydata3$hoursA <-  as.numeric(format(mydata3$Hora_Arribo, format="%H"))

# plot horario
set.seed(42)

p11<-hist(mydata1$hoursR,plot=FALSE)
p12<-hist(mydata1$hoursA,plot=FALSE)

p21<-hist(mydata2$hoursR,plot=FALSE)
p22<-hist(mydata2$hoursA,plot=FALSE)

p31<-hist(mydata3$hoursR,plot=FALSE)
p32<-hist(mydata3$hoursA,plot=FALSE)

plot(0,0,xlim=c(0,24),ylim=c(0,80000) ,xlab="Horario",ylab="freq",main="Two histograms")
plot(p11,col="red",density=10,angle=135,add=TRUE)
plot(p21,col="blue",density=10,angle=135,add=TRUE)
plot(p31,col="green",density=10,angle=135,add=TRUE)

# plot Estaciones

counts <- table(mydata1$Ciclo_Estacion_Retiro)
barplot(counts, main="Estaciones", 
        xlab="Numero Estacione")



# read modified files with Excel/Python
mydataM = read.csv("Modified2016-08.csv")
mydataM$Hora_Retiro <- strptime(mydataM$Hora_Retiro, format="%H:%M:%S")
mydataM$hoursR <-  as.numeric(format(mydataM$Hora_Retiro, format="%H"))
hist(mydataM$hoursR)

