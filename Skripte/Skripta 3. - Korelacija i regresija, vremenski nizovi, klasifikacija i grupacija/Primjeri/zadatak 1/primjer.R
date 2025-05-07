vino <- read.csv("vino.csv")

#1. 
str(vino)
# 25 opservacija i  7 varijabli

#2. 
sum(is.na(vino))
# nema nedostajucih vrijednosti

#3.
cor(vino$KisaZima, vino$FrPop)

#4. 
# Pearsonov koeficijent korelacije iznosi -0.001621627
# izrazito slaba negativna linearna korelacija, odnosno nema linearne korelacije

#5.
cor(vino)

#6.
# najjaca korelacija je izmedju varijabli 
# "Godina" i "Starost" 
# savrsena negativna korelacija, r = -1

#7.
#install.packages("corrgram)
library("corrgram")
library("corrplot")

corrgram(vino, diag.panel = panel.minmax, lower.panel = panel.shade, upper.panel = NULL)
corrplot(cor(vino))
corrplot(cor(vino), method = "number")

#8. 
# najjaca pozitivna korelacija je izmedju varijabli 
# "Godina" i "FrPop", r = 0.994

# najjaca negativna korelacija je izmedju varijabli 
# "Godina" i "Starost" (r = -1) te "Starost" i "FrPop" (r = -0.994)

#9.
model1 <- lm(Cijena~FrPop, data = vino)

#10. 
summary(model1)
# koeficijent regresije iznosi -0.00008284

#11. 
# koeficijent predstavlja očekivanu promjenu zavisne varijable (Cijena) 
# za promjenu nezavisne varijable (FrPop) od 1 jedinice

#12.
# koeficijent je statistički značajan (*)
# Pr(>|t|) < 0.05

#13.
# modelom je objasnjeno 0.218 (21.8%) varijacije cijene vina

#14. 
x <- vino$FrPop
y <- vino$Cijena

plot(x, y, xlab = "Broj stanovnika", ylab = "Cijena", main = "Ovisnost cijene vina o broju stanovnika")
abline(model1, col= "red")

#15.
cor(vino$Cijena, vino$ProsTemp)
# r = 0.65956286

model2 <- lm(Cijena~ProsTemp, data = vino)

#16. 
summary(model2)
# koeficijent je statistički zanačajan (***)
# Pr(>|t|)  < 0.001

#17. 
# koef. determinacije  = 0.435, u prehodnom modelu je manji
# drugi model bolje objašnjava varijacije cijene

#18. 
model3 <- lm(Cijena~., data = vino)
summary(model3)

#19
# nema podataka za varijablu "Starost"
# to ukazuje na problem multikolinearnosti

#install.packages("car")
library("car")

# testiranje multikolinearnosti
vif(model3)
# Error in vif.default(model3) : 
# there are aliased coefficients in the model

# "Starost" je izvedena iz "Godine"
# to je ista varijabla iskazana na drugaciji nacin


# 20. 
model4 <- lm(Cijena~.-Godina, data = vino)
summary(model4)

#21. 
# korigirani koeficijent determinacije iznosi 0.7845
# modelom je objašnjeno 78.45% varijacije cijene

#22.
# "Starost" i "FrPop" nisu statisticki znacajne
# Pr(>|t|) > 0.05

#DODATNO: provjera multikolinearnosti
vif(model4)
sqrt(vif(model4)) > 2
# test ukuazuje da i nakon uklanjanja varijable "Godine" 
# i dalje postoji problem multikolinearnosti
cor(vino$Starost, vino$FrPop)
# postoji jaka (gotovo savrsena) korelacija izmedju varijabli 
# r = -0.9944851

#23.
model5 <- lm(Cijena~ProsTemp + KisaZetva, data = vino)

# 24.
summary(model5)
# korigirani koef. determinacije iznosi 0.6808

#25.
vinoTest <- read.csv("vinoTest.csv")
vinoTest

#26.
predvidjene <- predict(model5, newdata = vinoTest)
predvidjene

#27.
vinoTest$Cijena - predvidjene
# 1. -0.02802642 
# 2. -0.60313282

#28.
# u oba slucaja predvidjene vrijednosti su vise od stvarne cijene vina
# model je precijenio cijenu vina

#29.
#install.packages("leaps")
library(leaps)

regsubsets(Cijena~., data = vino)
#1  linear dependencies found
# potrebno je izbaciti ili "Starost" ili "Godina"

subset <- regsubsets(Cijena~.-Godina, data = vino)
plot(subset, scale = "adjr2")
summary(subset)

model6 <- lm(Cijena~.-Godina-Starost, data = vino)

#30.
summary(model6)
# korigirani koef. determinacije iznosi 0.7952 

#DODATAK: provjera multikolinearnosti
sqrt(vif(model6))>2
# vise nema problema