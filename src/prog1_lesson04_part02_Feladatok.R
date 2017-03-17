######################
# Feladatok          #
# Programozás I.     #
# 4. óra             #
# 2017-03-07         #
######################

#----Függvény és package behívások----------------------------------------------
# installálás, ha szükséges
if (!("fivethirtyeight" %in% installed.packages()))
  install.packages("fivethirtyeight", dependencies = T)
if (!("DescTools" %in% installed.packages())) 
  install.packages("DescTools", dependencies = T)

# package behívás
library(fivethirtyeight)
library(DescTools)

# függvény behívás
source("src/prog1_lesson04_part02_Feladatok_functions.R")

#----II. feladat----------------------------------------------------------------
## 1. dataset behívása
data(tarantino)

## 2. megoldási módok
# a) data frame indexelés
# nincs szükség előzetesen oszlop definiálására
tarantino$year[tarantino$movie == 'Reservoir Dogs'] <- 1992
tarantino$year[tarantino$movie == 'Pulp Fiction'] <- 1994
tarantino$year[tarantino$movie == "Kill Bill: Vol. 1"] <- 2003
tarantino$year[tarantino$movie == "Kill Bill: Vol. 2"] <- 2004 
tarantino$year[tarantino$movie == "Jackie Brown"] <- 1997 
tarantino$year[tarantino$movie == "Inglorious Basterds"] <- 2009 
tarantino$year[tarantino$movie == "Django Unchained"] <- 2012 

#-------------------------------------------------------------------------------
# b) ifelse
# nincs szükség előzetesen oszlop definiálására
# töröljük az oszlopot
tarantino$year <- NULL

tarantino$year <-
  ifelse(tarantino$movie == "Reservoir Dogs", 1992,
    ifelse(tarantino$movie == "Pulp Fiction", 1994,
      ifelse(tarantino$movie == "Kill Bill: Vol. 1", 2003,
        ifelse(tarantino$movie == "Kill Bill: Vol. 2", 2004,
          ifelse(tarantino$movie == "Jackie Brown", 1997,
            ifelse(tarantino$movie == "Inglorious Basterds", 2009,
              ifelse(tarantino$movie == "Django Unchained", 2012, NA)))))))

#-------------------------------------------------------------------------------
# c) if-else-ek for ciklusban
# ez mutatja, hogy az if-else szerkezetek nem vektorizáltak, az ifelse-ek igen
# előzetesen definiálni kell oszlopot vagy az oszlopszámmal kell indexelni
tarantino$year <- NA

for (i in 1:nrow(tarantino)) {
  if (tarantino$movie[i] == "Reservoir Dogs")
    tarantino$year[i] <- 1992
  else if (tarantino$movie[i] == "Pulp Fiction")
    tarantino$year[i] <- 1994
  else if (tarantino$movie[i] == "Kill Bill: Vol. 1")
    tarantino$year[i] <- 2003
  else if (tarantino$movie[i] == "Kill Bill: Vol. 2")
    tarantino$year[i] <- 2004
  else if (tarantino$movie[i] == "Jackie Brown")
    tarantino$year[i] <- 1997
  else if (tarantino$movie[i] == "Inglorious Basterds")
    tarantino$year[i] <- 2009
  else if (tarantino$movie[i] == "Django Unchained")
    tarantino$year[i] <- 2012
}

#-------------------------------------------------------------------------------
# indexelés which segítségével
# előzetesen definiálni kell oszlopot 
tarantino$year <- NA

tarantino$year[which(tarantino$movie == "Reservoir Dogs")] <- 1992
tarantino$year[which(tarantino$movie == "Pulp Fiction")] <- 1994
tarantino$year[which(tarantino$movie == "Kill Bill: Vol. 1")] <- 2003
tarantino$year[which(tarantino$movie == "Kill Bill: Vol. 2")] <- 2004
tarantino$year[which(tarantino$movie == "Jackie Brown")] <- 1997
tarantino$year[which(tarantino$movie == "Inglorious Basterds")] <- 2009
tarantino$year[which(tarantino$movie == "Django Unchained")] <- 2012

#----III. feladat---------------------------------------------------------------
## 1. decade oszlop készítése
# a) indexeléssel
tarantino$decade[tarantino$year < 2000] <- "1990s"
tarantino$decade[tarantino$year >= 2000 & tarantino$year < 2010] <- "2000s"
tarantino$decade[tarantino$year >= 2010] <- "2010s"

# b) ifelse-ekkel
# oszlop törlése
tarantino$decade <- NULL
tarantino$decade <-
  ifelse(tarantino$year < 2000, "1990s",
         ifelse(tarantino$year >= 2000 & tarantino$year < 2010, "2000s",
                ifelse(tarantino$year >= 2010, "2010s", NA)))

## 2.melyik évtizedben hány halál és káromkodás volt
table(tarantino$profane, tarantino$decade)

## 3. a halálok és a káromkodások száma független-e az évtizedtől
# khí-négyzet próba függetlenségvizsgálatra
chisq.test(table(tarantino$profane, tarantino$decade))

# log-likelihood hányados teszt
GTest(table(tarantino$profane, tarantino$decade))

#----IV. feladat----------------------------------------------------------------
greet_person()
greet_person("Szia", "Te")

#----V. feladat-----------------------------------------------------------------
# 1. mátrix definiálása
m <- matrix(rnorm(20), 10, 2)

# 2. mátrix elemeinek szorzása 100-zal for ciklussal
for (i in 1:nrow(m)) m[i, ] <- m[i, ] * 100
m

# 3. mátrix elemeinek szorzása 100-zal while ciklussal
i <- 1
while (i <= nrow(m)) {
  m[i, ] <- m[i, ] * 100
  i <- i + 1
}
m

for (i in 1:nrow(m)) {
  for (j in ncol(m))
    ifelse(m[i, j] %% 2 == 0, 
           m[i, j] <- m[i, j] / 2, 
           m[i, j] <- m[i, j] * 2)
}

#----VI. feladat----------------------------------------------------------------
# 1. data frame definiálása
df <- data.frame(booleans = c(TRUE, FALSE, TRUE), letters = c("a", "b", "b"),
                 stringsAsFactors = FALSE)

# 2. értékek felülírása 0-val és 1-gyel
# egyik példamegoldás
for (i in 1:nrow(df)) {
  if (df$booleans[i] == TRUE) df$booleans[i] <- 1
  if (df$booleans[i] == FALSE) df$booleans[i] <- 0
  if (df$letters[i] == "a") df$letters[i] <- 1 
  if (df$letters[i] == "b") df$letters[i] <- 0
}
df

# másik példamegoldás
df <- data.frame(booleans = c(TRUE, FALSE, TRUE), letters = c("a", "b", "b"),
                 stringsAsFactors = FALSE)

for (i in 1:nrow(df)) {
  for (j in 1:ncol(df)){
    if (df[i, j] == TRUE | df[i, j] == "a") df[i, j] <- 1
    if (df[i, j] == FALSE | df[i, j] == "b") df[i, j] <- 0
  }
}
df