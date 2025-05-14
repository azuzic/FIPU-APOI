install.packages(c("ggplot2", "forecast"))

library(ggplot2)    # Za naprednu vizualizaciju
library(forecast)   # Za autoplot() specifično za vremenske nizove

podaci <- c(23,45,67,34,56,78,89,45,67,89,43,56, 
            34,67,89,54,76,88,91,52,71,85,49,63)
vremenski_niz <- ts(podaci, start = c(2020, 1), frequency = 12)
vremenski_niz
# čišćenje od nedostajućih vrijednosti i outliera
vremenski_niz <- tsclean(vremenski_niz)

# Učitavanje ugrađenog dataseta
data("AirPassengers")
vremenski_niz <- AirPassengers
vremenski_niz

# Grafički prikaz trenda
plot(vremenski_niz, ylab="Broj putnika")
abline(lm(vremenski_niz ~ time(vremenski_niz)), col = "red")

par(mfrow=c(2,2))
vremenski_niz_ma3 <- ma(vremenski_niz, order = 3)
vremenski_niz_ma9 <- ma(vremenski_niz, order = 9)
vremenski_niz_ma27 <- ma(vremenski_niz, order = 27)
plot(vremenski_niz, main = "Bez pomičnog prosjeka")
plot(vremenski_niz_ma3, main = "Pomični prosjek (red 3)")
plot(vremenski_niz_ma9, main = "Pomični prosjek (red 9)")
plot(vremenski_niz_ma27, main = "Pomični prosjek (red 27)")

# ==================================================================

# Prikaz originalnih podataka
plot(AirPassengers, 
     main = "Broj međunarodnih putnika (1949-1960)",
     ylab = "Broj putnika (u tisućama)",
     xlab = "Godina")

# Dekompozicija niza na komponente
dekompozicija <- decompose(AirPassengers)

# Vizualizacija dekompozicije
plot(dekompozicija)



# Primjer STL dekompozicije
stl_dekomp <- stl(AirPassengers, s.window = "periodic")

# Vizualizacija
plot(stl_dekomp, main = "STL dekompozicija AirPassengers dataseta")

# Sezonska provjera
monthplot(stl_dekomp$time.series[,"seasonal"], 
          main = "Mesečni efekti u sezonskoj komponenti")

# Analiza ostataka
acf(na.omit(stl_dekomp$time.series[,"seasonal"]), 
    main = "ACF slučajne komponente")

# ==================================================================

decomp_add <- decompose(AirPassengers, type = "additive")
plot(decomp_add)

stl_add <- stl(AirPassengers, s.window = "periodic")
plot(stl_add, main = "STL Aditivna dekompozicija")


decomp_add <- decompose(AirPassengers, type = "multiplicative")
plot(decomp_add)

log_ap <- log(AirPassengers)
stl_mult <- stl(log_ap, s.window = "periodic")
plot(stl_mult, main = "STL Multiplikativna dekompozicija")

# ==================================================================

library(tseries)

data("AirPassengers")
vremenski_niz <- AirPassengers

adf_test <- adf.test(vremenski_niz)
adf_test



diferencirani_niz <- diff(vremenski_niz, 1)
adf.test(diferencirani_niz)


num_diffs <- ndiffs(ap)
num_diffs  # Vraća broj potrebnih diferencijacija za stacionarnost, 1 u ovom slučaju



# ==================================================================

data("AirPassengers")
ap <- AirPassengers

acf(ap, main = "ACF - AirPassengers")

pacf(ap, main = "PACF - AirPassengers")

# ==================================================================

ap <- AirPassengers

ap_arima <- auto.arima(ap)

summary(ap_arima)

ap_forecast_arima <- forecast(ap_arima, h = 36)

autoplot(ap_forecast_arima) +
  ggtitle("ARIMA predikcija broja putnika") +
  xlab("Godina") + ylab("Broj putnika")
