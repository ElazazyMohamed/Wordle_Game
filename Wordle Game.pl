build_kb:-	write('Please enter a word and its category on separate lines:'),nl,
			read(W), ( W = done ; read(C), assert(word(W,C))   , build_kb  ,nl ).


is_category(C):- word(_,C).

:- dynamic word/1 .


categories(L):- setof(C,W^word(W,C),L).
words(L):- setof(W,C^word(W,C),L).

available_length(L):-   words(W), available_length_helper(W,L).
available_length_helper([H|T],L):- string_length(H,L) ; available_length_helper(T,L).

pick_word(W,L,C):- word(W,C) , string_length(W,L).

correct_letters(L1,L2,CL) :- intersection(L1,L2,CL).

correct_positions([A|B],[A|C],[A|D]) :- correct_positions(B,C,D).
correct_positions([A|B],[A1|C],D) :- 	A\= A1,correct_positions(B,C,D).
correct_positions([],_,[]):- !.
correct_positions(_,[],[]).


choose_category :- write('Choose a category:'),nl,read(X),choose_category_helper(X).
choose_category_helper(X):- is_category(X),assert(catchoice(X)).
choose_category_helper(X):- \+is_category(X),write('This category does not exist.'),nl,choose_category.

choose_length:- write('Choose a length:'),nl,read(X),choose_length_helper(X).
choose_length_helper(X) :- catchoice(L),word(W,L),string_length(W,X),assert(wordchoice(W)),assert(lenchoice(X)).
choose_length_helper(X) :- catchoice(L),word(W,L),string_length(W,Y) ,X\=Y,write('There are no words of this length.'),
						   nl,choose_length.



body(W,L,G):- write('Enter a word composed of '),write(L),write(' letters: '),nl,read(X),string_length(X,L2),
				bodyhelper(W,X,L,L2,G).

bodyhelper(W,X,L,L,1):- X \= W ,write('You Lost!'),!.
bodyhelper(W,W,_,_,_):- write('You Won!'),!.
bodyhelper(W,X,L,L,G):- string_chars(X,X2),string_chars(W,W2),correct_letters(W2,X2,R),
				write('Correct letters are: '),write(R),nl,correct_positions(W2,X2,R2),
				write('Correct letters in correct positions are: '),write(R2),nl, G2 is G - 1,
				write('Remaining Guesses are '),write(G2),nl,nl,body(W,L,G2).



bodyhelper(W,_,L,L2,G):- L \= L2 , write('Word is not composed of ') ,write(L),write(' letters. Try again.'),
						nl,write('Remaining Guesses are '),write(G),nl,nl,body(W,L,G).
 






play:-  write('The available categories are: ' ),categories(C),write(C),nl,
		choose_category,
		choose_length,write('Game started. '),lenchoice(L),L1 is L + 1 ,assert(guesses(L1)),
		write('You have '),write(L1),write(' guesses.'),wordchoice(W),nl,
		body(W,L,L1).
		
main:- write('Welcome to Pro-Wordle!'),nl,write('----------------------'),nl,nl,
		build_kb,write('Done building the words database...'),nl,play.
		





