:- include('../Lists_1/sklej.pl').
:- include('../Lists_1/dlugosc.pl').

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Zadanie:
%   Zdefiniować predykat, powodujący usunięcie 3 pierwszych i
%   ostatnich elementów listy L1, w wyniku powstaje lista L2,
%   (użyć sklej).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% no. 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
usunpo3_ver1(L1, []) :-
    dlugosc(L1, D),
    D < 6.
usunpo3_ver1(L1, L2) :-
    sklej([_, _, _ | L2], [_, _, _], L1).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% no. 2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
usunpo3_ver2(L1, []) :-
    dlugosc(L1, D),
    D < 6.
usunpo3_ver2(L1, L2):-
    sklej(K, [_,_,_], L1),
    sklej([_,_,_], L2, K).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% no. 3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
usun3ostatnie_ver1(L1, []) :-
    dlugosc(L1, D),
    D < 3.
usun3ostatnie_ver1(L1, L2) :-
    sklej(L2, [_, _, _], L1).

usunpo3_ver3(L1, []) :-
    dlugosc(L1, D),
    D < 6.
usunpo3_ver3([_,_,_|T], L2) :-
    usun3ostatnie_ver1(T, L2).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% tests:
%   W celu odpalania testów, użyj predykatu run_tests.,
%   po uprzednim załadowaniu pliku.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
:- begin_tests(usunpo3).

test(usunpo3_ver1) :-
    usunpo3_ver1([], []),
    usunpo3_ver1([a, b, c, d, e], []),
    usunpo3_ver1([a, b, c, d, e, f, g, h, i], [d, e, f]).

test(usunpo3_ver2) :-
    usunpo3_ver2([], []),
    usunpo3_ver2([a, b, c, d, e], []),
    usunpo3_ver2([a, b, c, d, e, f, g, h, i], [d, e, f]).

test(usunpo3_ver3) :-
    usunpo3_ver3([], []),
    usunpo3_ver3([a, b, c, d, e], []),
    usunpo3_ver3([a, b, c, d, e, f, g, h, i], [d, e, f]).

:- end_tests(usunpo3).
