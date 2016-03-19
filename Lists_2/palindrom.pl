:- include('../Lists_1/odwroc.pl').

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Zadanie:
% 	Zdefiniować predykat palindrom(L), L jest palindromem,
%   jeżeli czyta się tak samo od przodu i tyłu, np. [a,l,a],
%   [m,a,d,a,m]. (podpowiedź: można nie/użyć odwroc.)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% no. 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
palindrom_ver1(L) :-
    odwroc(L, L).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% no. 2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
palindrom_ver2([]).
palindrom_ver2([_]).
palindrom_ver2([A|L]) :-
    sklej(K, [A], L),
    palindrom_ver2(K).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% tests:
% 	W celu odpalania testów, użyj predykatu run_tests.,
% 	po uprzednim załadowaniu pliku.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
:- begin_tests(lists).
:- use_module(library(lists)).

test(palindrom_ver1) :-
        palindrom_ver1([]),
        palindrom_ver1([a]),
        palindrom_ver1([a, b, a]),
        palindrom_ver1([a, b, b, 1, b, b, a]),
        \+ palindrom_ver1([a, b]).

test(palindrom_ver2) :-
        palindrom_ver2([]),
        palindrom_ver2([a]),
        palindrom_ver2([a, b, a]),
        palindrom_ver2([a, b, b, 1, b, b, a]),
        \+ palindrom_ver2([a, b]).

:- end_tests(lists).