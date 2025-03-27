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




