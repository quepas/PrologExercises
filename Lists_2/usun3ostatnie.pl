:- include('../Lists_1/odwroc.pl'). % predykat odwroc zawiera predykat sklej
:- include('../Lists_1/dlugosc.pl').

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Zadanie:
%   Zdefiniować predykat, powodujący usunięcie 3 ostatnich
%   elementów listy L1, w wyniku powstaje lista L2, (użyć sklej).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% no. 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
usun3ostatnie_ver1(L1, []) :-
    dlugosc(L1, D),
    D < 3.
usun3ostatnie_ver1(L1, L2) :-
    sklej(L2, [_, _, _], L1).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% no. 2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
usun_ostatni([_], []).
usun_ostatni([X|L1], [X|L2]) :-
    usun_ostatni(L1, L2).

usun3ostatnie_ver2(L1, []) :-
    dlugosc(L1, D),
    D < 3.
usun3ostatnie_ver2(L1, L2) :-
    usun_ostatni(L1, K1),
    usun_ostatni(K1, K2),
    usun_ostatni(K2, L2).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% no. 3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pobierz3_od_konca(X, [X, _, _]).
pobierz3_od_konca(X, [_|T]) :-
    pobierz3_od_konca(X, T).

usun3ostatnie_ver3(L1, []) :-
    dlugosc(L1, D),
    D < 3.
usun3ostatnie_ver3(L1, L2) :-
    pobierz3_od_konca(Trzeci, L1),
    sklej(L2, [Trzeci|_], L1).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% no. 4 (Prolog way)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
usun3ostatnie_ver4(L1, []) :-
    dlugosc(L1, D),
    D < 4.
usun3ostatnie_ver4([X|L1], [X|L2]) :-
    usun3ostatnie_ver4(L1, L2).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% no. 5
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
usun3ostatnie_ver5(L1, []) :-
    dlugosc(L1, D),
    D < 3.
usun3ostatnie_ver5(L1, L2) :-
    odwroc(L1, [_, _, _|K]),
    odwroc(K, L2).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% tests:
%   W celu odpalania testów, użyj predykatu run_tests.,
%   po uprzednim załadowaniu pliku.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
:- begin_tests(usun3ostatnie).

test(usun3ostatnie_ver1) :-
    usun3ostatnie_ver1([], []),
    usun3ostatnie_ver1([a], []),
    usun3ostatnie_ver1([a, b], []),
    usun3ostatnie_ver1([a, b, c], []),
    usun3ostatnie_ver1([a, b, c, d], [a]),
    usun3ostatnie_ver1([a, b, c, d, e, f], [a, b, c]).

test(usun3ostatnie_ver2) :-
    usun3ostatnie_ver2([], []),
    usun3ostatnie_ver2([a], []),
    usun3ostatnie_ver2([a, b], []),
    usun3ostatnie_ver2([a, b, c], []),
    usun3ostatnie_ver2([a, b, c, d], [a]),
    usun3ostatnie_ver2([a, b, c, d, e, f], [a, b, c]).

test(usun3ostatnie_ver3) :-
    usun3ostatnie_ver3([], []),
    usun3ostatnie_ver3([a], []),
    usun3ostatnie_ver3([a, b], []),
    usun3ostatnie_ver3([a, b, c], []),
    usun3ostatnie_ver3([a, b, c, d], [a]),
    usun3ostatnie_ver3([a, b, c, d, e, f], [a, b, c]).

test(usun3ostatnie_ver4) :-
    usun3ostatnie_ver4([], []),
    usun3ostatnie_ver4([a], []),
    usun3ostatnie_ver4([a, b], []),
    usun3ostatnie_ver4([a, b, c], []),
    usun3ostatnie_ver4([a, b, c, d], [a]),
    usun3ostatnie_ver4([a, b, c, d, e, f], [a, b, c]).

test(usun3ostatnie_ver5) :-
    usun3ostatnie_ver5([], []),
    usun3ostatnie_ver5([a], []),
    usun3ostatnie_ver5([a, b], []),
    usun3ostatnie_ver5([a, b, c], []),
    usun3ostatnie_ver5([a, b, c, d], [a]),
    usun3ostatnie_ver5([a, b, c, d, e, f], [a, b, c]).

:- end_tests(usun3ostatnie).
