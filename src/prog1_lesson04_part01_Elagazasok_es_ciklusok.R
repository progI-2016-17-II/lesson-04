######################
# Függvények         #
# Programozás I.     #
# 4. óra             #
# 2017-03-07         #
######################

#----Függvények behívása--------------------------------------------------------
source("src/prog1_lesson04_part01_Elagazasok_es_ciklusok_functions")

#----Elágazások - if------------------------------------------------------------
## if szerkezete (ne futtasd le!)
if (feltétel) {
  művelet
}

## Egyszerű if műveletek
# hozzárendeljük az 1-es számot egy number objektumhoz
number <- 1

# azt a feltételt nézzük meg if-fel, hogy a number egyenlő-e 1-gyel
# a feltétel igaz, teljesül, ezért végrehajtja a műveletet
if (number == 1) {
  print("Ez valóban 1.")
}

# azt a feltételt nézzük meg if-fel, hogy a number egyenlő-e 0-val
# a feltétel nem teljesül, ezért nem hajt végre műveletet
if (number == 0) {
  print("Ez valóban 0.")
}


#----Elágazások - if és else----------------------------------------------------
## if és else szerkezete (ne futtasd le!)
if (feltétel) {
  művelet1
} else {
  művelet2
}

## Egyszerű if-else műveletek

# azt a feltételt nézzük meg if-fel, hogy a number egyenlő-e 1-gyel
# a feltétel igaz, teljesül, ezért végrehajtja az if-ben megszabott műveletet
if (number == 1) {
  print("Ez valóban 1.")
} else {
  print("Ez nem 1.")
}

# azt a feltételt nézzük meg if-fel, hogy a number egyenlő-e 0-val
# a feltétel nem teljesül, ezért az else-ben megszabott műveletet hajtja végre
if (number == 0) {
  print("Ez valóban 0.")
} else {
  print("Ez nem 0.")
}

## Függvény if-fel
# check_number függvény
# megnézi, hogy az argumentumaként kapott objektum egyenlő-e 1-gyel
check_number(1)
check_number(100)
check_number("a")


#----if és else szerkezete több feltétel esetén---------------------------------
## szerkezete 3 feltétel esetén: (ne futtasd le!)
if (feltétel) {
  művelet1
} else if (feltétel2) {
  művelet2
} else if (feltétel3) {
  művelet3
} else {
  művelet4
}

## check_number_complex függvény
# check_number függvény több feltétel esetén
# megnézi, hogy az argumentumaként kapott objektum egyenlő-e 1-gyel
# ha nem, akkor egyenlő-e 0-val
# ha nem, akkor szám-e egyáltalán
check_number_complex(1)
check_number_complex(0)
check_number_complex(100)
check_number_complex("a")
  
#----if és else több feltétel egy feltételben való megadása esetén--------------
## szerkezete (ne futtasd le!)
# and (&)
if (feltétel1 & feltétel2) {
  művelet1
} else {
  művelet2
}

# or (|)
if (feltétel1 | feltétel2) {
  művelet1
} else {
  művelet2
}

## check_number_or függvény
# check_number függvény több feltétel együttes megadása esetén
# or (|) használatával
# megnézi, hogy az argumentumaként kapott objektum egyenlő-e 1-gyel vagy 0-val
check_number_or(1)
check_number_or(100)

## check_number_and
# check_number függvény több feltétel együttes megadása esetén
# and (&) használatával
# megnézi, hogy az argumentumaként kapott objektum kisebb-e 2-nél vagy nagyobb
# egyenlő, mint 0
check_number_and(1)
check_number_and(100)


#----Elágazások - ifelse--------------------------------------------------------
## ifelse szerkezete (ne futtasd le!)
ifelse(feltétel, művelet1, művelet2)

## Egyszerű ifelse műveletek
ifelse(number == 1, "Ez valóban 1.", "Ez nem 1.")
ifelse(number == 0, "Ez valóban 1.", "Ez nem 1.")

# vektorizáltság
numbers <- c(1, 0, 1, 2)
ifelse(numbers == 1, "Ez valóban 1.", "Ez nem 1.")
ifelse(numbers == 1, numbers * 100, numbers)

## Függvény ifelse-szel
## check_number_v2
# check_number függvény ifelse-szel
# megnézi, hogy az argumentumaként kapott objektum egyenlő-e 1-gyel
check_number_v2(1)
check_number_v2(100)
check_number_v2("a")

#----ifelse több feltétel esetén------------------------------------------------
## check_number_complex_v2 függvény
# check_number_complex függvény ifelse-szel
# megnézi, hogy az argumentumaként kapott objektum egyenlő-e 1-gyel
# ha nem, akkor egyenlő-e 0-val
# ha nem, akkor szám-e egyáltalán
check_number_complex_v2(1)
check_number_complex_v2(0)
check_number_complex_v2(100)
check_number_complex_v2("a")

#----ifelse több feltétel egy feltételben való megadása esetén------------------
## check_number_or_v2 függvény
# check_number_or függvény ifelse-szel
# check_number függvény több feltétel együttes megadása esetén
# or (|) használatával
# megnézi, hogy az argumentumaként kapott objektum egyenlő-e 1-gyel vagy 0-val
check_number_or(1)
check_number_or(100)

## check_number_and_v2 függvény
# check_number_and függvény ifelse-szel
# check_number függvény több feltétel együttes megadása esetén
# and (&) használatával
# megnézi, hogy az argumentumaként kapott objektum kisebb-e 2-nél vagy nagyobb
# egyenlő, mint 0
check_number_and(1)
check_number_and(100)


#----Ciklusok - for-------------------------------------------------------------
## for ciklus szerkezete (ne futtasd le!)
for (i in vector) {
  művelet(ek) i index segítségével
}

## Egyszerű for ciklusok
# printeljük ki az egész számokat 1-től 10-ig
for (i in 1:10) {
  print(i)
}

#----For ciklus vektorokkal-----------------------------------------------------
## Iterálás vektor elemein for ciklussal
# hozzunk létre egy vektort páratlan számokkal 1-től 10-ig
odd_numbers <- seq(1, 10, by = 2)
odd_numbers

even_numbers <- NA
# adjunk hozzá minden elemhez 1-t
for (i in 1:length(odd_numbers)) {
  even_numbers[i] <- odd_numbers[i] + 1
}
even_numbers

# nincs sok értelme, a matematikai műveletek alapból vektorizáltak
odd_numbers + 1

#----For ciklus mátrixokkal-----------------------------------------------------
## Iterálás mátrix elemein for ciklussal
# készítsünk egy 5x2-ös mátrixot, ami 1-től 10-ig tartalmazza az egész számokat
m <- matrix(1:10, 5, 2)
m

# adjunk hozzá minden sor első oszlopában lévő elemhez 100-at
for (j in 1:nrow(m)) {
  m[j, 1] <- m[j, 1] + 100
}
m

# osszuk el 2-vel minden oszlop 3. elemét
for (k in 1:ncol(m)) {
  m[3, k] <- m[3, k] / 2
}
m

## matrix_add_100 függvény
# hozzáad egy tetszőleges mátrix első oszlopában lévő elemeihez 100-at
matrix_add_100(matrix(1:10, 5, 2))

## matrix_divided függvény
# elosztja tetszőleges mátrix minden oszlopának 3. elemét tetszőleges számmal
# a mátrixnak legalább 3 sorának kell lennie, ha nem, kiírja, kevesebb van neki
matrix_divided(matrix(1:10, 5, 2), 3)
matrix_divided(matrix(1:10, 2, 5), 3)

#----For ciklus data frame-ekkel------------------------------------------------
## Iterálás data frame elemein for ciklussal
# készítsünk egy 5 sorból és 2 oszlopból álló data frame-et
df <- data.frame(numbers = 1:5, letters = c("a", "b", "c", "d", "e"),
                  stringsAsFactors = F)
df

# szorozzuk meg 2-vel a numbers oszlopban lévő elemeket
for (i in 1:nrow(df)){
  df$numbers[i] <- df$numbers[i] * 2
}
df

# fűzzünk hozzá egy "a" betűt a letters oszlop minden eleméhez 
for (j in 1:nrow(df)){
  df$letters[j] <- paste0(df$letters[j], "a")
}
df

## df_multiply függvény
# megszorozza egy tetszőleges df tetszőleges sorát tetszőleges számmal
# a megadott oszlopnak számnak kell lennie
# a szorzószám default értéke 2
df <- data.frame(numbers = 1:5, letters = c("a", "b", "c", "d", "e"),
                 stringsAsFactors = F)
df_multiply(df, "numbers")
df_multiply(df, "letters")

## df_paste függvény
# tetszőleges df teszőleges oszlopához fűz hozzá egy tetszőleges karaktert
# a megadott oszlopnak karakter típusúnak kell lennie
# a hozzáfűzendő karakter default értéke "a"
df_paste(df, "numbers")
df_paste(df, "letters")

#----For ciklus menetének befolyásolása-----------------------------------------
## next
# printeljük ki az egész számokat 1-től 10-ig, de hagyjuk ki a 3-ast
for (i in 1:10) {
  if (i == 3) {
    next
  }
  print(i)
}

## break
# készítsünk egy for ciklust, ami alapesetben kiprintelné az egész számokat
# 1-től 10-ig, de csak 3-ig engedjük
for (i in 1:10) {
  if (i == 4) {
    break
  }
  print(i)
}


#----Ciklusok - while-----------------------------------------------------------
## while ciklus szerkezete (ne futtasd le!)
while (feltétel) {
  művelet
}

## Egyszerű while ciklusok
# printeljük ki az egész számokat 1-től 10-ig
x <- 1
while (x <= 10) {
  print(x)
  x <- x + 1
}

#----While ciklus mátrixokkal---------------------------------------------------
## Iterálás mátrix elemein for ciklussal
# készítsünk egy 5x2-ös mátrixot, ami 1-től 10-ig tartalmazza az egész számokat
m <- matrix(1:10, 5, 2)
m

# adjunk hozzá minden sor első oszlopában lévő elemhez 100-at
j <- 1
while (j <= nrow(m)) {
  m[j, 1] <- m[j, 1] + 100
  j <- j + 1
}
m

# osszuk el 2-vel minden oszlop 3. elemét
k <- 1
while (k <= ncol(m)) {
  m[3, k] <- m[3, k] / 2
  k <- k + 1
}
m

## matrix_add_100_v2 függvény
# matrix_add_100 while-lal
# hozzáad egy tetszőleges mátrix első oszlopában lévő elemeihez 100-at
matrix_add_100_v2(matrix(1:10, 5, 2))

## matrix_divided_v2 függvény
# matrix_divided while-lal
# elosztja tetszőleges mátrix minden oszlopának 3. elemét tetszőleges számmal
# a mátrixnak legalább 3 sorának kell lennie, ha nem, kiírja, kevesebb van neki
matrix_divided_v2(matrix(1:10, 5, 2), 3)
matrix_divided_v2(matrix(1:10, 2, 5), 3)

#----While ciklus data frame-ekkel----------------------------------------------
## Iterálás data frame elemein for ciklussal
# készítsünk egy 5 sorból és 2 oszlopból álló data frame-et
df <- data.frame(numbers = 1:5, letters = c("a", "b", "c", "d", "e"),
                  stringsAsFactors = F)
df

# szorozzuk meg 2-vel a numbers oszlopban lévő elemeket
i <- 1
while (i <= nrow(df)){
  df$numbers[i] <- df$numbers[i] * 2
  i <- i + 1
}
df

# fűzzünk hozzá egy "a" betűt a letters oszlop minden eleméhez 
j <- 1
while (j <= nrow(df)){
  df$letters[j] <- paste0(df$letters[j], "a")
  j <- j + 1
}
df

## df_multiply_v2 függvény
# df_multiply while-lal
# megszorozza egy tetszőleges df tetszőleges sorát tetszőleges számmal
# a megadott oszlopnak számnak kell lennie
# a szorzószám default értéke 2
df <- data.frame(numbers = 1:5, letters = c("a", "b", "c", "d", "e"),
                 stringsAsFactors = F)
df_multiply_v2(df, "numbers")
df_multiply_v2(df, "letters")

## df_paste_v2 függvény
# df_paste while-lal
# tetszőleges df teszőleges oszlopához fűz hozzá egy tetszőleges karaktert
# a megadott oszlopnak karakter típusúnak kell lennie
# a hozzáfűzendő karakter default értéke "a"
df_paste_v2(df, "numbers")
df_paste_v2(df, "letters")
