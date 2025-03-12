# Strukture podataka

# =====================================================================
# 1. Vektor

# Numerički vektor
brojevi <- c(1, 2, 3, 4, 5)

# Znakovni vektor
imena <- c("Ana", "Marko", "Iva")

# Logički vektor
logicki <- c(TRUE, FALSE, TRUE)

# Prazan vektor određenog tipa i duljine
prazan <- vector(mode = "numeric", length = 5)

brojevi[2]   # Dohvaća drugi element (2)
imena[1]     # Dohvaća prvi element ("Ana")
logicki[3]   # Dohvaća treći element (TRUE)

# Aritmetičke operacije nad vektorima
x <- c(2, 4, 6)
y <- c(1, 2, 3)

zbroj <- x + y  # Rezultat: c(3, 6, 9)
umnozak <- x * y  # Rezultat: c(2, 8, 18)
kvadrati <- x^2  # Rezultat: c(4, 16, 36)

# Logičke operacije
logicki_v <- c(TRUE, FALSE, TRUE)
negacija <- !logicki_v  # Rezultat: c(FALSE, TRUE, FALSE)


# Kreiranje vektora s brojevima
brojevi <- c(10, 20, 30, 40, 50)

# Dohvat brojeva većih od 25
veci_od_25 <- brojevi[brojevi > 25]  # Rezultat: c(30, 40, 50)

vektor1 <- c(1, 2, 3)
vektor2 <- c(4, 5, 6)

kombinirani <- c(vektor1, vektor2)  
# Rezultat: c(1, 2, 3, 4, 5, 6)

sekvenca1 <- 1:10   # Rezultat: c(1, 2, 3, ..., 10)
sekvenca2 <- seq(2, 20, by = 2)  # Rezultat: c(2, 4, 6, ..., 20)

ponovljeni <- rep(1:3, times = 2)  # Rezultat: c(1, 2, 3, 1, 2, 3)
ponovljeni2 <- rep(1:3, each = 2)  # Rezultat: c(1, 1, 2, 2, 3, 3)

brojevi <- c(10, 20, 40, 20, 70, 20)
sum(brojevi)         
min(brojevi)         
max(brojevi)         
mean(brojevi)         
unique(brojevi)         
length(brojevi)         
sort(brojevi)         
rev(brojevi)         
which(brojevi > 30)         
any(brojevi > 50)         
all(brojevi > 15)        
cumsum(brojevi)         
diff(brojevi)         
rep(c(1, 2), times = 3)
seq(from = 1, to = 10, by = 2) 
paste("Broj", 1:3)         
table(brojevi)         
range(brojevi)         
median(brojevi)         
sd(brojevi)         
var(brojevi)         


# 2. Matrica

# Kreiranje 3x3 matrice s brojevima od 1 do 9 po stupcima
mat <- matrix(1:9, nrow = 3, ncol = 3)
print(mat)

# Kreiranje 3x3 matrice s brojevima od 1 do 9 po retcima
mat2 <- matrix(1:9, nrow = 3, byrow = TRUE)
print(mat2)

# Dohvaćanje elementa u drugom retku i trećem stupcu
mat[2,3]  # Rezultat: 8

# Dohvaćanje cijelog retka
mat[2, ]  # Rezultat: 2 5 8

# Dohvaćanje cijelog stupca
mat[ ,3]  # Rezultat: 7 8 9

# Spajanje dvaju vektora u stupce
v1 <- c(1, 2, 3)
v2 <- c(4, 5, 6)
mat3 <- cbind(v1, v2)  # Kombinira vektore u stupce
print(mat3)

# Spajanje dvaju vektora u retke
mat4 <- rbind(v1, v2)  # Kombinira vektore u retke
print(mat4) 

# =====================================================================
# 3. Polje

# Kreiranje polja s 3 reda, 2 stupca i 2 sloja
arr <- array(1:12, dim = c(3, 2, 2))
print(arr)

# Dohvaćanje elementa u drugom retku, prvom stupcu i drugom sloju
arr[2, 1, 2]  # Rezultat: 8

# Dohvaćanje cijelog prvog sloja
arr[ , , 1]  
# Rezultat:
#      [,1] [,2]
# [1,]    1    4
# [2,]    2    5
# [3,]    3    6

# Dohvaćanje cijelog drugog stupca u svim slojevima
arr[ , 2, ]  
# Rezultat:
#      [,1] [,2]
# [1,]    4   10
# [2,]    5   11
# [3,]    6   12

# Kreiranje drugog polja s istim dimenzijama
arr2 <- array(13:24, dim = c(3, 2, 2))

# Zbrajanje dva polja
zbroj <- arr + arr2
print(zbroj)

# =====================================================================
# 4. Okvir podataka

podaci <- data.frame(
  Ime = c("Ana", "Marko", "Iva", "Pero"),
  Dob = c(25, 30, 22, 25),
  Visina = c(168, 175, 160, 191)
)

print(podaci)

dimenzije <- dim(podaci)
print(paste("Broj opservacija (redaka):", dimenzije[1]))
print(paste("Broj varijabli (stupaca):", dimenzije[2]))

print(paste("Broj opservacija (redaka):", nrow(podaci)))
print(paste("Broj varijabli (stupaca):", ncol(podaci)))

podaci$Ime  # Vraća vektor imena

podaci[2, 3]  # Vraća vrijednost u drugom retku i trećem stupcu

podaci[2, ]  # Vraća drugi redak

podaci[, 3]  # Vraća treći stupac

podaci["Visina"]  # Vraća stupac Visina kao podokvir

# Dodavanje stupca "Težina"
podaci$Težina <- c(55, 80, 60)
print(podaci)

# Brisanje stupca "Težina"
podaci$Težina <- NULL
print(podaci)

# Filtriranje osoba starijih od 23 godine
stariji_od_23 <- podaci[podaci$Dob > 23, ]
print(stariji_od_23)

# Sortiranje po dobi (silazno)
sortirani_podaci <- podaci[order(podaci$Dob, decreasing = TRUE), ]
print(sortirani_podaci)

podaci <- data.frame(
  Ime = c("Ana", "Marko", "Iva", "Petar", "Marija", "Ivan"),
  Dob = c(25, 30, 25, 28, 25, 30),
  Visina = c(168, 175, 160, 180, 165, 178)
)

# Sažetak podataka
summary(podaci)

# Agregacija prosječne visine po dobi
aggregate(Visina ~ Dob, data = podaci, FUN = mean)

podaci <- data.frame(
  Ime = c("Ana", "Marko"),
  Dob = c(25, 30),
  Visina = c(168, 175)
)

# Dohvaćanje naziva stupaca
nazivi <- colnames(podaci)
print(nazivi)

# Promjena naziva svih stupaca
colnames(podaci) <- c("Ime", "Godine", "Visina")

# Promjena naziva određenog stupca
colnames(podaci)[2] <- "Dob"

# Promjena naziva svih stupaca
colnames(podaci) <- c("Name", "Age", "Height")

# Promjena naziva određenog stupca
colnames(podaci)[2] <- "Year"

print(podaci)

# =====================================================================
# 5. Faktori

# Kreiranje faktora za spol
spol <- factor(c("M", "Ž", "M", "Ž", "M"))
print(spol)

# Promjena redoslijeda razina
spol <- factor(spol, levels = c("Ž", "M"))
print(spol)

# Dodavanje nove razine "N" (nepoznato)
spol <- factor(spol, levels = c("M", "Ž", "N"))
print(spol)

# Pretvorba faktora u znakovni vektor
spol_znakovni <- as.character(spol)
print(spol_znakovni)

# Pretvorba faktora u numerički vektor
spol_numericki <- as.numeric(spol)
print(spol_numericki)

# =====================================================================
# 6. Liste

moja_lista <- list(
  broj = 42,
  imena = c("Ana", "Marko"),
  matrica = matrix(1:4, nrow = 2)
)

print(moja_lista)

moja_lista$broj
moja_lista$imena[1]
moja_lista$matrica[1,2]



