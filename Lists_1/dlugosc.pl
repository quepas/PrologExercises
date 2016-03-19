dlugosc([], 0).
dlugosc([_|Ogon], Dlug) :-
	dlugosc(Ogon, X),
	Dlug is X+1.