dades <- read.table("clipboard",header=T,dec=",")

grandaria <- dades$Grand
temps1 <- dades$Temps1
temps2 <- dades$Temps2

# DESCRIPTIVA de les dades: 
# descriptiva temps1: summary(temps1)... hist() boxplot() qqnorm() qqline()
# descriptiva temps2: summary(temps2)... hist() boxplot() qqnorm() qqline()
# també es pot afegir descriptiva de les continues en funció de les discretes

# PH i IC. Segons analisi premises de normalitat decidir si fer inferencia amb o sense logs 
dif <- temps1-temps2       # i descriure-la: summary(dif)...
par(mfrow=c(1,2))
boxplot(dif)
qqnorm(dif)
qqline(dif)
diflog <- log(temps1)-log(temps2)    # i descriure-la: summary(dif)...
par(mfrow=c(1,2))
boxplot(diflog)
qqnorm(diflog)
qqline(diflog)

# MODEL LINEAL. Comparar 3 possibles models
par(mfrow=c(1,3))
plot(grandaria,dif)
abline(lm(dif~grandaria))
plot(grandaria,diflog)
abline(lm(diflog~grandaria))
plot(temps1,temps2)
abline(lm(temps2~temps1))

modelA <- lm(dif~grandaria)
modelA
summary(modelA) 

modelB <- lm(diflog~grandaria)
modelB
summary(modelB) 

modelC <- lm(temps2~temps1)
modelC
summary(modelC) 

#VALIDACIÓ DEL MODEL LINEAL
par(mfrow=c(2,2))
plot(modelA,c(2,1))  
hist(rstandard(modelA))    
plot(1:25,rstandard(modelA),type="l")	

par(mfrow=c(2,2))
plot(modelB,c(2,1))  
hist(rstandard(modelB))    
plot(1:25,rstandard(modelB),type="l")	

par(mfrow=c(2,2))
plot(modelC,c(2,1))  
hist(rstandard(modelC))    
plot(1:25,rstandard(modelC),type="l")	
