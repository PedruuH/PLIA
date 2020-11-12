%------------------------------------------------------------------------------
% Autor:
% Data: 26/09/2017
%https://rachacuca.com.br/logica/problemas/sala-de-espera/
%------------------------------------------------------------------------------

resolve(S) :-
           S = sala(paciente(_,_,_,_,_,_),
                    paciente(_,_,_,_,_,_),
                    paciente(_,_,_,_,_,_),
                    paciente(_,_,_,_,_,_),
                    paciente(_,_,_,_,_,_)),

%A pessoa que veio fazer uma obturação está lendo a revista Caras.
           pessoa(A,S),
           revista(A,caras),
           motivo(A,obturacao),

%Quem está lendo a Veja está em algum lugar entre o Eduardo e quem está
%com a revista Galileu, nessa ordem.
           algum_lugar_entre(C,D,E,S),
           revista(C,veja),
           nome(D,eduardo),
           revista(E,galileu),

%Quem veio ajustar o Aparelho está em algum lugar entre quem está lendo
%Isto É e quem veio fazer a restauração, nessa ordem.
           algum_lugar_entre(F,G,H,S),
           motivo(F,aparelho),
           revista(G,istoeh),
           motivo(H, restauracao),

%O paciente da Dra. Raquel está lendo a revista Galileu.
           pessoa(I,S),
           dentista(I,raquel),
           revista(I,galileu),

%O Álvaro é o paciente da Priscila.
           pessoa(J,S),
           nome(J,alvaro),
           dentista(J,priscila),

%O Marcos está em algum lugar entre o paciente de camisa Amarela e o Rodrigo,
%nessa ordem.
           algum_lugar_entre(K,L,M,S),
           nome(K,marcos),
           camisa(L,amarela),
           nome(M,rodrigo),

%O paciente que veio fazer uma Restauração está em algum lugar entre
%quem veio tratar o Canal e quem veio fazer uma Obturação, nessa ordem.
           algum_lugar_entre(N,O,P,S),
           motivo(N,restauracao),
           motivo(O,canal),
           motivo(P, obturacao),

%A pessoa de Amarelo está em algum lugar à esquerda do paciente
%agendado às 10:30.
           algum_lugar_a_esquerda(R,T,S),
           camisa(R,amarela),
           horario(T, dez_e_meia),

%A Raquel irá atender o paciente do meio.
           paciente_meio(U,S),
           dentista(U,raquel),

%Quem tem consulta às 10:15 está sentado em uma das pontas.
           uma_das_pontas(V,S),
           horario(V, dez_e_quinze),

%O primeiro paciente será atendido pela Silvia.
           primeiro(X,S),
           dentista(X,silvia),

%O homem de camisa Azul está em algum lugar à esquerda de
%quem tem consulta as 11h.
           algum_lugar_a_esquerda(A1,A2,S),
           camisa(A1,azul),
           horario(A2, onze),

%A pessoa de camisa Verde está em algum lugar entre a pessoa com camisa
%Vermelha e a pessoa de camisa Azul, nessa ordem.
           algum_lugar_entre(A3,A4,A5,S),
           camisa(A3,verde),
           camisa(A4,vermelha),
           camisa(A5,azul),

%O quarto paciente será atendido as 10h.
           quarto_paciente(A6,S),
           horario(A6,dez),

%O paciente da Dra Adriana está em algum lugar entre os pacientes das doutoras Raquel e Priscila, nessa ordem.
           algum_lugar_entre(B1,B2,B3,S),
           dentista(B1,adriana),
           dentista(B2,raquel),
           dentista(B3,priscila),

%O paciente da Dra. Pricila está exatamente à direita de quem está com a revista Caras.
           exatamente_a_direita(B4,B5,S),
           dentista(B4,priscila),
           revista(B5,caras),

%O homem de camisa Amarela está em algum lugar entre quem está lendo Isto É e quem veio de camisa Branca, nessa ordem.
           algum_lugar_entre(B6,B7,B8,S),
           camisa(B6,amarela),
           revista(B7,istoeh),
           camisa(B8,branca),

%Restrições de fechamento
           pessoa(B9,S),
           nome(B9, celso),

           pessoa(C0,S),
           revista(C0, epoca),

           pessoa(C1, S),
           dentista(C1, danielle),

           pessoa(C2, S),
           horario(C2, dez_quarentaecinco),

           pessoa(C3, S),
           motivo(C3, clareamento).


pessoa(X,sala(X,_,_,_,_)).
pessoa(X,sala(_,X,_,_,_)).
pessoa(X,sala(_,_,X,_,_)).
pessoa(X,sala(_,_,_,X,_)).
pessoa(X,sala(_,_,_,_,X)).

camisa(paciente(X,_,_,_,_,_),X).
nome(paciente(_,X,_,_,_,_),X).
revista(paciente(_,_,X,_,_,_),X).
dentista(paciente(_,_,_,X,_,_),X).
horario(paciente(_,_,_,_,X,_),X).
motivo(paciente(_,_,_,_,_,X),X).

uma_das_pontas(X,sala(X,_,_,_,_)).
uma_das_pontas(X,sala(_,_,_,_,X)).

algum_lugar_a_esquerda(X,Y,sala(X,Y,_,_,_)).
algum_lugar_a_esquerda(X,Y,sala(X,_,Y,_,_)).
algum_lugar_a_esquerda(X,Y,sala(X,_,_,Y,_)).
algum_lugar_a_esquerda(X,Y,sala(X,_,_,_,Y)).
algum_lugar_a_esquerda(X,Y,sala(_,X,Y,_,_)).
algum_lugar_a_esquerda(X,Y,sala(_,X,_,Y,_)).
algum_lugar_a_esquerda(X,Y,sala(_,X,_,_,Y)).
algum_lugar_a_esquerda(X,Y,sala(_,_,X,Y,_)).
algum_lugar_a_esquerda(X,Y,sala(_,_,X,_,Y)).
algum_lugar_a_esquerda(X,Y,sala(_,_,_,X,Y)).

exatamente_a_direita(X,Y,sala(Y,X,_,_,_)).
exatamente_a_direita(X,Y,sala(_,Y,X,_,_)).
exatamente_a_direita(X,Y,sala(_,_,Y,X,_)).
exatamente_a_direita(X,Y,sala(_,_,_,Y,X)).

algum_lugar_entre(X,Y,Z,sala(Y,X,Z,_,_)).
algum_lugar_entre(X,Y,Z,sala(Y,X,_,Z,_)).
algum_lugar_entre(X,Y,Z,sala(Y,X,_,_,Z)).
algum_lugar_entre(X,Y,Z,sala(Y,_,X,Z,_)).
algum_lugar_entre(X,Y,Z,sala(Y,_,X,_,Z)).
algum_lugar_entre(X,Y,Z,sala(Y,_,_,X,Z)).
algum_lugar_entre(X,Y,Z,sala(_,Y,X,Z,_)).
algum_lugar_entre(X,Y,Z,sala(_,Y,X,_,Z)).
algum_lugar_entre(X,Y,Z,sala(_,Y,_,X,Z)).
algum_lugar_entre(X,Y,Z,sala(_,_,Y,X,Z)).

quarto_paciente(X,sala(_,_,_,X,_)).

paciente_meio(X,sala(_,_,X,_,_)).

primeiro(X,sala(X,_,_,_,_)).



































