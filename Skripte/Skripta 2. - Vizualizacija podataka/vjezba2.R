data("mtcars")

cars <- mtcars

# 1. Koliko ima opservacija (redaka) i varijabli (stupaca)?
ncol(cars)
nrow(cars)

dim(cars)

# 2. Tip varijabli
str(cars)

# 3. Ima li NULL vrijednosti?

is.na(cars)
