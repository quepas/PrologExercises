:- include('../Lists_1/sklej.pl').

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Zadanie:
% 	Zdefiniować predykat, powodujący usunięcie 3 pierwszych
%   elementów listy L1, w wyniku powstaje lista L2, (użyć sklej).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% no. 1 (Prolog way)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
usun3pierwsze_ver1([], []).
usun3pierwsze_ver1([_], []).
usun3pierwsze_ver1([_, _], []).
usun3pierwsze_ver1([_, _, _|L2], L2).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% no. 2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
usun3pierwsze_ver2([], []).
usun3pierwsze_ver2([_], []).
usun3pierwsze_ver2([_, _], []).
usun3pierwsze_ver2(L1, L2) :-
	sklej([_, _, _], L2, L1).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% tests:
% 	W celu odpalania testów, użyj predykatu run_tests.,
% 	po uprzednim załadowaniu pliku.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
:- begin_tests(lists).
:- use_module(library(lists)).

test(usun3pierwsze_ver1) :-
        usun3pierwsze_ver1([], []),
        usun3pierwsze_ver1([a], []),
        usun3pierwsze_ver1([a, b], []),
        usun3pierwsze_ver1([a, b, c], []),
        usun3pierwsze_ver1([a, b, c, d], [d]),
        usun3pierwsze_ver1([a, b, c, d, e, f], [d, e, f]).

test(usun3pierwsze_ver2) :-
        usun3pierwsze_ver2([], []),
        usun3pierwsze_ver2([a], []),
        usun3pierwsze_ver2([a, b], []),
        usun3pierwsze_ver2([a, b, c], []),
        usun3pierwsze_ver2([a, b, c, d], [d]),
        usun3pierwsze_ver2([a, b, c, d, e, f], [d, e, f]).

:- end_tests(lists).