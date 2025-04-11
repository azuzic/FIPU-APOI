attach(mtcars)  # Učitavanje podataka
plot(wt, mpg)   # Iscrtavanje podataka
abline(lm(mpg ~ wt))  # Dodavanje regresijskog pravca
title("Regresija: MPG = a + b * WT")  # Naslov grafa

plot(wt, mpg, col="blue", pch=16)

plot(wt, mpg, xlab="Težina vozila (wt)", ylab="Potrošnja goriva (mpg)")

plot(wt, mpg, xlab="Težina vozila (wt)", ylab="Potrošnja goriva (mpg)")

plot(wt, mpg)
grid()


# Učitavanje podataka
data(mtcars)
attach(mtcars)

# Postavljanje rasporeda grafova (3 redova x 2 stupca)
par(mfrow=c(3, 3))

# 1. Parametar: pch - simbol trokuta
plot(wt, mpg, pch=17, col="blue", xlab="Težina vozila (wt)", ylab="Potrošnja goriva (mpg)", main="Simbol točke (pch=16)")

# 2. Parametar: col - boja simbola
plot(wt, mpg, pch=16, col="red", xlab="Težina vozila (wt)", ylab="Potrošnja goriva (mpg)", main="Boja simbola (col='red')")

# 3. Parametar: bg i fg - boje pozadine i granice simbola
plot(wt, mpg, pch=21, col="orangered", bg="yellow", fg="brown", xlab="Težina vozila (wt)", ylab="Potrošnja goriva (mpg)", main="Pozadina i granica (bg='yellow', fg='brown')")

# 4. Parametar: cex - proširenje simbola
plot(wt, mpg, pch=5, col="blue", cex=2, xlab="Težina vozila (wt)", ylab="Potrošnja goriva (mpg)", main="Proširenje simbola (cex=1.5)")

# 5. Parametar: lwd - širina linije
plot(wt, mpg, pch=16, col="blue", xlab="Težina vozila (wt)", ylab="Potrošnja goriva (mpg)", main="Širina linije (lwd=2)")
abline(lm(mpg ~ wt), lwd=2)  # Promjena širine linije

# 6. Parametar: lty - tip linije
plot(wt, mpg, pch=16, col="blue", xlab="Težina vozila (wt)", ylab="Potrošnja goriva (mpg)", main="Tip linije (lty=2)")
abline(lm(mpg ~ wt), lty=2)  # Promjena tipa linije (dashed)

# 7. Parametar: font - tip fonta
plot(wt, mpg, pch=16, col="blue", xlab="Težina vozila (wt)", ylab="Potrošnja goriva (mpg)", main="Font (font=3, italic)", font.main=3)

# 8. Parametar: ps - veličina fonta
plot(wt, mpg, pch=16, col="blue", xlab="Težina vozila (wt)", ylab="Potrošnja goriva (mpg)", main="Veličina fonta (ps=2)", cex.main=2)

# 9. Parametar: family - obitelj fonta
plot(wt, mpg, pch=16, col="blue", family="mono", xlab="Težina vozila (wt)", ylab="Potrošnja goriva (mpg)", main="Obitelj fonta (family='mono')")

par(mar=c(5, 4, 4, 2) + 0.1)  # Margine: (donja, lijeva, gornja, desna)
plot(wt, mpg, cex.main=1.5, cex.lab=1.2, cex.axis=1.1, main="Naslov s većim fontom")

plot(wt, mpg, xlab="Težina vozila", ylab="Potrošnja goriva", las=1)

x <- 1:10
y <- c(1,3,5,2,4,6,4,8,6,2)
plot(
  x,                 # vrijednosti na osi x 
  y,                 # vrijednosti na osi y 
  xlim = c(1, 9),    # raspon x vrijednost
  ylim = c(1, 8),    # raspon y vrijednost
  main = "Naslov",   # naslov grafa
  xlab = "X os",     # naziv osi x
  ylab = "y os",     # naziv osi y
  cex.main = 2,      # veličina naslova
  cex.lab = 1.5,     # veličina naziva osi
  cex.axis = 1.25,   # veličina labela osi
  type = "b",        # vrsta linija/točaka
  lth  = 2,          # vrsta linije
  pch  = 21,         # vrsta točke
  lwd  = 3,          # debljina linije i obruba točki
  cex  = 2,          # veličina točki
  col  = "brown",    # boja linije i točki
  bg   = "orange",   # boja ispune točke
  fg   = "tomato",   # boja obruba grafa
)

plot(wt, mpg)
abline(lm(mpg ~ wt), col="red", lwd=2)  # linija linearne regresije
abline(h=mean(mpg), col="blue", lwd=2, lty=2)  # linija aritmetičke sredine
abline(v=median(wt), col="green", lwd=2, lty=2)  # linija medijana wt


text(x=min(wt)*1.3, y=max(mpg)*0.9, labels="Regresijska linija", col="red", pos=1)
text(x=max(wt)*0.85, y=mean(mpg)*0.95, labels="Aritmetička sredina", col="blue", pos=4)
text(x=median(wt), y=max(mpg)*0.8, labels="Medijan WT", col="green", pos=2)

# Postavljanje rasporeda grafova (3 redova x 2 stupca)
par(mfrow=c(3, 3))

# Generiranje podataka
x <- 1:10
y <- c(2, 4, 3, 5, 7, 6, 9, 8, 10, 12)

# 1. Točke (points)
plot(x, y, type = "p", main = "Točke (p)")

# 2. Linije (lines)
plot(x, y, type = "l", main = "Linije (l)")

# 3. Preklopljene točke i linije (overplotted)
plot(x, y, type = "o", main = "Točke i linije (o)")

# 4. Točke povezane linijama (b)
plot(x, y, type = "b", main = "Točke povezane linijama (b)")

# 5. Prazne točke povezane linijama (c)
plot(x, y, type = "c", main = "Prazne točke povezane linijama (c)")

# 6. Koraci (stair steps) - donji rub
plot(x, y, type = "s", main = "Koraci - donji rub (s)")

# 7. Koraci - gornji rub
plot(x, y, type = "S", main = "Koraci - gornji rub (S)")

# 8. Okomite linije (histogram-like)
plot(x, y, type = "h", main = "Okomite linije (h)")

# 9. Bez točaka i linija (samo os grafova)
plot(x, y, type = "n", main = "Bez točaka i linija (n)")

x <- seq(0, 10, by=0.1)
x2 <- seq(0, 10, by=1)

y1 <- sin(x)
y2 <- cos(x)
y3 <- c(-0.2, -0.3, 0.75, 0, 0.13, -0.8, 0.7, 0.21, -0.45, -0.32, 0.625)

plot(x, y1, type="l", col="red", lwd=2, ylim=c(-1,1), xlab="X Vrijednosti", ylab="Y Vrijednosti")
lines(x, y2, col="blue", lwd=2, lty=2)  
lines(x2, y3, col="green", lwd=2, lty=4)  

legend("topright", legend=c("sin(x)", "cos(x)", "basic"), col=c("red", "blue", "green"), lty=c(1,2,4), lwd=2)


x <- seq(0, 10, by=0.1)
y <- sin(x)
z <- cos(x)

par(mfrow=c(1, 2))

plot(x, y, type="l", col="blue", lwd=2, xlab="Vrijeme", ylab="Amplituda")

title(main="Sinusni val", sub="Primjer prilagođenog grafičkog prikaza", col.main="blue", col.sub="gray")
legend("topright", legend=c("sin(x)"), col="blue", lty=1, cex=0.8, lwd=2)

mtext("Sin i cos grafovi", line=1, col="purple", at=c(0,0))

plot(x, z, type="l", col="red", lwd=2, lty=2,  xlab="Vrijeme", ylab="Amplituda")

title(main="Sinusni val", sub="Primjer prilagođenog grafičkog prikaza", col.main="red", col.sub="gray")
legend("topright", legend=c("cos(x)"), col="red", lty=2, cex=1, lwd=2)

x <- seq(0, 10, by=0.1)
y <- sin(x)

plot(x, y, type="l", col="blue", lwd=2, xlab="Vrijeme", ylab="Amplituda")
title(main="Sinusni val s dodatnim elementima")

# Dodavanje mreže
grid(col="gray", lty=2, lwd=0.5)

# Dodavanje pravokutnika
rect(2, -1, 4, 1, col=rgb(1,0,0,0.2), border=NA)

# Dodavanje referentne linije
segments(2, -1, 2, 1, col="black", lty=2, lwd=2)

# Dodavanje poligona
polygon(c(6,7,7,6), c(-1,-1,1,1), col=rgb(0,0,1,0.3), border=NA)

# Dodavanje oznaka
text(5, 0, "Nulta točka", col="black", pos=3)
text(3, 0.5, "Označeno područje", col="red", pos=4)

# Dodavanje strelice
arrows(2, 0, 3, 0.5, col="red", lwd=2, length=0.1)

# Dodavanje točke s posebnim simbolom
points(5, 0, pch=19, col="red", cex=2)

# Generiranje normalno distribuirane varijable
set.seed(123)
x <- rnorm(500, mean = 100, sd = 15)

par(mfrow=c(1,1))
hist(
  x,                      # vrijednosti
  breaks = 20,            # razredi
  xlim = c(50, 160),      # raspon x vrijednost
  ylim = c(0, 80),        # raspon y vrijednost
  main = "Naslov",        # naslov
  xlab = "X os",          # naziv osi x
  ylab = "Y os",          # naziv osi y
  cex.main = 2,           # veličina naslova
  cex.lab = 1.5,          # veličina naziva osi
  cex.axis = 1.25,        # veličina labela osi
  col = "lightblue",      # boja stupaca
  border = "darkblue",    # boja rubova
)

par(mfrow=c(1,3))
hist(podaci, main="Fiksni broj", breaks = 50)  
hist(podaci, main="Prilagođeni intervali", breaks = seq(10, 200, by = 10))
hist(podaci, main="Friedman-Diaconis algoritam", breaks = "FD")

par(mfrow=c(1,1))
hist(podaci, 
     col = "lightblue",        # Boja ispune
     border = "darkblue",      # Boja rubova
     main = "Distribucija podataka", 
     xlab = "Vrijednosti",
     ylab = "Frekvencija")


set.seed(123)
podaci1 <- rnorm(500, mean = 100, sd = 15)
podaci2 <- rnorm(500, mean = 120, sd = 10)

hist(podaci1, 
     col = rgb(1,0,0,0.5),   # Crvena s prozirnošću
     main = "Usporedba distribucija",
     xlab = "Vrijednosti",
     xlim = c(50, 160))
hist(podaci2, 
     col = rgb(0,0,1,0.5),    # Plava s prozirnošću
     add = TRUE)              # Dodaj na postojeći graf
legend("topright", 
       legend = c("Skup 1", "Skup 2"),
       fill = c(rgb(1,0,0,0.5), rgb(0,0,1,0.5)))

hist(podaci, 
     freq = FALSE,            # Prikaz gustoće umjesto frekvencije
     col = "lightgreen",
     main = "Histogram s krivuljom gustoće")
lines(density(podaci),        # Dodavanje krivulje gustoće
      col = "red", 
      lwd = 2)

data(faithful)
waiting_times <- faithful$waiting

hist(waiting_times,
     breaks = 15,
     col = "lightsteelblue",
     border = "white",
     main = "Distribucija vremena između erupcija",
     xlab = "Vrijeme čekanja (minute)",
     ylab = "Broj erupcija",
     freq = FALSE)

lines(density(waiting_times), 
      col = "red3", 
      lwd = 2)

abline(v = mean(waiting_times), 
       col = "blue2", 
       lwd = 2)
abline(v = median(waiting_times), 
       col = "green4", 
       lwd = 3, 
       lty = 2)

legend("topright",
       legend = c("Gustoća distribucije", "Srednja vrijednost", "Medijan"),
       col = c("red3", "blue2", "green4"),
       lty = c(1, 1, 2),
       lwd = 2,
       bty = "n")  # Bez okvira legende

data(iris)
dotchart(iris$Sepal.Length,
         main = "Dužina čašičnih listova",
         xlab = "Dužina (cm)",
         ylab = "Uzorak")

dotchart(x = iris$Sepal.Length,
         groups = iris$Species,
         gcolor = c("#FF6B6B", "#4CAF50", "#2196F3"),
         lcolor = "gray80",
         color = c("#FF6B6B", "#4CAF50", "#2196F3")[as.numeric(iris$Species)],
         bg = rev(c("#FFCDD2", "#C8E6C9", "#BBDEFB"))[as.numeric(iris$Species)],
         main = "Dužina čašičnih listova po vrstama",
         xlab = "Dužina (cm)",
         ylab = "Uzorak",
         pch = 21,
         pt.cex = 1.5,
         cex = 1)

iris$Ratio <- iris$Petal.Length / iris$Petal.Width

dotchart(iris$Ratio,
         groups = iris$Species,
         gcolor = c("red", "green3", "blue"),
         color = c("#FF6B6B", "#4CAF50", "#2196F3")[as.numeric(iris$Species)],
         main = "Omjer dužine i širine latica po vrstama",
         xlab = "Omjer (dužina/širina)",
         ylab = "Uzorak",
         cex = 0.7)


data(iris)
iris$Ratio <- iris$Petal.Length / iris$Petal.Width
iris_sorted <- iris[order(iris$Species, iris$Ratio), ]

dotchart(iris_sorted$Ratio,
         groups = iris_sorted$Species,
         gcolor = c("red", "green3", "blue"),
         color = c("red", "green3", "blue")[as.numeric(iris_sorted$Species)],
         bg = rev(c("#FFCCCB", "#90EE90", "#ADD8E6"))[as.numeric(iris_sorted$Species)],
         main = "Omjer dužine i širine latica po vrstama",
         xlab = "Omjer (dužina/širina)",
         ylab = "Uzorak",
         pch = 21,
         pt.cex = 1.3,
         cex = 0.8)

species_means <- aggregate(Ratio ~ Species, iris, mean)
abline(v = species_means$Ratio, col = c("red", "green3", "blue"), lty = 2)

legend("bottomright",
       legend = c("Setosa", "Versicolor", "Virginica", "Prosjek"),
       col = c("red", "green3", "blue", "black"),
       pch = c(16, 16, 16, NA),
       lty = c(NA, NA, NA, 2),
       pt.bg = rev(c("#FFCCCB", "#90EE90", "#ADD8E6")),
       bty = "n")




data(ChickWeight)
# Prosječna težina po dijeti
mean_weight <- aggregate(weight ~ Diet, ChickWeight, mean)

bp <- barplot(mean_weight$weight,
        main = "Prosječna težina pilića po dijeti",
        xlab = "Dijeta",
        ylab = "Težina (g)",
        col = c("#FF9999", "#99FF99", "#9999FF", "#FFCC99"),
        ylim = c(0, 150))

text(x = bp, y = mean_weight$weight, labels = round(mean_weight$weight), pos = 3)

# Najveća težina po dijeti
max_weight <- aggregate(weight ~ Diet, ChickWeight, max)

barplot(max_weight$weight,
        horiz = TRUE,
        main = "Maksimalna težina po dijeti",
        xlab = "Težina (g)",
        ylab = "Dijeta",
        col = terrain.colors(4),
        xlim = c(0, 400))


day21 <- ChickWeight[ChickWeight$Time == 21, ]
mean_day21 <- aggregate(weight ~ Diet, day21, mean)

bp <- barplot(mean_day21$weight,
              main = "Težina pilića u 21. danu po dijetama",
              xlab = "Dijeta",
              ylab = "Težina (g)",
              col = heat.colors(4),
              ylim = c(0, 400))

text(x = bp, y = mean_day21$weight, labels = round(mean_day21$weight), pos = 3)

legend("topright",
       legend = paste("Dijeta", 1:4),
       fill = heat.colors(4),
       title = "Vrsta dijete")

data(PlantGrowth)
# Broj biljaka po skupinama
counts <- table(PlantGrowth$group)

pie(counts,
    main = "Raspodjela biljaka po eksperimentalnim skupinama",
    col = c("#FF6B6B", "#4CAF50", "#2196F3"))



# Izračun postotaka
percentages <- round(100 * counts/sum(counts), 1)

pie(counts,
    labels = paste0(percentages, "%"),
    main = "Postotna raspodjela biljaka po skupinama",
    col = c("#FF9999", "#99FF99", "#9999FF"))

legend("topright",
       title="Skupine",
       legend = c("Kontrolna", "Tretman 1", "Tretman 2"),
       fill = c("#FF9999", "#99FF99", "#9999FF"))




data(airquality)
boxplot(airquality$Ozone,
        main = "Distribucija ozonskih vrijednosti",
        ylab = "Ozon (ppb)",
        col = "lightblue")




boxplot(Ozone ~ Month, data = airquality,
        main = "Ozon po mjesecima",
        xlab = "Mjesec",
        ylab = "Ozon (ppb)",
        col = terrain.colors(5),
        names = month.name[5:9])



boxplot(airquality$Temp ~ airquality$Month,
        horizontal = TRUE,
        main = "Temperature po mjesecima",
        ylab = "Mjesec",
        xlab = "Temperatura (°F)",
        col = heat.colors(5),
        notch = TRUE,
        boxwex = 0.75)





boxplot(Wind ~ Month, data = airquality,
        main = "Distribucija brzine vjetra po mjesecima",
        xlab = "Mjesec",
        ylab = "Brzina vjetra (mph)",
        col = c("#4e79a7", "#59a14f", "#f28e2b", "#e15759", "#76b7b2"),
        boxwex = 0.6,  # Širina boxplotova
        names = month.name[5:9])

# Dodavanje srednjih vrijednosti
means <- aggregate(Wind ~ Month, airquality, mean, na.rm = TRUE)
points(means$Wind, pch = 18, col = "white", cex = 1.5)

# Legenda
legend("topright", legend = "Srednja vrijednost", pch = 23, col = "black", cex = 1.2)




data(quakes)
plot(quakes$long, quakes$lat,
     main = "Lokacije potresa",
     xlab = "Geografska dužina",
     ylab = "Geografska širina",
     pch = 21,
     col = rgb(0,0.2,0.4,0.75),
     bg = rgb(0,0.4,0.8,0.2),
     cex = (quakes$mag^3)/50)



# Prikaz svih varijabli u scatterplot matrici
pairs(quakes[,c("lat", "long", "depth", "mag", "stations")],
      main = "Matrica raspršenih dijagrama",
      pch = 21,
      bg = adjustcolor("blue", alpha.f = 0.3),
      col = adjustcolor("darkblue", alpha.f = 0.5))



# Izračun korelacijske matrice
cor_matrix <- cor(quakes[,c("lat", "long", "depth", "mag", "stations")])
round(cor_matrix, 2)



# Testiranje korelacija
cor.test(quakes$mag, quakes$stations)


par(mfrow=c(1,2))

# Magnituda vs stanice
plot(quakes$mag, quakes$stations,
     main = "Magnituda vs broj stanica\n(r = 0.85)",
     xlab = "Magnituda",
     ylab = "Broj stanica",
     pch = 19,
     col = adjustcolor("red", alpha.f = 0.3))
abline(lm(stations ~ mag, data=quakes), col="blue", lwd=2)

# Dubina vs magnituda
plot(quakes$depth, quakes$mag,
     main = "Dubina vs magnituda\n(r = -0.23)",
     xlab = "Dubina (km)",
     ylab = "Magnituda",
     pch = 19,
     col = adjustcolor("darkgreen", alpha.f = 0.3))
abline(lm(mag ~ depth, data=quakes), col="orange", lwd=2)




depth_cat <- cut(quakes$depth, breaks=5)
colors <- terrain.colors(5)[depth_cat]

plot(quakes$stations, quakes$mag,
     main = "Broj stanica vs magnituda potresa",
     xlab = "Broj stanica",
     ylab = "Magnituda",
     pch = 21,
     bg = adjustcolor(colors, alpha.f=0.6),
     col = "darkgray",
     cex = quakes$depth/50)

lines(lowess(quakes$stations, quakes$mag), col="red", lwd=2)

legend("bottomright",
       legend = levels(depth_cat),
       title = "Dubina (km)",
       pch = 21,
       pt.bg = terrain.colors(5),
       col = "darkgray")
