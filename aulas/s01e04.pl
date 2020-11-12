homem(marcelo).
homem(pedro).
mulher(maria).
mulher(eva).

ser_humano(X) :- homem(X).
ser_humano(X) :- mulher(X).