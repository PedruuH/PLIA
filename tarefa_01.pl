% Aluno: Pedro Henrique R M Santos 11611ECP017
% ------- Piratas na Taverna -------
% https://rachacuca.com.br/logica/problemas/piratas-na-taverna/

resolve(T) :-
            T = taverna(pirata(_,_,_,_,_,_),
                        pirata(_,_,_,_,_,_),
                        pirata(_,_,_,_,_,_),
                        pirata(_,_,_,_,_,_),
                        pirata(_,_,_,_,_,_)),
        % O pirata com Tapaolho é o comandante do navio que tem 15 canhões.
            pirata(A,T),
            caracteristica(A,tapaolho),
            canhoes(A,15),

        % O Irlandês está em algum lugar à direita do pirata de Vermelho.
            algum_lugar_a_direita(B,C,T),
            nacionalidade(B,irlandes),
            camisa(C,vermelho),

        % O pirata de Bandana está ao lado do pirata que comanda uma tripulação de 80 homens.
        %A tripulação de 80 homens enterrou um baú cheio de Esmeraldas.
            ao_lado(D,E,T), %erro
            caracteristica(D,bandana),
            tripulacao(E,80),
            tesouro(E,esmeraldas),
        % Na segunda posição está o pirata que enterrou um baú cheio de Ouro.
            segunda_posicao(F,T),
            tesouro(F,ouro),
        % O Espanhol está de camisa Azul.
            pirata(G,T),
            nacionalidade(G, espanhol),
            camisa(G,azul),
        % Na terceira posição está o pirata de camisa Vermelho.
            terceira_posicao(H,T),
            camisa(H,vermelho),
        % O pirata que tem um Papagaio está exatamente à esquerda do pirata que enterrou um baú cheio de Rubis.
            exatamente_a_esquerda(I,J,T),
            caracteristica(I,papagaio),
            tesouro(J,rubis),
        %O pirata de Amarelo está exatamente à esquerda do pirata Irlandês.
            exatamente_a_esquerda(K,L,T),
            camisa(K,amarelo),
            nacionalidade(L,irlandes),
        %O pirata Holandês está ao lado do pirata que comanda o navio que tem 20 canhões.
            ao_lado(N,O,T),
            nacionalidade(N,holandes),
            canhoes(O,20),
        %O pirata que comanda o navio com mais canhões está exatamente à direita do pirata que enterrou um baú cheio de Diamantes.
            exatamente_a_direita(P,Q,T),
            canhoes(P,30),
            tesouro(Q,diamantes),
        %O pirata de Vermelho está ao lado do pirata que comanda o navio que tem 10 canhões.
        % A maior tripulação (160) trabalha no navio com a menor quantidade de canhões(10).
            ao_lado(R,S,T),
            camisa(R,vermelho), %erro
            tripulacao(S,160),
            canhoes(S,10),
        %A Bandana está sendo usada pelo pirata de camisa Amarela.
            pirata(U,T),
            caracteristica(U,bandana),
            camisa(U,amarelo),
        %O Francês comanda o navio que tem 25 canhões.
        %A tripulação de 100 homens trabalha no navio que tem 25 canhões.
            pirata(V,T),
            nacionalidade(V,frances),
            canhoes(V,25),
            tripulacao(V,100),
        %O pirata de Perna de pau está ao lado do pirata que lidera uma tripulação de 140 homens.
            ao_lado(W,X,T),
            caracteristica(W,pernadepau),
            tripulacao(X,140),
        %O Inglês está exatamente à direita do pirata que enterrou um baú cheio de Prata.
            exatamente_a_direita(AB,AC,T),
            nacionalidade(AB,ingles),
            tesouro(AC,prata),
        %O navio que tem 20 canhões é comandado pelo pirata de Perna de pau.
            pirata(AE,T),
            caracteristica(AE,pernadepau),
            canhoes(AE,20),
        %O pirata Inglês está exatamente à esquerda do pirata que comanda uma tripulação de 100 homens.
            exatamente_a_esquerda(AF,AG,T),
            nacionalidade(AF,ingles),
            tripulacao(AG,100),
        %O pirata de camiseta Branca está ao lado do pirata que enterrou um baú cheio de Prata.
            ao_lado(AH,AI,T),
            camisa(AH,branca),
            tesouro(AI,prata),
        
        %fechamento
            pirata(AW,T),
            caracteristica(AW,cicatriz),
            pirata(AL,T),
            tripulacao(AL,120),
            pirata(AK,T),
            camisa(AK,verde).


pirata(X,taverna(X,_,_,_,_)).
pirata(X,taverna(_,X,_,_,_)).
pirata(X,taverna(_,_,X,_,_)).
pirata(X,taverna(_,_,_,X,_)).
pirata(X,taverna(_,_,_,_,X)).

camisa(pirata(X,_,_,_,_,_),X).
nacionalidade(pirata(_,X,_,_,_,_),X).
caracteristica(pirata(_,_,X,_,_,_),X).
tripulacao(pirata(_,_,_,X,_,_),X).
canhoes(pirata(_,_,_,_,X,_),X).
tesouro(pirata(_,_,_,_,_,X),X).

segunda_posicao(X,taverna(_,X,_,_,_)).
terceira_posicao(X,taverna(_,_,X,_,_)).

exatamente_a_esquerda(Y,X,taverna(Y,X,_,_,_)).
exatamente_a_esquerda(Y,X,taverna(_,Y,X,_,_)).
exatamente_a_esquerda(Y,X,taverna(_,_,Y,X,_)).
exatamente_a_esquerda(Y,X,taverna(_,_,_,Y,X)).

ao_lado(X,Y,taverna(X,Y,_,_,_)).
ao_lado(X,Y,taverna(_,X,Y,_,_)).
ao_lado(X,Y,taverna(_,_,X,Y,_)).
ao_lado(X,Y,taverna(_,_,_,X,Y)).
ao_lado(X,Y,taverna(_,_,_,Y,X)).
ao_lado(X,Y,taverna(_,_,Y,X,_)).
ao_lado(X,Y,taverna(_,Y,X,_,_)).
ao_lado(X,Y,taverna(Y,X,_,_,_)).

exatamente_a_direita(X,Y,taverna(Y,X,_,_,_)).
exatamente_a_direita(X,Y,taverna(_,Y,X,_,_)).
exatamente_a_direita(X,Y,taverna(_,_,Y,X,_)).
exatamente_a_direita(X,Y,taverna(_,_,_,Y,X)).

algum_lugar_a_direita(Y,X,taverna(X,Y,_,_,_)).
algum_lugar_a_direita(Y,X,taverna(X,_,Y,_,_)).
algum_lugar_a_direita(Y,X,taverna(X,_,_,Y,_)).
algum_lugar_a_direita(Y,X,taverna(X,_,_,_,Y)).
algum_lugar_a_direita(Y,X,taverna(_,X,Y,_,_)).
algum_lugar_a_direita(Y,X,taverna(_,X,_,Y,_)).
algum_lugar_a_direita(Y,X,taverna(_,X,_,_,Y)).
algum_lugar_a_direita(Y,X,taverna(_,_,X,Y,_)).
algum_lugar_a_direita(Y,X,taverna(_,_,X,_,Y)).
algum_lugar_a_direita(Y,X,taverna(_,_,_,X,Y)).

