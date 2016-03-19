:- include('../Lists_1/sklej.pl').

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Zadanie:
%   Zdefiniować predykat podzbior(L1, L2), który sprawdza, czy L2
%   zawiera się w L1, oraz wypisuje wszystkie możliwe podzbiory L1
%   (jeżeli L2 jest niewiadoma).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% no. 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
isin([X|_], X).
isin([_|T], Y) :-
    isin(T, Y).

remove_first_X(X, [X|T], T).
remove_first_X(X, [Y|T], [Y|Tn]) :-
    X \= Y,
    remove_first_X(X, T, Tn).

podzbior_ver1(_, []).
podzbior_ver1(X,[H|T]) :-
    isin(X, H),
    remove_first_X(H, X, N),
    podzbior_ver1(N,T).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% tests:
%   W celu odpalania testów, użyj predykatu run_tests.,
%   po uprzednim załadowaniu pliku.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
:- begin_tests(podzbior).

test(podzbior_ver1) :-
    podzbior_ver1([a,b,c],[c]),
    podzbior_ver1([a,b,c],[a,c]),
    podzbior_ver1([a, b, c], []),
    podzbior_ver1([], []),
    \+ podzbior_ver1([], [a, b, c]).

:- end_tests(podzbior).
