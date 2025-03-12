# Postavljanje radnog direktorija
getwd()
#setwd("~/primjer")

# komentar

# jedini način pisanja komentara u
# više linija

# =====================================================================
# Osnovne operacije
2 + 2      # Zbrajanje
5 - 3      # Oduzimanje
4 * 2      # Množenje
7 / 2      # Dijeljenje
7 %/% 2    # Cjelobrojno dijeljenje
2^3        # Potenciranje (2 na treću)
10 %% 3    # Modulo (ostatak pri dijeljenju)


# Generiranje sekvenci brojeva
1:10           # Generira brojeve od 1 do 10
seq(1, 10)     # Isto kao 1:10
seq(1, 10, 2)  # Generira brojeve od 1 do 10 s korakom 2


# Ispis podataka
print("Hello, World!")    # Ispis niza znakova
x <- 42   # dodjeljivanje vrijednosti varijabli x
x         # Ispis varijable x

# =====================================================================
# Varijable i dodjela vrijednosti
a <- 10               # Dodjela broja 10 varijabli a
b = 5                 # Alternativni način (nije preporučeno)
ime <- "Ana"          # Tekstualna varijabla
logicka <- TRUE       # Logička varijabla

v1 <- v2 <- v3 <- "jabuka" # Dodjela iste vrijednosti više varijabli istovremeno

a
b
ime
logicka

#Imena varijabli
# Primjeri dozvoljenih imena varijabli
mojavarijabla <- "jabuka"
moja_varijabla <- "jabuka"
mojaVarijabla <- "jabuka"
MOJAVARIJABLA <- "jabuka"
mojavarijabla2 <- "jabuka"
.mojavarijabla <- "jabuka"
._._....___..._  <- "jabuka"

# Primjeri nedozvoljenih imena varijabli
# 2mojavarijabla <- "jabuka"  # Ne može započeti s brojem
# moja-varijabla <- "jabuka"  # Crtica (-) nije dozvoljena
# moja varijabla <- "jabuka"  # Razmaci nisu dozvoljeni
# _mojavarijabla <- "jabuka"  # Ne smije započeti s donjom crtom
# moja@varijabla <- "jabuka"  # Posebni znakovi nisu dozvoljeni
# .2mojavarijabla <- "jabuka" # Ne smije započeti s točkom i brojem nakon točke
# TRUE <- "jabuka"            # Rezervirana riječ 'TRUE' ne može biti korištena

# =====================================================================
# Vrste podataka
# Numeric (brojčani podaci)
broj <- 42
decimalni <- 3.14
class(broj)       # Provjera vrste podataka
class(decimalni)  # Provjera vrste podataka

# Integer (cijeli brojevi)
cijeli <- 10L
class(cijeli)

# Character (tekstualni podaci)
ime <- "Ana"
class(ime)

# Logical (logički podaci)
logicka <- TRUE
class(logicka)

# Factor (kategorijske varijable)
boja <- factor(c("crvena", "plava", "zelena"))
class(boja)

# Complex (kompleksni brojevi)
kompleksni <- 3 + 4i
class(kompleksni)

ls() # prikaz svih trenutno definiranih varijabli

rm(a) # Briše varijablu 'a'

rm(list = ls()) # Za brisanje svih varijabli

# =====================================================================
# Uvjeti
# IF uvjet
if (1 == 0) {
  print(1)
} else {
  print(0)
}

# IFELSE
x <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
ifelse(x < 5 | x > 8, x, 0)

# =====================================================================
# Petlje
# FOR Petlja
for (i in 1:10) {
  print(paste("i =", i))
}

suma <- 0
for (i in 1:10) {
  suma <- suma + i
}
print(paste("Suma brojeva od 1 do 10 je:", suma))

# WHILE Petlja
i <- 3
while (i > 0) {
  print(paste("i =", i))
  i <- i - 1  # Smanjenje vrijednosti i
}

# REPEAT Petlja
i <- 1
repeat {
  print(paste("i =", i))
  i <- i + 1
  if (i %% 5 == 0) {
    break
  }
}

# =====================================================================
# Funkcije 

pozdrav <- function() {
  return("Ahoy!")
}
pozdrav()

kvadrat <- function(x) {
  return(x^2)
}
kvadrat(4)

zbroj <- function(a, b) {
  return(a + b)
}
zbroj(5, 3)

ponovi_tekst <- function(tekst = "R!", n = 3) {
  return(rep(tekst, n))
}

ponovi_tekst(n = 5)

























