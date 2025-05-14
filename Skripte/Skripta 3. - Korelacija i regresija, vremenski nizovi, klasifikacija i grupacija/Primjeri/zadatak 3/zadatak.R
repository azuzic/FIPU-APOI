# 1. Učitajte podatke iz datoteke „day.csv“ u data frame naziva bike uz postavku da se ne izvrši
# automatsko pretvaranje znakovnih nizova u „factor“.
bike <- read.csv("day.csv", stringsAsFactors = FALSE)
str(bike)


# 2. Pretvorite dteday u datum formata „godina-mjesec-dan“. 
bike$dteday <- as.Date(bike$dteday, format = "%Y-%m-%d")
str(bike)


# 3. Pomoću linijskog grafikona prikažite broj posudbi (cnt) prema danima (dteday).
plot(bike$dteday, bike$cnt, type = "l") 


# 4. Na koji je datum bilo najviše, a na koji najmanje posudbi?
bike[which.max(bike$cnt), c("dteday", "cnt")] #2012-09-15, 8714
# najvise posudbi (8714) bilo je 15.9.2012. 

bike[which.min(bike$cnt), c("dteday", "cnt")] #22, outlier
# najmanje posudbi (22) bilo je 29.10.2012.


# 5. Pretvorite cnt u vremenski niz te ga očistite od nedostajućih vrijednosti i outliera (ako ih ima).
# Podatke spremite u varijablu cnt.clean.
# install.packages("forecast")
library("forecast")

# pretvaranje u vremenski niz
cnt.ts <- ts(bike[, c("cnt")], frequency = 365) 

# ciscenje
bike$cnt.clean <- tsclean(cnt.ts)


# 6. Usporedite grafički originalni niz i očišćeni niz (cnt.clean).
par(mfrow=c(1,2))
plot(bike$dteday, bike$cnt, type = "l")
plot(bike$dteday, bike$cnt.clean, type = "l")


# 7. Napravite 3 nova niza tako da cnt.clean zagladite pomoću pomičnih prosjeka reda 7, 15 i 30.
bike$cnt.ma7 <- ma(bike$cnt.clean, order = 7)
bike$cnt.ma15 <- ma(bike$cnt.clean, order = 15)
bike$cnt.ma30 <- ma(bike$cnt.clean, order = 30)


# 8. Prikažite grafički cnt.clean i nizove pomičnih prosjeka.
par(mfrow=c(2,2))
plot(bike$dteday, bike$cnt, type = "l", main = "Originalni")
plot(bike$dteday, bike$cnt.ma7, type = "l", main = "MA (7)")
plot(bike$dteday, bike$cnt.ma15, type = "l", main = "MA (15)")
plot(bike$dteday, bike$cnt.ma30, type = "l", main = "MA (30)")


# 9. Izvršite aditivnu dekompoziciju vremenskog niza. Za koliko se promijenio broj posudbi zbog
# sezonskog utjecaja na dan 6.1.2011.?
dekomp <- stl(bike$cnt.clean, s.window = "periodic") 
idx <- which(bike$dteday == "2011-01-06")
dekomp$time.series[idx,]

# broj posudbi se smanjio za 961.724


# 10. Izvršite multiplikativnu dekompoziciju vremenskog niza kosristeći originalne podatke. Za koliko
# se promijenio broj posudbi zbog sezonskog utjecaja na dan 1.1.2011.?
# multiplikativna 

# logaritmiranje vrijednosti niza
log.bike <- ts(log(bike$cnt), frequency = 365)

# multiplikativna dekompozicija
dekomp.log <- stl(log.bike, s.window = "periodic") 

# pronalazenje idneksa trazenog datuma
idx <- which(bike$dteday == "2011-01-01")
dekomp.log$time.series[idx,]
#-0.7135305

# interpretacija
exp(dekomp.log$time.series[idx,]) # uklanjanje logritma
#0.4899115
1-0.4899115 #0.5100885
# zbog sezonskog utjecaja na dan 1.1.2011. smanjen je broj posudbi za 51%


# 11. Prikažite grafički rezultat dekompozicije
plot(dekomp.log)


##### ARIMA 
# pretpostavke: stacionarni niz
# koraci:
# provjera stacionarnosti - adf.test
# diferenciranje (ako je potrebno)
# acf i pacf za odredjivanje parametara modela
# model
# evaluacija
# predvidjanje


# 12. Koristit ćemo zaglađene podatke (reda 7). Uklonite nedostajuće vrijednosti.
sum(is.na(bike$cnt.ma7)) #ima NA na pocetku i kraju niza
ma7 <- na.omit(bike$cnt.ma7)


# 13. Izvršite provjeru stacionarnosti vremenskog niza. Je li niz stacionaran? 
#install.packages("tseries")
library("tseries")

adf.test(ma7) 
#p-value = 0.9863 > 0.05
# ne odbacujemo nul hipotezu da niz nije stacionaran


# 14. Izračunajte prvu diferenciju niza. Ponovite test stacionarnosti. Je li niz stacionaran? 
ma7.diff <- diff(ma7, 1)
adf.test(ma7.diff) 
# p-value = 0.01 < 0.05
# odbacujemo nul hipozetu da niz nije stacionaran


# 15. Provjerite pomoću odgovarajuće funkcije broj diferenciranja potreban da bi niz postao
# stacionaran. Odgovara li rezultat onome iz zadatka 14.?
ndiffs(ma7) #dovoljno 1


# 16. Grafički usporedite nizove prije i nakon diferenciranja. 
par(mfrow = c(2,1))
plot(ma7)
plot(ma7.diff)
# vidljivo je da je drugi niz stacionaran


# 17. Grafički prikažite autokorelacijsku funkciju i funkciju parcijalne autokorelacije. Na kojim su
# pomacima značajni koeficijenti?
  
# autokorelacija
Acf(ma7.diff, lag.max = 30)
# 1,2,7


# parcijalna autokorelacija
Pacf(ma7.diff, lag.max = 30)
# 1, 7, 8,...

# 18. Napravite ARIMA model koristeći funkciju za automatsko određivanje parametara. Koristite
# prvih 700 vrijednosti zaglađenih podataka bez diferenciranja.
model1 <- auto.arima(ma7[1:700])


# 19. Koje su vrijednosti parametara odabrane?
model1
# ARIMA(1,1,0) 
# p = 1, d = 1, q = 0


# 20. Kako glasi model?
# y.hat(t) = 0.304*y(t-1) + E

# 21. Koliko iznosi RMSE modela?
accuracy(model1) 
# RMSE 153.4622

# 22. Napravite drugi ARIMA model tako da parametre odredite na temelju ACF i PACF. Koristite prvih
# 700 vrijednosti zaglađenih podataka bez diferenciranja.

model2 <- arima(ma7[1:700], order = c(1,1,7)) 
model2

# 23. Kako glasi model?
# y.hat(t) = 0.2671*y(t-1) + 0.1249*e(t-1) + 0.1155*e(t-2) + 
# + 0.1017*e(t-3) + 0.1110*e(t-4) + 0.1024*e(t-5) + 0.1091*e(t-6) +
# - 0.8776*e(t-7) + E

# 24. Koliko iznosi RMSE modela?
accuracy(model2) 
#RMSE 122.9314


# 25. Izvršite provjeru reziduala. Jesu li nezavisni i normalno distribuirani?
plot(model1$residuals)
plot(model2$residuals)

qqnorm(model1$residuals)
qqline(model1$residuals)

qqnorm(model2$residuals)
qqline(model2$residuals)


Box.test(model1$residuals, type = "Ljung-Box")
# p-value = 0.9571 >0.05 
# H0 - autokorelacije reziduala su = 0
# ne moze se odbaciti nul hipoteza da su nezavisni

Box.test(model2$residuals, type = "Ljung-Box")
# p-value = 0.7459 >0.05 
# H0 - autokorelacije reziduala su = 0
# ne moze se odbaciti nul hipoteza da su nezavisni

# za oba modela reziduali su normalno distribuirani i nezavisni


# 26. Koristite oba modela za predviđanje 7 dana unaprijed. Prikažite rezultate grafički zajedno sa
# stvarnim vrijednostima.

f1 <- forecast(model1, h = 7)
f2 <- forecast(model2, h = 7)

#par(mfrow = c(2,1))
par(mfrow = c(1,1))

plot(f1)
y <- ma7[701:707]
x <- 701:707
points(x, y, col = "red", pch = 16)


plot(f2)
y <- ma7[701:707]
x <- 701:707
points(x, y, col = "red", pch = 16)

# 27. Koji je od ova dva modela bolji?
# Bolje predvidja model2. Parametrom q = 7 uzet je u obzir sezonski utjecaj.

