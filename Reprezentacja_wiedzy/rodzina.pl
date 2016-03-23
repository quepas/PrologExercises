rodzina(
    osoba(jan,  kowalski, data(5,kwiecien,1946), pracuje(tpsa,3000)),
    osoba(anna, kowalski, data(8,luty,1949), pracuje(szkola,1500)),
    [
        osoba(maria, kowalski, data(20,maj,1973), pracuje(argo_turist,4000)),
        osoba(pawel, kowalski, data(15,listopad,1979), zasilek)
    ]
).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Zadanie:
%   Wyciągnij datę urodzenia wszystich członków rodziny.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
dataUr(osoba(_, _, data(_, _, X), _), X).

analizuj(X) :-
    rodzina(A,_,_),
    dataUr(A,X).
analizuj(X) :-
    rodzina(_, A,_),
    dataUr(A,X).
analizuj(X) :-
    rodzina(_,_,A),
    member(B, A),
    dataUr(B, X).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Zadanie:
%   Wyciągnij imiona i nazwiska osób urodzonych w danym roku
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
imieNaziwskoOsoby(osoba(X, Y, _, _), X, Y).
imieNaziwskoOsobyRok(osoba(X, Y, data(_,_, R), _), X, Y, R).

analizujRok(I, M, X) :-
    rodzina(A,_,_),
    imieNaziwskoOsobyRok(A, I, M, X).
analizujRok(I, M, X) :-
    rodzina(_, A,_),
    imieNaziwskoOsobyRok(A, I, M, X).
analizujRok(I, M, X) :-
    rodzina(_,_,A),
    member(B, A),
    imieNaziwskoOsobyRok(B, I, M, X).

