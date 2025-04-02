# 1. Ucitajte iz excel datoteke naziva "zadatak1.xls" radni list (worksheet) naziva "Titanic" u data.frame naziva titanic
# prema potrebi instalirajte odgovarajuci paket

# install.packages("xlsx")
library("xlsx")

titanic <- read.xlsx("./podaci_titanic.xls", "Titanic")

# 2. Koliko ima opservacija i varijabli
dim(titanic)
# ODG: 891 opservacija, 12 varijabli

# 3. Kojeg je tipa varijabla Embarked?
# iz prethodnog ili class(titanic$Embarked)
# ODG: kategoricka (nominalna)
class(titanic$Embarked)

# 4.Izracunajte aritmeticku sredinu, medijan i standardnu devijaciju za varijablu Age
mean(titanic$Age) #NA

mean(titanic$Age, na.rm = TRUE) #29.69912
sd(titanic$Age, na.rm = TRUE) #stdev = 14.5265
median(titanic$Age, na.rm = TRUE) #28


# 5. Ima li nedostajucih vrijednosti?
summary(titanic)    # ukupan broj za svaku varijablu/stupac (NA's: x)
any(is.na(titanic)) # ima li ih? TRUE (TRUE/FALSE)
sum(is.na(titanic)) # ukupan broj nedostajucih (866)
# ODG: Ima


# 6. Ako ima, u kojim varijablama?
# ODG: Age, Cabin, Embarked 

colSums(is.na(titanic))

# ili
# sapply + anonimna funkcija
sapply(titanic, function(x) sum(is.na(x)))

# ili
# funkcija koja za proslijedjeni niz vraca broj nedostajucih
sum.na <- function(x){
  return(sum(is.na(x)))
}
# sapply + "nasa" funkcija 
sapply(titanic, sum.na)


# 7. Izracunajte udio (%) neodostajucih vrijednosti za svaku od varijabli
# ukupan broj NA po svakoj varijabli
# sapply(titanic, function(x)(sum(is.na(x))))

# udio po varijablama
sapply(titanic, function(x)(round((sum(is.na(x))/length(x)), digits=4))*100) 

# ili iz summary rucno: broj NA/broj opservacija

# ili
mean(is.na(titanic$Age)) # 0.1986532
mean(is.na(titanic$Cabin)) # 0.7710438
mean(is.na(titanic$Embarked)) # 0.002244669

# ili
colSums(is.na(titanic))/dim(titanic)[1]
round(colSums(is.na(titanic))/dim(titanic)[1],4)*100


# 8. Napravite novi data frame naziva t koji ce sadrzavati sve varijable iz df-a titanic 
# osim varijable koja ima vise od 50% nedostajucih vrijednosti
# ako znamo indeks varijable (stupca)
t <- titanic[c(-12)]

# ili ako znamo naziv varijable
t <- subset(titanic, select=-c(Cabin))

# ili
t <- titanic
t$Cabin <- NULL

# ili ako ne znamo niti indeks niti naziv
t <- titanic[, colSums(is.na(titanic))/nrow(titanic) < 0.5]
# t <- subset(titanic, select=colSums(is.na(titanic))/nrow(titanic) < 0.5)

# preglednije je  ako medjurezultate spremimo u varijable
na.colsum <- colSums(is.na(titanic)) # broj NA
na.colsum

na.percent <- round(na.colsum/nrow(titanic), 4)*100 # udio NA
na.percent

t <- titanic[ , na.percent < 50] # odabir redaka prema postavljenom uvjetu

# provjera
names(t)


# 9. Data frameu t dodajte novu varijablu naziva "Imputirane" s podacima varijable koja ima vise od 10% nedostajucih vrijednosti
t$Imputirane <-t$Age


# 10. provjerite (pregledajte) prvih 20 vrijednosti
head(t$Imputirane, 20)

# ili 
t[1:20, "Imputirane"]


# 11. varijabli Imputirane zamijenite nedostajuce vrijednosti medijanom
imp.med <- median(t$Imputirane)
imp.med #NA

imp.med <- median(t$Imputirane, na.rm = TRUE)
imp.med #28

# zamjena
t$Imputirane[is.na(t$Age)] <- imp.med
t$Imputirane

# opcionalno: dodavanje indikator varijable (da mozemo pratiti gdje su bile nedostajuce vrijednosti)
t$AgeNA <- ifelse(is.na(t$Age), 1, 0)
t$AgeNA

# pregled i usporedba
# cbind(t$Age, t$AgeNA, t$Imputirane)
head(cbind("Age" = t$Age, "Indikator"= t$AgeNA, "Imp" =t$Imputirane))


# 12. Ponovo provjerite(pregledajte) prvih 20 vrijednosti
head(t$Imputirane, 20)


# 13. Ako u toj varijabli (Imputirane) nema vise nedostajucih vrijednosti, uklonite iz t varijablu cije ste vrijednosti u nju kopirali
sum(is.na(t$Imputirane)) # nema NA

t<-subset(t, select=-c(Age))

# ili
t$Age <- NULL


# 14. Ima li jos nedostajucih vrijednosti u t?
any(is.na(t))

# ili
sum(is.na(t))
# ODG: ima 2

# ili
colSums(is.na(t))


# 15. Koliko ima opservacija t?
dim(t)

# ili
dim(t)[1]
# ODG: 891


# 16. Iz t uklonite sve opservacije u kojima su ostale nedostajuce vrijednosti (ostala je jos jedna varijabla s manje od 1% nedostajucih)
#complete.cases(t)
t <- t[complete.cases(t), ] # == TRUE, ==FALSE

# ili
t <- na.omit(t)


# 17. Koliko sada ima opservacija t?
dim(t)[1]
# ODG: 889


# 18. Uklonite prvi stupac iz t.
t <- t[-1]


# 19. Napravite tablicu frekvencija za varijablu Embarked (odnosi se na luku u kojoj su se putnici ukrcali)
table(t$Embarked)


# 20. Koliko je bilo razlicitih luka i koliko se putnika ukrcalo u svakoj od njih?
# ODG: 3 luke, C:168, Q:77, S:644


# 21. Napravite tablicu kontingence za Embarked i Survived (prezivjeli putnici Titanica) i spremite u varijablu naziva tk.
tk <- table(t$Embarked, t$Survived)
tk

# ili
tk <- xtabs(~Embarked+Survived, data = t)
tk

# 22. Izracunajte i postotke, zaokruzite na 2 decimale te spremite u varijablu naziva tkp
tkp <- round(proportions(tk), digits = 2)
tkp


# 23. Dodajte sumarne stupce.
tkp<-addmargins(tkp)
tkp

addmargins(table(t$Embarked, t$Survived))
addmargins(round(proportions(table(t$Embarked, t$Survived)), 4))


# 24. Koliki je udio putnika prezivio (0 = nije prezivio, 1 = prezivio)?
# ODG: 38,24%


# 25. Medju ukrcanima u kojoj luci je najvise, a u kojoj najmanje  prezivjelih?
# ODG: U odnosu na ukupan broj putnika: luka S (24%) najvise, luka Q (3%) najmanje
# Ako se gleda po lukama: najveci udio prezivjelih od ukupnog broja ukrcanih u toj luci
# imala je luka C, najmanji luka S
addmargins(round(proportions(table(t$Embarked, t$Survived)), 2))
#C
0.10/0.18 #0.5555556
#Q
0.03/0.08 #0.375
#S
0.24/0.72 #0.3333333
