:- include('../Lists_1/dlugosc.pl').
:- include('../Lists_1/sklej.pl').

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Zadanie:
%   zdefiniować predykat podziel(L,L1,L2), który dzieli listę L,
%   na dwa fragmenty L1 i L2, mniej więcej równej długości
%   (z dokładnością do jednego el.)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% no. 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
podziel_ver1([], [], []).
podziel_ver1([H], [H], []).
podziel_ver1([H1,H2|T], [H1|L1], [H2|L2]):-
    podziel_ver1(T, L1, L2).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% no. 2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
podziel_ver2(L, L1, L2):-
    sklej(L1, L2, L),
    dlugosc(L1, D),
    dlugosc(L2, D).

podziel_ver2(L, L1, L2):-
    sklej(L1, L2, L),
    dlugosc(L1, D),
    dlugosc(L2, X),
    X is D-1.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% tests:
%       W celu odpalania testów, użyj predykatu run_tests.,
%       po uprzednim załadowaniu pliku.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
:- begin_tests(podziel).

test(podziel_ver1) :-
    podziel_ver1([], [], []),
    podziel_ver1([1], [1], []),
    podziel_ver1([1, 2], [1], [2]),
    podziel_ver1([1, 2, 3], [1, 3], [2]),
    podziel_ver1([1, 2, 3, 4], [1, 3], [2, 4]),
    podziel_ver1([1, 2, 3, 4, 5], [1, 3, 5], [2, 4]),
    podziel_ver1([1, 2, 3, 4, 5, 6, 7, 8], [1, 3, 5, 7], [2, 4, 6, 8]).

test(podziel_ver2) :-
    podziel_ver2([], [], []),
    podziel_ver2([1], [1], []),
    podziel_ver2([1, 2], [1], [2]),
    podziel_ver2([1, 2, 3], [1, 2], [3]),
    podziel_ver2([1, 2, 3, 4], [1, 2], [3, 4]),
    podziel_ver2([1, 2, 3, 4, 5], [1, 2, 3], [4, 5]),
    podziel_ver2([1, 2, 3, 4, 5, 6, 7, 8], [1, 2, 3, 4], [5, 6, 7, 8]).

:- end_tests(podziel).