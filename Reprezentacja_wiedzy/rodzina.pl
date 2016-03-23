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
