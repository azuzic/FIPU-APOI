# 1. Učitajte podatke iz datoteke `titanic_med.csv` u data frame naziva titanic.
titanic <- read.csv("titanic_med.csv")

# 2. Podatke titanic podijelite slučajnom podjelom 
# u omjeru 70:30 na skupove trening i test. Postavite sjeme na 27.
set.seed(27)
idx<- sample(nrow(titanic), 0.7*nrow(titanic))

trening <- titanic[idx, ]
test <-titanic[-idx,]

### Stablo odlučivanja
# 9. Kreirajte stablo odluke za klasifikaciju putnika na preživjele 
# i one koji nisu uspjeli preživjeti. Koristite sve varijable. 
# Postavite sjeme na 68.
library("rpart")
set.seed(68)
stablo1 <- rpart(Survived~., data = trening, method ="class")

# 4. Koja je varijabla najznačajnija za klasifikaciju putnika 
## prema varijabli Survived?
names(stablo1)
stablo1$variable.importance 
# spol (sex)


# 5. Grafički prikažite dobiveno stablo.
library("rpart.plot")
rpart.plot(stablo1, cex=0.8) 


# 6. Na temelju koje varijable i koje vrijednosti varijable je izvršena prva podjela?
# prva podjela izvšena je na temelju spola (Sex) i vrijednosti "muškarac" (male)


# 7.Odgovorite **jesu li preživjeli**:
### a) muškarac star 36 godina koji se ukrcao u luci “S” i putovao besplatno?
### b) žena koja je putovala 3. klasom?
# a) Muškarac star 36 godina neće preživjeti jer ima više od 10 godina
# Za odgovor je svejedno u kojoj se luci ukrcao.
# b) Žena koja je putovala trećom klasom je preživjela

# 8. Da je na brodu bila osoba stara 87 godina, da li bi preživjela?
# Da se radilo o muškarcu, ne bi preživio.
# Ako je u pitanju žena koja je putovala 1. ili 2. klasom, preživjela bi neovisno o dobi.
# Ako je žena putovala trećom klasom, preživjela bi neovisno o dobi.

# 9. Stablo odluke koristite za predviđanje na novim podacima iz skupa test. 
# Koliko iznosi točnost?

pred1 <- predict(stablo1, newdata = test, type = "class")
 
tocnost <- sum(pred1 == test$Survived)/nrow(test)*100
tocnost 
#86.14232 %


# 10. Koliko iznosi najmanja vrijednost pogreške dobivene na temelju 
# unakrsne validacije (cptable; xerror)?

stablo1$cptable 

min(stablo1$cptable[,4]) 
#0.5406504

# 11. Podrežite stablo na temelju vrijednosti CP parametra. 
# Za podrezivanje odaberite vrijednost koja odgovara najmanjem stablu 
# unutar raspona vrijednosti koju ste utvrdili u zadatku 10.

# min. xerror = 0.5406504, xstd = 0.04156712
# min. xerror = 0.5406504, xstd = 0.04156712
0.5406504 - 0.04156712 # 0.4990833
0.5406504 + 0.04156712 # 0.5822175
# rel error = 0.5000000, cp = 0.01422764

stablo1.rezano <- prune(stablo1, cp = 0.01422764)

# 12. Grafički prikažite podrezano stablo.
rpart.plot(stablo1.rezano, cex=1, type = 2, tweak=1.2)

# 13. Podrezano stablo koristite za predviđanje na podacima iz skupa test.
# Koliko iznosi točnost?
pred2 <- predict(stablo1.rezano, newdata = test, type = "class")

tocnost2 <- sum(pred2 == test$Survived)/nrow(test)*100
tocnost2 
#85.76779 %

### Random Forest
# 14. Koristeći podatke trening kreirajte slučajnu šumu (random forest) i spremite
# u varijablu naziva rf1. Sjeme postavite na 68. Odaberite opciju izračuna važnosti
# varijabli.
library("randomForest")
set.seed(68)
rf1 <- randomForest(as.factor(Survived)~., data = trening, importance = TRUE) 

# 15. Koja je varijabla najznačajnija prema kriteriju prosječnog 
# smanjenje točnosti ako se premutiraju vrijednosti varijable? 
# Podudara li se to s odgovorom iz zadatka 10?
imp <- importance(rf1, type = 1) 
imp
# spol je najznačajnija
# odgovori se podudaraju

# 16. Za koliko će se smanjiti točnost klasifikacije ako se varijabli Fare 
# permutiraju vrijednosti?
imp["Fare",]
# smanjit će se za 22.88163

# 17. Model dobiven pod 14 koristite za za predviđanje na podacima
# iz skupa test. Koliko iznosi točnost?
pred.rf <- predict(rf1, newdata = test)
tocnost.rf <- sum(pred.rf == test$Survived)/nrow(test)*100
tocnost.rf 
#85.76779 %

#18. Koliko stabala sadrži šuma?
rf1$ntree
# 500 stabala u šumi

# 19. Napravite još jedan model slučajne šume koji će 
# sadržavati 1000 stabala i koji će uzimati u obzir 3 varijable 
# kod svake podjele. Spremite ga u varijablu naziva rf2.
set.seed(68)
rf2 <- randomForest(as.factor(Survived)~., data = trening, mtry = 3, ntree = 1000, importance = TRUE)

# 20. Model dobiven pod 24 koristite za za predviđanje 
# na podacima iz skupa test. Koliko iznosi točnost?
pred.rf2 <- predict(rf2, newdata = test)

tocnost.rf2 <- sum(pred.rf2 == test$Survived)/nrow(test)*100
tocnost.rf2 
#85.39326 %
