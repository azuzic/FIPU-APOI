# <======================| Stablo odluke |======================>

#install.packages("rpart")
#install.packages("rpart.plot")
#install.packages("caret")

library(rpart)
library(rpart.plot)

# Podjela podataka na trening i test skup
set.seed(123)
indeksi <- sample(1:nrow(iris), 0.7*nrow(iris))
train <- iris[indeksi,]
test <- iris[-indeksi,]

# Izgradnja modela
stablo <- rpart(Species ~ ., data = train, method = "class")

# Vizualizacija
rpart.plot(stablo)

# najvažnije varijable
stablo$variable.importance
# Petal.Width Petal.Length Sepal.Length  Sepal.Width 
#     60.83978     56.37649     37.31876     23.48140 

# najvažnije varijable
stablo$cptable
#         CP nsplit  rel error    xerror       xstd
#1 0.5294118      0 1.00000000 1.2058824 0.06232572
#2 0.3970588      1 0.47058824 0.5441176 0.07198662
#3 0.0100000      2 0.07352941 0.1176471 0.03997857

# uzimamo cp s velikom nsplit vrijednosti
podreznao_stablo <- prune(stablo, cp=0.0100000)
rpart.plot(podreznao_stablo)

# Predikcija
predikcije <- predict(stablo, test, type = "class")

# Evaluacija
library(caret)
confusionMatrix(predikcije, test$Species)


# <======================| Random forest |======================>
# install.packages("randomForest")
# install.packages("caret")

library(randomForest)
library(caret)

# Učitavanje podataka
data("PimaIndiansDiabetes")
diabetes <- PimaIndiansDiabetes

# Podjela podataka (70% trening, 30% test)
set.seed(123)
indeksi <- sample(1:nrow(diabetes), 0.7*nrow(diabetes))
train <- diabetes[indeksi, ]
test <- diabetes[-indeksi, ]

# Izgradnja modela (ciljna varijabla je 'diabetes')
forest <- randomForest(diabetes ~ ., data = train)

# Broj stabala
forest$ntree # 500

# Broj varijabli (prediktora)
forest$mtry # 2

# Važnost varijabli
importance(forest)
# grafički prikaz
varImpPlot(forest)

# Predikcija na testnom skupu
predikcije <- predict(forest, test)

# Evaluacija - matrica konfuzije
confusionMatrix(predikcije, test$diabetes)

# <======================| K-means |======================>
# install.packages("NbClust")
library(NbClust)

data(iris)
iris_features <- iris[, 1:4]

set.seed(123)

# Traženje optimalnog broja klastera (minimum 2, maksimum 6)
nb <- NbClust(data = iris_features, distance = "euclidean", method = "kmeans")

# Prikaz optimalnog broja klastera prema većini kriterija
bestnc <- nb$Best.nc[1, ] 
table(bestnc)

# ================

# Primjena K-means s K=3
set.seed(123)
kmeans_result <- kmeans(iris_features, centers = 3)

kmeans_result

# Klusteri
kmeans_result$cluster
# Veličina klastera
kmeans_result$size
# Postoci klastera
kmeans_result$withinss
# Postoci klastera
kmeans_result$betweenss

# Prikaz rezultata
table(kmeans_result$cluster, iris$Species)

# Vizualizacija sepal
plot(iris_features[, c("Sepal.Length", "Sepal.Width")], 
     col = kmeans_result$cluster, 
     main = "K-means grupiranje (K=3)")
points(kmeans_result$centers[, c("Sepal.Length", "Sepal.Width")], 
       col = 1:3, pch = 8, cex = 2)

# Vizualizacija petal
plot(iris_features[, c("Petal.Length", "Petal.Width")], 
     col = kmeans_result$cluster, 
     main = "K-means grupiranje (K=3)")
points(kmeans_result$centers[, c("Petal.Length", "Petal.Width")], 
       col = 1:3, pch = 8, cex = 2)

# ================

# install.packages("flexclust")
library(flexclust)

# Pretvaranje rezultata u Kcentroids objekt
kcca_model <- as.kcca(kmeans_result, iris_features)

# Dodjela klastera pomoću flexclust metode
clusters_flex <- predict(kcca_model)

# Evaluacija točnosti u odnosu na stvarne klase
table(clusters_flex, iris$Species)

# Preciznost klasifikacije
randIndex(table(clusters_flex, iris$Species))

# Rand indeks pokazuje koliko su podjele slične — vrijednost bliža 1 znači 
# veću podudarnost između stvarnih klasa i klastera.

# ================

# install.packages("cluster")
library(cluster)

# Primjena pam algoritma s 3 klastera
set.seed(123)
pam_result <- pam(iris_features, k = 3)

# Prikaz medoida
pam_result$medoids

# Prikaz klastera i usporedba sa stvarnim vrstama
table(pam_result$clustering, iris$Species)

# Vizualizacija rasporeda klastera u 2D prostoru
clusplot(iris_features, 
         pam_result$cluster, 
         color = TRUE, shade = TRUE, labels = 3, lines = 0, 
         main = "Clusplot prikaz PAM klastera")




