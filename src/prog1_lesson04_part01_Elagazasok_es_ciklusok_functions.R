#----Függvények a prog1_lesson04_part01_ELagazasok_es_ciklusok.R fájlhoz--------

#----Elágazások - if és else----------------------------------------------------

## check_number
# megnézi, hogy az argumentumaként kapott objektum egyenlő-e 1-gyel
check_number <- function(number) {
  if (number == 1) {
    print("Ez valóban 1.")
  } else {
    print("Ez nem 1.")
  }
}

## check_number_complex
# check_number függvény több feltétel esetén
# megnézi, hogy az argumentumaként kapott objektum egyenlő-e 1-gyel
# ha nem, akkor egyenlő-e 0-val
# ha nem, akkor szám-e egyáltalán
check_number_complex <- function(number) {
  if (number == 1) {
    print("Ez valóban 1.")
  } else if (number == 0) {
    print("Ez 0.")
  } else if (class(number) != "numeric") {
    print("Ez nem is szám.")
  } else {
    print("Ez se nem 0, se nem 1, de valamilyen szám.")
  }
}

## check_number_or
# check_number függvény több feltétel együttes megadása esetén
# or (|) használatával
# megnézi, hogy az argumentumaként kapott objektum egyenlő-e 1-gyel vagy 0-val
check_number_or <- function(number) {
  if (number == 1 | number == 0) {
    print("Ez 0 vagy 1.")
  } else {
    print("Ez se nem 0, se nem 1.")
  }
}

## check_number_and
# check_number függvény több feltétel együttes megadása esetén
# and (&) használatával
# megnézi, hogy az argumentumaként kapott objektum kisebb-e 2-nél vagy nagyobb
# egyenlő, mint 0
check_number_and <- function(number) {
  if (number < 2 & number >= 0) {
    print("Ez 0 vagy 1.")
  } else {
    print("Ez se nem 0, se nem 1.")
  }
}

#----Elágazások - ifelse--------------------------------------------------------

## check_number_v2
# check_number függvény ifelse-szel
# megnézi, hogy az argumentumaként kapott objektum egyenlő-e 1-gyel
check_number_v2 <- function(number) {
  ifelse (number == 1, "Ez valóban 1.", "Ez nem 1.")
}

## check_number_complex_v2
# check_number_complex függvény ifelse-szel
# megnézi, hogy az argumentumaként kapott objektum egyenlő-e 1-gyel
# ha nem, akkor egyenlő-e 0-val
# ha nem, akkor szám-e egyáltalán
check_number_complex_v2 <- function(number) {
  ifelse (number == 1, "Ez valóban 1.",
          ifelse(number == 0, "Ez 0.",
                 ifelse(class(number) != "numeric", "Ez nem is szám.", 
                        "Ez se nem 0, se nem 1, de valamilyen szám.")))
}

## check_number_or_v2
# check_number_or függvény ifelse-szel
# check_number függvény több feltétel együttes megadása esetén
# or (|) használatával
# megnézi, hogy az argumentumaként kapott objektum egyenlő-e 1-gyel vagy 0-val
check_number_or_v2 <- function(number) {
  ifelse(number == 1 | number == 0, "Ez 0 vagy 1.", "Ez se nem 0, se nem 1.")
}

## check_number_and_v2
# check_number_and függvény ifelse-szel
# check_number függvény több feltétel együttes megadása esetén
# and (&) használatával
# megnézi, hogy az argumentumaként kapott objektum kisebb-e 2-nél vagy nagyobb
# egyenlő, mint 0
check_number_and_v2 <- function(number) {
  ifelse(number < 2 & number >= 0, "Ez 0 vagy 1.", "Ez se nem 0, se nem 1.")
}

#----For ciklus mátrixokkal-----------------------------------------------------
## matrix_add_100
# hozzáad egy tetszőleges mátrix első oszlopában lévő elemeihez 100-at
matrix_add_100 <- function(input_matrix) {
  for (i in 1:nrow(input_matrix)) {
    input_matrix[i, 1] <- input_matrix[i, 1] + 100
  }
  input_matrix
}

## matrix_divided
# elosztja tetszőleges mátrix minden oszlopának 3. elemét tetszőleges számmal
# a mátrixnak legalább 3 sorának kell lennie, ha nem, kiírja, kevesebb van neki
matrix_divided <- function(input_matrix, divide_by = 2) {
  if (nrow(input_matrix) >= 3) {
    for (i in 1:ncol(input_matrix)) {
      input_matrix[3, i] <- input_matrix[3, i] / divide_by
    }
    input_matrix
  } else {
    print("Ennek a mátrixnak kevesebb sora van, mint 3.")
  }
}

#----For ciklus data frame-ekkel------------------------------------------------
## df_multiply
# megszorozza egy tetszőleges df tetszőleges sorát tetszőleges számmal
# a megadott oszlopnak számnak kell lennie
# a szorzószám default értéke 2
df_multiply <- function(input_df, column, multiply_by = 2) {
  if (class(input_df[[column]]) == "integer") {
    for (i in 1:nrow(input_df)){
      input_df[i, column] <- input_df[i, column] * multiply_by
    }
    input_df
  } else {
    print("A megadott oszlop nem szám típusú.")
  }
}

## df_paste
# tetszőleges df teszőleges oszlopához fűz hozzá egy tetszőleges karaktert
# a megadott oszlopnak karakter típusúnak kell lennie
# a hozzáfűzendő karakter default értéke "a"
df_paste <- function(input_df, column, paste_character = "a") {
  if (class(input_df[[column]]) == "character") {
    for (i in 1:nrow(input_df)){
      input_df[i, column] <- paste0(input_df[i, column], "a")
    }
    input_df
  } else {
    print("A megadott oszlop nem karakter típusú.")
  }
}

#----While ciklus mátrixokkal---------------------------------------------------
## matrix_add_100_v2
# matrix_add_100 while-lal
# hozzáad egy tetszőleges mátrix első oszlopában lévő elemeihez 100-at
matrix_add_100_v2 <- function(input_matrix) {
  i <- 1
  while (i <= nrow(input_matrix)) {
    input_matrix[i, 1] <- input_matrix[i, 1] + 100
    i <- i + 1
  }
  input_matrix
}

## matrix_divided_v2
# matrix_divided while-lal
# elosztja tetszőleges mátrix minden oszlopának 3. elemét tetszőleges számmal
# a mátrixnak legalább 3 sorának kell lennie, ha nem, kiírja, kevesebb van neki
matrix_divided_v2 <- function(input_matrix, divide_by = 2) {
  if (nrow(input_matrix) >= 3) {
    i <- 1
    while (i <= ncol(input_matrix)) {
      input_matrix[3, i] <- input_matrix[3, i] / divide_by
      i <- i + 1
    }
    input_matrix
  } else {
    print("Ennek a mátrixnak kevesebb sora van, mint 3.")
  }
}

#----While ciklus data frame-ekkel----------------------------------------------
## df_multiply_v2
# df_multiply while-lal
# megszorozza egy tetszőleges df tetszőleges sorát tetszőleges számmal
# a megadott oszlopnak számnak kell lennie
# a szorzószám default értéke 2
df_multiply_v2 <- function(input_df, column, multiply_by = 2) {
  if (class(input_df[[column]]) == "integer") {
    i <- 1
    while (i <= nrow(input_df)) {
      input_df[i, column] <- input_df[i, column] * multiply_by
      i <- i + 1
    }
    input_df
  } else {
    print("A megadott oszlop nem szám típusú.")
  }
}

## df_paste_v2
# df_paste while-lal
# tetszőleges df teszőleges oszlopához fűz hozzá egy tetszőleges karaktert
# a megadott oszlopnak karakter típusúnak kell lennie
# a hozzáfűzendő karakter default értéke "a"
df_paste_v2 <- function(input_df, column, paste_character = "a") {
  if (class(input_df[[column]]) == "character") {
    i <- 1
    while (i <= nrow(input_df)) {
      input_df[i, column] <- paste0(input_df[i, column], "a")
      i <- i + 1
    }
    input_df
  } else {
    print("A megadott oszlop nem karakter típusú.")
  }
}
