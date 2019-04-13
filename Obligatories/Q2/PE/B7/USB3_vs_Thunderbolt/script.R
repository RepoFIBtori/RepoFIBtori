dades <- read.table("clipboard",header=T,dec=',')		# LLEGIR TAULA

n <- dades$arxiu; n
grandaria <- length(n); grandaria
tempsUSB <- dades$USB; tempsUSB
tempsTB <- dades$TB; tempsTB
velUSB <- dades$VelUSB; velUSB
velTB <- dades$VelTB; velTB
ratio <- dades$Ratio; ratio

# *******************************************************************************

# DESCRIPTIVA de les dades: 
# descriptiva velUSB: summary(velUSB)... hist() boxplot()

summary(velUSB)
varUSB <- var(velUSB); varUSB
sdUSB <- sd(velUSB); sdUSB
hist(velUSB)
boxplot(velUSB)

# descriptiva velTB: summary(velTB)... hist() boxplot()

summary(velTB)
varTB <- var(velTB); varTB
sdTB <- sd(velTB); sdTB
hist(velTB)
boxplot(velTB)

# Boxplot conjunt de velUSB amb velTB

boxplot(velUSB, velTB, names = c("velUSB", "velTB"), main = "BoxPlot velUSB vs velTB", ylab = "Velocitat(MB/s)")

# descriptiva ratio: summary(ratio)... hist() boxplot()

summary(ratio)
varratio <- var(ratio); varratio
sdratio <- sd(ratio); sdratio
hist(ratio)
boxplot(ratio)

# ********************************************************************************


# PH i IC. Segons analisi premises de normalitat decidir si fer inferencia amb o sense logs 

# Grafic de RATIO
qqnorm(ratio)
qqline(ratio)

# LOG DE RATIO
ratiolog <- log(ratio)

# Descriptiva de log de ratio:
summary(ratiolog)
varratiolog <- var(ratiolog); varratiolog
sdratiolog <- sd(ratiolog); sdratiolog
boxplot(ratiolog)

# Grafic de LOG DE RATIO
qqnorm(ratiolog)
qqline(ratiolog)

# ***********************************

t.test(ratio,mu=1,alternative="greater")		# H0: mu = 1; H1: mu > 1;
t.test(ratio,mu=1.5,alternative="greater")		# H0: mu = 1.5; H1: mu > 1.5;

# ********************************************************************************

# MODEL LINEAL

modelD <- lm(velUSB~velTB); modelD			# modelC = velTB respecte velUSB
summary(modelD) 						# coeficients de modelC

plot(velTB,velUSB)					# grafic modelC
abline(modelD)

par(mfrow=c(2,2))
plot(lm(velUSB ~ velTB),c(2,1)) # QQ-Norm i Standard Residuals vs Fitted
hist(rstandard(lm(velUSB ~ velTB))) # Histograma dels residus estandaritzats
plot (1:81,rstandard(lm(velUSB ~ velTB)),type="l")

