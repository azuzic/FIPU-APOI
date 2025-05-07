# Generiranje podataka s umjerenom pozitivnom korelacijom
set.seed(123)  # Postavljanje seeda za reproduktivnost
x <- rnorm(100, mean = 50, sd = 10)
y <- x * 0.7 + rnorm(100, mean = 0, sd = 5)  # y je povezan s x s šumom

# Računanje korelacije
korelacija <- cor(x, y)
korelacija <- round(korelacija, 2)  # Zaokruživanje na 2 decimale

# Crtanje scatter plota
plot(x, y, 
     main = paste("Scatter plot s korelacijom r =", korelacija),
     xlab = "Nezavisna varijabla (X)",
     ylab = "Zavisna varijabla (Y)",
     pch = 19,        # Puni krugovi za točke
     col = "blue",    # Boja točaka
     cex = 1.2)       # Veličina točaka

# Dodavanje linije regresije
abline(lm(y ~ x), col = "red", lwd = 2)

# Dodavanje legende
legend("topleft", 
       legend = c("Podaci", "Linija regresije"),
       col = c("blue", "red"),
       pch = c(19, NA),
       lty = c(NA, 1),
       lwd = c(NA, 2))

#========================================================================

# Postavljanje grafičkih parametara za 2 grafa u jednom redu
par(mfrow = c(1, 2))

# 1. PRIMJER LINEARNE KORELACIJE
set.seed(123)
x_lin <- seq(1, 100, length.out = 50)
y_lin <- 2 * x_lin + rnorm(50, sd = 15)

# Računanje korelacije
cor_lin <- round(cor(x_lin, y_lin), 2)

# Crtanje grafa
plot(x_lin, y_lin, 
     main = paste("Linearna korelacija\nr =", cor_lin),
     xlab = "X", ylab = "Y",
     pch = 19, col = "blue")
abline(lm(y_lin ~ x_lin), col = "red", lwd = 2)

# 2. PRIMJER NELINEARNE (KVADRATNE) KORELACIJE
x_nonlin <- seq(1, 100, length.out = 50)
y_nonlin <- 0.1 * (x_nonlin - 50)^2 + rnorm(50, sd = 15)

# Računanje korelacije (bit će niska jer Pearson mjeri samo linearnu povezanost)
cor_nonlin <- round(cor(x_nonlin, y_nonlin), 2)

# Crtanje grafa
plot(x_nonlin, y_nonlin, 
     main = paste("Nelinearna korelacija\nr =", cor_nonlin),
     xlab = "X", ylab = "Y",
     pch = 19, col = "green")

# Dodavanje nelinearne regresijske krivulje
lines(sort(x_nonlin), 
      predict(lm(y_nonlin ~ x_nonlin + I(x_nonlin^2)), 
              newdata = data.frame(x_nonlin = sort(x_nonlin))),
      col = "orange", lwd = 2)

# Vraćanje na normalni grafički način rada
par(mfrow = c(1, 1))

#========================================================================

# Postavljanje grafičkih parametara
par(mfrow = c(2, 2), mar = c(4, 4, 3, 1))

# 1. Pozitivna korelacija
set.seed(1)
x1 <- 1:100
y1 <- x1 + rnorm(100, sd = 10)
plot(x1, y1, main = "1. Pozitivna korelacija", 
     xlab = "X", ylab = "Y", pch = 19, col = "#1f77b4")
abline(lm(y1 ~ x1), col = "red", lwd = 2)
text(10, 120, paste("r =", round(cor(x1, y1), 2)), pos = 4)

# 2. Negativna korelacija
set.seed(1)
x2 <- 1:100
y2 <- -x2 + rnorm(100, sd = 10)
plot(x2, y2, main = "2. Negativna korelacija", 
     xlab = "X", ylab = "Y", pch = 19, col = "#ff7f0e")
abline(lm(y2 ~ x2), col = "blue", lwd = 2)
text(10, -20, paste("r =", round(cor(x2, y2), 2)), pos = 4)

# 3. Nemonotona (ciklička) korelacija
set.seed(1)
x3 <- 1:100
y3 <- 50*sin(x3/10) + rnorm(100, sd = 5)
plot(x3, y3, main = "3. Nemonotona korelacija", 
     xlab = "X", ylab = "Y", pch = 19, col = "#2ca02c")
lines(x3[order(x3)], y3[order(x3)], col = "purple", lwd = 2)
text(10, 60, paste("r =", round(cor(x3, y3), 2)), pos = 4)

# 4. Nul-korelacija
set.seed(1)
x4 <- 1:100
y4 <- rnorm(100, sd = 20)
plot(x4, y4, main = "4. Nul-korelacija", 
     xlab = "X", ylab = "Y", pch = 19, col = "#d62728")
abline(h = mean(y4), col = "black", lwd = 2, lty = 2)
text(10, 40, paste("r =", round(cor(x4, y4), 2)), pos = 4)

# Vraćanje na normalni grafički način rada
par(mfrow = c(1, 1))

#========================================================================

# Set up 2x1 plot layout
par(mfrow = c(1, 2))

# 1. Pearson correlation example (linear relationship)
set.seed(123)
x <- rnorm(100)
y_linear <- 2 * x + rnorm(100, sd = 0.75)
plot(x, y_linear, 
     main = paste("Pearson r =", round(cor(x, y_linear), 2)),
     pch = 19, col = "blue", xlab = "X", ylab = "Y")
abline(lm(y_linear ~ x), col = "red", lwd = 2)

# 2. Spearman correlation example (nonlinear monotonic relationship)
y_nonlinear <- x^3 + rnorm(100, sd = 0.75)
plot(x, y_nonlinear,
     main = paste("Spearman ρ =", round(cor(x, y_nonlinear, method = "spearman"), 2)),
     pch = 19, col = "green", xlab = "X", ylab = "Y")
lines(sort(x), (sort(x))^3, col = "purple", lwd = 2)

# Reset plot layout
par(mfrow = c(1, 1))

#========================================================================

# Set up 1x2 plot layout
par(mfrow = c(1, 2))

# Generate data with outliers
set.seed(123)
x <- c(rnorm(50, mean = 50, sd = 13), 99, 9)  # Add outliers
y <- c(x[1:50] * 0.8 + rnorm(50, sd = 3), -13, 120)  # Corresponding outliers

# Pearson correlation plot
plot(x, y, main = paste("Pearson r =", round(cor(x, y), 2)),
     xlab = "X", ylab = "Y", pch = 19, col = "blue")

# Spearman correlation plot
plot(x, y, main = paste("Spearman ρ =", round(cor(x, y, method = "spearman"), 2)),
     xlab = "X", ylab = "Y", pch = 19, col = "darkgreen")

# Reset plot layout
par(mfrow = c(1, 1))

#========================================================================

# Primjer u R-u:
par(mfrow = c(2, 3))
library(corrplot)
library(corrgram)

cor_matrix <- cor(quakes)
corrplot(cor_matrix)

cor_matrix <- cor(quakes)
corrplot(cor_matrix, method = "color")

cor_matrix <- cor(quakes)
corrplot(cor_matrix, method = "number")

cor_matrix <- cor(quakes)
corrplot(cor_matrix, method = "square")

cor_matrix <- cor(quakes)
corrplot(cor_matrix, method = "ellipse")

cor_matrix <- cor(quakes)
corrplot(cor_matrix, method = "pie")

pairs(quakes)

#========================================================================

# Postavljanje grafičkih parametara (3 grafa u jednom stupcu)
par(mfrow = c(1, 3))

# 1. Scatter plot S outlierima
set.seed(123)
x <- c(rnorm(50, mean = 50, sd = 10), 120, 15) # Dodani outlieri
y <- c(x[1:50] * 0.8 + rnorm(50, sd = 5), 25, 110) # Odgovarajuci outlieri

plot(x, y, main = "Korelacija s outlierima", 
     xlab = "X", ylab = "Y", pch = 19, col = "blue")
abline(lm(y ~ x), col = "red", lwd = 2)
text(100, 100, paste("Pearson r =", round(cor(x, y), 2)), pos = 1)

# 2. Boxplot za detekciju outliera
boxplot(x, y, names = c("X", "Y"), main = "Detekcija outliera pomoću boxplota",
        col = c("lightblue", "lightgreen"), horizontal = TRUE)

# 3. Scatter plot NAKON uklanjanja outliera
# Identificiranje outliera (vrijednosti izvan Q1-1.5*IQR ili Q3+1.5*IQR)
outliers_x <- x %in% boxplot.stats(x)$out
outliers_y <- y %in% boxplot.stats(y)$out
outliers <- outliers_x | outliers_y

plot(x[!outliers], y[!outliers], main = "Korelacija nakon uklanjanja outliera",
     xlab = "X", ylab = "Y", pch = 19, col = "darkgreen")
abline(lm(y[!outliers] ~ x[!outliers]), col = "orange", lwd = 2)
text(mean(x[!outliers]), max(y[!outliers]), 
     paste("Pearson r =", round(cor(x[!outliers], y[!outliers]), 2)), pos = 1)

# Vraćanje na normalni grafički način rada
par(mfrow = c(1, 1))

#========================================================================

par(mfrow = c(1, 1))

# Linearna regresija
model <- lm(mpg ~ wt + hp, data = mtcars)
summary(model)

#========================================================================


adult <- read.csv("adult.data", header = FALSE, strip.white = TRUE)
colnames(adult) <- c("age", "workclass", "fnlwgt", "education", "education.num",
                     "marital.status", "occupation", "relationship", "race", "sex",
                     "capital.gain", "capital.loss", "hours.per.week", "native.country", "income")

# Ukloni redove s nedostajućim vrijednostima (ako ih ima)
adult <- na.omit(adult)

# Pretvori income u binarnu varijablu: <=50K = 0, >50K = 1
adult$income_bin <- ifelse(adult$income == ">50K", 1, 0)


#========================================================================

model <- glm(income_bin ~ age + education.num, data = adult, family = binomial)
summary(model)

#========================================================================

prob <- predict(model, type = "response")
pred_class <- ifelse(prob > 0.5, 1, 0)
table(Predicted = pred_class, Actual = adult$income_bin)

# Vrijednosti iz confusion matrice
TP <- 2185
TN <- 23286
FP <- 1434
FN <- 5656

# Ukupno primjera
total <- TP + TN + FP + FN  # = 32361

# Izračun metrika
accuracy    <- (TP + TN) / total        # Točnost
precision   <- TP / (TP + FP)           # Preciznost
recall      <- TP / (TP + FN)           # Osjetljivost (Recall)
specificity <- TN / (TN + FP)           # Specifičnost
f1_score    <- 2 * (precision * recall) / (precision + recall)  # F1-score

accuracy
precision
recall
specificity
f1_score



























