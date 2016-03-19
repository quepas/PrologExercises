:- include('../Lists_1/sklej.pl').

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Zadanie:
%   Zdefiniować predykat przesun(L1, L2), gdzie L2, jest
%   przesuniętą rotacyjnie o jeden element L1.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% no. 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
przesun_ver1([], []).
przesun_ver1([H|T],L2):-
    sklej(T,[H],L2).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% tests:
%   W celu odpalania testów, użyj predykatu run_tests.,
%   po uprzednim załadowaniu pliku.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
:- begin_tests(przesun).

test(przesun_ver1) :-
    przesun_ver1([1, 2, 3, 4, 5, 6, 7, 8], [2, 3, 4, 5, 6, 7, 8, 1]),
    przesun_ver1([2, 3, 4, 5, 6, 7, 8, 1], [3, 4, 5, 6, 7, 8, 1, 2]),
    przesun_ver1([3, 4, 5, 6, 7, 8, 1, 2], [4, 5, 6, 7, 8, 1, 2, 3]),
    przesun_ver1([], []),
    przesun_ver1([a], [a]).

:- end_tests(przesun).