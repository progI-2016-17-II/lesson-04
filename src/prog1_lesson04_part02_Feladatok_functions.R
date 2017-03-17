#----Függvények a prog1_lesson04_part02_Feladatok.R fájlhoz---------------------

## greet_person
# ha nem adunk meg értéket vmelyik argumentumnak, 
# véletlenszerűen választ egy értéket a köszönéshez
# ha adunk meg értéket, akkor azt printeli ki a köszönésben
greet_person <- function(greeting, name) {
  greetings <- c("Hello",
                 "Hi",
                 "Good morning",
                 "Yo",
                 "Whattup",
                 "How's it goin'",
                 "Hey",
                 "Goodbye")
  names <- c("World",
             "Mom",
             "Miss Crabtree",
             "Adrian",
             "G",
             "Dude",
             "Jude",
             "Mr. Chips")
  if (missing(greeting)) greeting <- sample(greetings, 1)
  if (missing(name)) name <- sample(names, 1)
  print(paste0(greeting, ", ", name, "!"))
}
