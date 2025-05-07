# 1. ucitavanje podataka:

# u opisu podataka navedeno je da ima nedostajucih vrijednosti
# pregledom podataka vidljivo je da su one oznacene upitnikom ("?") 
# prilikom ucitavanja podataka potrebno je navesti sto se sve smatra nedostajucom vrijednoscu

bc <- read.table("https://archive.ics.uci.edu/ml/machine-learning-databases/breast-cancer-wisconsin/breast-cancer-wisconsin.data", sep = ",", na.strings = c("?"))


# 2. 

str(bc) 

# 699 instanci, 11 varijabli
# sve varijable su numericke


# 3. dodavanje naziva stupaca (skraceni nazivi)

names.new <- c("id", "clump", "unifsize", "unifshape", "adhesion", "epithel", "nuclei",
            "chromatin", "nucleoli", "mitose", "class")

names(bc) <- names.new

bc <- bc[,-1]

str(bc)


#4. koliko ima nedostajucih vrijednosti

# ukupno
sum(is.na(bc)) #16
table(is.na(bc))

# po svakoj varijabli
sapply(bc, function(x) sum(is.na(x))) 
# samo nuclei ima nedostajuce vrijednosti

# koliko ima redaka bez nedostajucih vrijednosti
sum(complete.cases(bc)) #683/699


#5. zamjena nedostajucih vrijednosti medijanom

nuclei.median <- median(bc[,"nuclei"], na.rm = TRUE)
nuclei.median #1

bc[is.na(bc$nuclei) ,"nuclei"] <- nuclei.median

sum(is.na(bc$nuclei)) #nema vise nedostajucih vrijednosti


#6. "class" - pretvaranje u kategoricku

unique(bc$class) # postojeci modaliteti

bc$class <- factor(bc$class, levels = c("2", "4"), labels = c("B", "M"))

str(bc)


#7. podjela podataka

set.seed(123) # vazno zbog mogucnosti ponavljanja odabira
idx <- sample(nrow(bc), nrow(bc)*0.7) #sto izvlacimo (1:699), koliko puta 699*0,7 = 489

train <- bc[idx, ]
test <- bc[-idx, ]


#8. 

round(prop.table(table(train$class)), 3)
round(prop.table(table(test$class)), 3)
round(prop.table(table(bc$class)), 3) # cijeli skup


############# logisticka regresija

#9. 

model1 <- glm(class~., data = train, family = binomial(link = "logit"))

#10.

summary(model1)

coef(model1) # izrazeno u logaritmu omjera vjerojatnosti (log odds)
# clump = 0.48194485

exp(coef(model1))  # izrazeno kao omjer vjerojatnosti (odds)

# clump = 1.6192204763 

# za svako povecanje vrijednosti varijable "clump" od 1 jedinice (uz ostale varijable nepromijenjene)
# očekivani rast omjera vjerojatnosti (odds) da se radi o malignom tumoru iznosi 61,92 %

# 11. 

# ako se zeli rezultat izrazen kao vjerojatnost, potrebno je navesti: type = "response" 
# u protivnome rezultat je izrazen kao logaritam omjera vjerojatnosti (log odds)

p1 <- predict(model1, newdata = test, type = "response")

head(p1)

# klasifikacija

y1 <- ifelse(p1 > 0.5, 1, 0)
head(y1)

y1 <- factor(y1, levels = c(0,1), labels = c("B", "M"))
head(y1)


#12. konfuzijska matrica

table("predicted" = y1, "actual" = test$class)

accuracy <- (129+71) / (129+5+5+71)
accuracy #0.952381