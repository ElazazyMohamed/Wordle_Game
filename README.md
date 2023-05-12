# Wordle_Game

This Project is an implementation of a modified version of the game Wordle in
Prolog (Pro-Wordle). 

The Pro-Wordle game is made up of two main phases:

(1) a knowledge base building phase and 
In the KB building phase, the player is prompted to enter words with their categories.This continues until the player enters done.

Below is a sample of the interaction between the game and the player in the KB building phase.

----------------------
Please enter a word and its category on separate lines:
|: horse.
|: animals.
Please enter a word and its category on separate lines:
|: panda.
|: animals.
Please enter a word and its category on separate lines:
|: hello.
|: greetings.
Please enter a word and its category on separate lines:
|: banana.
|: fruits.
Please enter a word and its category on separate lines:
|: bison.
|: animals.
Please enter a word and its category on separate lines:
|: hoard.
|: collections.
Please enter a word and its category on separate lines:
|: done.
Done building the words database...


(2) a game play phase.

After the KB building phase, the game play phase begins. The game displays to the user
the available categories to pick one from. The player is then prompted to pick a length
and category for the word to be guessed. The game picks a word of the given length and
category and the guessing game begins. The player is allowed a maximum number of
guesses equal to the entered length plus one. In each guess, the user must enter a word of
the chosen length. The game then displays to the user the correctly entered letters (not
necessarily in correct positions), and the correctly entered letters in correct positions.
Below is a sample of the interaction between the game and the player in the game play
phase based on the example KB provided earlier.

The available categories are: [animals,greetings,fruits, collections]
Choose a category:
|: animals.
Choose a length:
|: 9.
There are no words of this length.
Choose a length:
|: 5.
Game started. You have 6 guesses.
Enter a word composed of 5 letters:
|: hello.
Correct letters are: [h,e,o]
Correct letters in correct positions are: [h]
Remaining Guesses are 4
Enter a word composed of 5 letters:
|: hell.
Word is not composed of 5 letters. Try again.
Remaining Guesses are 4
Enter a word composed of 5 letters:
|: hoard.
Correct letters are: [h,o,r]
Correct letters in correct positions are: [h,o]
Remaining Guesses are 3
Enter a word composed of 5 letters:
|: horse.
You Won!