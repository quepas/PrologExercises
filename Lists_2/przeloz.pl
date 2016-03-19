%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Zadanie:
%   Zdefiniować predykat przeloz(L1, L2), który zamienia
%   listę liczb (max. 0-9), na listę słów.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Baza wiedzy
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
znaczy(0,zero).
znaczy(1,jeden).
znaczy(2,dwa).
znaczy(3,trzy).
znaczy(4,cztery).
znaczy(5,piec).
znaczy(6,szesc).
znaczy(7,siedem).
znaczy(8,osiem).
znaczy(9,dziewiec).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% no. 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
przeloz_ver1([], []).
przeloz_ver1([X|XS],[Y|YS]) :-
    znaczy(X,Y),
    przeloz_ver1(XS,YS).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% tests:
%   W celu odpalania testów, użyj predykatu run_tests.,
%   po uprzednim załadowaniu pliku.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
:- begin_tests(przeloz).

test(przeloz_ver1) :-
    przeloz_ver1([], []),
    przeloz_ver1([1], [jeden]),
    przeloz_ver1([1,4,7], [jeden, cztery, siedem]),
    przeloz_ver1([2, 8, 0], [dwa,osiem,zero]).

:- end_tests(przeloz).
