# Učitavanje skupa podataka mtcars
data(mtcars)

# Spremanje podataka u varijablu cars
cars <- mtcars

# 1. Koliko ima opservacija (redaka) i varijabli (stupaca)?
dimenzije <- dim(cars)
print(paste("Broj opservacija (redaka):", dimenzije[1]))
print(paste("Broj varijabli (stupaca):", dimenzije[2]))

# 2. Nazivi varijabli i njihovi tipovi
print("Nazivi varijabli i njihovi tipovi:")
str(cars)

# 3. Ima li nedostajućih vrijednosti?
nedostajuce_vrijednosti <- sum(is.na(cars))
print(paste("Broj nedostajućih vrijednosti:", nedostajuce_vrijednosti))

# 4. Izmjena naziva stupaca na hrvatski jezik
colnames(cars) <- c("potrosnja", "cilindri", "zapremina", "snaga", "omjer", "tezina", "ubrzanje", "motor", "mjenjac", "brzine", "karburatori")
print("Nazivi stupaca nakon izmjene:")
print(colnames(cars))

# 5. Minimalna, maksimalna i prosječna potrošnja goriva
min_potrosnja <- min(cars$potrosnja)
max_potrosnja <- max(cars$potrosnja)
mean_potrosnja <- mean(cars$potrosnja)
print(paste("Minimalna potrošnja goriva:", min_potrosnja))
print(paste("Maksimalna potrošnja goriva:", max_potrosnja))
print(paste("Prosječna potrošnja goriva:", mean_potrosnja))

# 6. Različiti brojevi cilindara
razliciti_cilindri <- unique(cars$cilindri)
print("Različiti brojevi cilindara:")
print(razliciti_cilindri)

# 7. Broj automobila s ručnim mjenjačem (mjenjac = 1)
broj_rucnih_mjenjaca <- sum(cars$mjenjac == 1)
print(paste("Broj automobila s ručnim mjenjačem:", broj_rucnih_mjenjaca))

# 8. Filtriranje podataka za automobile s 8 cilindara
cars_8cyl <- cars[cars$cilindri == 8, ]
print("Podaci za automobile s 8 cilindara:")
print(cars_8cyl)

# 9. Prosječna težina automobila s 8 cilindara
mean_tezina_8cyl <- mean(cars_8cyl$tezina)
print(paste("Prosječna težina automobila s 8 cilindara:", mean_tezina_8cyl))

# 10. Potrošnja goriva za prva 3 automobila
potrosnja_prva_3 <- cars$potrosnja[1:3]
print("Potrošnja goriva za prva 3 automobila:")
print(potrosnja_prva_3)

# 11. Potrošnja goriva za posljednjih 5 automobila
potrosnja_posljednjih_5 <- tail(cars$potrosnja, 5)
print("Potrošnja goriva za posljednjih 5 automobila:")
print(potrosnja_posljednjih_5)

# 12. Sažetak svih numeričkih varijabli
print("Sažetak svih numeričkih varijabli:")
summary(cars)