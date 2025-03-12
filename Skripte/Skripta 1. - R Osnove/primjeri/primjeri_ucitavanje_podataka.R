# Učitavanje CSV datoteke
podaci <- read.csv("data/primjer.csv")

# Prikaz prva 3 retka
head(podaci, n = 3L)

# Prikaz zadnja 3 retka
tail(podaci, n = 3L)

# Učitavanje TXT datoteke s tabulatorom kao separatorom
podaci <- read.table("data/primjer.txt", header = TRUE, sep = " ")

# Prikaz prva 2 retka
head(podaci, n = 2L)

install.packages("readxl")  # Instalacija paketa
library(readxl)             # Učitavanje paketa

# Učitavanje Excel datoteke
podaci <- read_excel("data/primjer.xlsx", sheet = 1)

# Prikaz prva 2 retka
head(podaci, n = 2L)

install.packages("httr")  # Instalacija paketa
library(httr)

# Zahtjev za informacije o repozitoriju
odgovor <- GET("https://api.github.com/repos/tidyverse/ggplot2")

# Pretvorba odgovora u JSON
podaci <- content(odgovor, "parsed")

# Prikaz podataka
print(podaci)

# Prikaz popisa svih ugrađenih skupova podataka
data()

# Učitavanje određenog skupa podataka
data("mtcars")  # Učitava skup podataka 'mtcars'

cars <- data.frame(mtcars)

head(cars)

podaci <- read.csv("data/primjer_with_nulls.csv")

# Prikaz strukture podataka
str(podaci)

# Sažetak podataka
summary(podaci)

# Broj nedostajućih vrijednosti po stupcu
colSums(is.na(podaci))

# Uklanjanje redaka s nedostajućim vrijednostima
podaci_clean <- na.omit(podaci)
podaci_clean

# Uklanjanje redaka gdje bilo "Ime" ili "Grad" ima prazne stringove
podaci_clean <- podaci_clean[podaci_clean$Ime != "" & podaci_clean$Grad != "", ]
podaci_clean