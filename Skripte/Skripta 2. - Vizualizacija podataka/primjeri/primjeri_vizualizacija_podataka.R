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



