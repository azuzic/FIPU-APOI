# priprema podataka
cw <- data.frame(ChickWeight)
names(cw) <- c("tezina", "tjedan", "pilic", "dijeta")

pilic1 <- cw[cw$pilic == 1, ]
pilic27 <- cw[cw$pilic == 27, ]
pilic34 <- cw[cw$pilic == 34, ]
pilic50 <- cw[cw$pilic == 50, ]

############

# 4. izdvojimo podatke koje ćemo prikazati na grafikonu
dijeta1 <- cw[cw$dijeta == 1 & cw$tjedan == 12, "tezina"]
dijeta2 <- cw[cw$dijeta == 2 & cw$tjedan == 12, "tezina"]
dijeta3 <- cw[cw$dijeta == 3 & cw$tjedan == 12, "tezina"]
dijeta4 <- cw[cw$dijeta == 4 & cw$tjedan == 12, "tezina"]

par(mfrow = c(2,2))
boxplot(dijeta1, ylim = c(50,225), main = "Distribucija pilića prema težini (dijeta 1)")
boxplot(dijeta2, ylim = c(50,225), main = "Distribucija pilića prema težini (dijeta 2)")
boxplot(dijeta3, ylim = c(50,225), main = "Distribucija pilića prema težini (dijeta 3)")
boxplot(dijeta4, ylim = c(50,225), main = "Distribucija pilića prema težini (dijeta 4)")

# 5. 
# najveći raspon vrijednosti ima dijeta 2

# 6. 
# Vidimo da se stršeće vrijednosti javljaju kod dijeta 2 i 4. 
# Kod obje su prisutne maksimalne, dok su kod dijete 4 i minimalne stršeće vrijednosti.

# 7.
# raspon vrijednosti za dijetu 1:
raspon_vrijednosti <- max(dijeta1) - min(dijeta1)
raspon_vrijednosti

#ili pomoću funkcija range i diff:
range(dijeta1) # minimalna i maksimalna vrijednost

raspon_vrijednosti <- diff(range(dijeta1))
raspon_vrijednosti

# interkvartilni raspon za dijetu 1:
# računamo 3. i 1. kvartil i oduzimamo
interkvartilni_raspon <- quantile(dijeta1, 0.75) - quantile(dijeta1, 0.25)
interkvartilni_raspon

#ili pomoću funkcije IQR:
interkvartilni_raspon <- IQR(dijeta1)
interkvartilni_raspon


#8. 
# koeficijent asimetrije za dijetu 2
x <- dijeta2
N <- length(x)

mu <-  sum((x - mean(x))^3)/N
alpha <- mu/sd(x)^3
alpha

# koeficijent asimetrije za dijetu 4
x <- dijeta4
N <- length(x)

alpha <- sum((x - mean(x))^3)/(length(x)*sd(x)^3)
alpha

# 9. tumačenje koeficijenta (-2 do 2):
# 0         - simetrična distribucija
# 0   - 0.5 - približno simetrična distribucija
# 0.5 - 1   - umjerena asimetrija
# > 1       - izražena asimetrija
# tumačenje vrijedi i za negativne vrijednosti

# Kod dijete 2 je veća asimetrija (umjereno desno asimetrična distribuicija). 
# Kod dijete 4 je približno simetrična distribucija.


# 10., 12.
par(mfrow = c(1,2))
hist(cw$tezina, breaks = 15, main = "Distribucija pilića prema težini", 
     xlab = "Tezina", ylab = "Frekvencija", ylim = c(0,100))
hist(log(cw$tezina), probability = TRUE, breaks = 15, ylim = c(0,1), 
     main = "Distribucija pilića prema težini (log)", xlab = "Tezina", ylab = "Relativna frekvencija")

# 11. težina pilića nije normalno distribuirana

# 13.
t8 <- cw[cw$tjedan == 8, "tezina"] # podaci o tezinama u 8. tjednu
t12 <- cw[cw$tjedan == 12, "tezina"] # podaci o tezinama u 12. tjednu

as.t8 <- mean(t8) # prosjecna tezina u 8. tjednu
as.t8

as.t12 <- mean(t12) # prosjecna tezina u 8. tjednu
as.t12

# 14. 
sd.t8 <- sd(t8)
sd.t8

sd.t12 <- sd(t12)
sd.t12

# 15. 
p1 <- pilic1[pilic1$tjedan == 8, "tezina"]
p1 # težina u 8. tjednu = 76

p27 <- pilic27[pilic27$tjedan == 12, "tezina"]
p27 # težina u 12. tjednu = 115

# standardizacija
z1 <- (p1 - as.t8)/sd.t8
z1 # -0.938738

z27 <- (p27 - as.t12)/sd.t12
z27 # -0.417499

# oba pilića zaostaju za prosjekom, ali pilic27 zaostaje manje 
# pilic 27 zaostaje za -0.42 standardnih devijacija naspram -0.94 pilica 1

# 16.
as.d1 <- mean(cw[cw$dijeta == 1, "tezina"])
as.d2 <- mean(cw[cw$dijeta == 2, "tezina"])
as.d3 <- mean(cw[cw$dijeta == 3, "tezina"])
as.d4 <- mean(cw[cw$dijeta == 4, "tezina"])

# 17.
sd.d1 <- sd(cw[cw$dijeta == 1, "tezina"])
sd.d2 <- sd(cw[cw$dijeta == 2, "tezina"])
sd.d3 <- sd(cw[cw$dijeta == 3, "tezina"])
sd.d4 <- sd(cw[cw$dijeta == 4, "tezina"])


# 18. 
as.d1
as.d2
as.d3
as.d4

# najveća prosječna težina postignuta je na dijeti 3

# 19. koeficijent varijacije
V.d3 <- (sd.d3/as.d3)*100
V.d3 # 60.53988

# aritmetička sredina nije dovoljno reprezentativna (V > 50%)
