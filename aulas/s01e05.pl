resolve2grau(A,B,C, Resp) :-
    calcula_delta(A,B,C,Delta),
    calcula_raizes(A,B,Delta,Resp).

calcula_delta(A,B,C,Delta) :-
    Delta is B*B-4*A*C.

calcula_raizes(_,_,Delta,resposta('não existem raízes reais')) :-
    Delta < 0.

calcula_raizes(A,B,Delta,resposta(Raiz)) :-
    Delta = 0,
    Raiz is -B/(2*A).

calcula_raizes(A,B,Delta,resposta(Raiz1,Raiz2) :-
    Delta > 0,
    RaizDelta is sqrt(Delta),
    Raiz1 is (-B+RaizDelta)/(2*A),
    Raiz2 is (-B-RaizDelta)/(2*A).
