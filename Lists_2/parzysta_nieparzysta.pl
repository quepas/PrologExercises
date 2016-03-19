:- include('../Lists_1/dlugosc.pl').
:- include('../Lists_1/sklej.pl').

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Zadanie:
% 	Zdefiniować parę komplementarnych predykatów nieparzysta(L)
%   oraz parzysta(L) sprawdzajacych czy argument jest listą o
%   odpowiednio nie/parzystaj długości.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% no. 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
parzysta_ver1(L1):-
	dlugosc(L1, D),
	0 is D mod 2.

nieparzysta_ver1(L1):-
	\+ parzysta_ver1(L1).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% no. 2 (Prolog way)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
parzysta_ver2([]).
parzysta_ver2([_, _ | T]) :-
        parzysta_ver2(T).

nieparzysta_ver2([_]).
nieparzysta_ver2([_, _ | T]) :-
        nieparzysta_ver2(T).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% no. 3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
parzysta_ver3([]).
parzysta_ver3(L) :-
    sklej(X, [_, _], L),
    parzysta_ver3(X).

nieparzysta_ver3([_]).
nieparzysta_ver3(L) :-
    sklej(X, [_, _], L),
    nieparzysta_ver3(X).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% no. 4
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
nieparzysta_ver4([_]).
nieparzysta_ver4([_|T]):-
    parzysta_ver4(T).

parzysta_ver4([]).
parzysta_ver4([_|T]):-
    nieparzysta_ver4(T).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% tests:
% 	W celu odpalania testów, użyj predykatu run_tests.,
% 	po uprzednim załadowaniu pliku.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
:- begin_tests(lists).
:- use_module(library(lists)).

test(parzysta_ver1) :-
        parzysta_ver1([]),
        \+ parzysta_ver1([a]),
        parzysta_ver1([a, b]),
        \+ parzysta_ver1([a, b, c]).

test(nieparzysta_ver1) :-
		\+ nieparzysta_ver1([]),
		nieparzysta_ver1([a]),
		\+ nieparzysta_ver1([a, b]),
		nieparzysta_ver1([a, b, c]).

test(parzysta_ver2) :-
        parzysta_ver2([]),
        \+ parzysta_ver2([a]),
        parzysta_ver2([a, b]),
        \+ parzysta_ver2([a, b, c]).

test(nieparzysta_ver2) :-
		\+ nieparzysta_ver2([]),
		nieparzysta_ver2([a]),
		\+ nieparzysta_ver2([a, b]),
		nieparzysta_ver2([a, b, c]).

test(parzysta_ver3) :-
        parzysta_ver3([]),
        \+ parzysta_ver3([a]),
        parzysta_ver3([a, b]),
        \+ parzysta_ver3([a, b, c]).

test(nieparzysta_ver3) :-
		\+ nieparzysta_ver3([]),
		nieparzysta_ver3([a]),
		\+ nieparzysta_ver3([a, b]),
		nieparzysta_ver3([a, b, c]).

test(parzysta_ver4) :-
        parzysta_ver4([]),
        \+ parzysta_ver4([a]),
        parzysta_ver4([a, b]),
        \+ parzysta_ver4([a, b, c]).

test(nieparzysta_ver4) :-
		\+ nieparzysta_ver4([]),
		nieparzysta_ver4([a]),
		\+ nieparzysta_ver4([a, b]),
		nieparzysta_ver4([a, b, c]).

:- end_tests(lists).