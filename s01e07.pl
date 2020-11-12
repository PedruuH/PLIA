/*                    O PROBLEMA DA BANDA
Três músicos de uma banda multinacional irão fazer um solo de uma peça 
musical, cada um deles tocando uma única vez. O pianista toca em primeiro 
lugar, João toca saxofone e toca anteriormente ao australiano. Marcos 
veio dos EUA e toca antes do violinista. Um solista veio diretamente 
do Japão e um deles chama-se Sam. Pergunta-se:
    1) Qual a origem de cada músico?
    2) Qual o instrumento de cada músico?
    3) Qual a ordem de execução dos músicos?
*/
% deseja-se uma resposta através de uma estrutura da forma:
% banda(Solista1,Solista2,Solista3)
% solista(Nome,Instrumento,Pais)


resolve_banda(Sol) :-
    Sol = banda(Solista1,Solista2,Solista3),
    %O pianista toca em primeiro lugar 
    instrumento(Solista1,piano),
    %João toca saxofone e toca anteriormente ao australiano
    toca_antes(A,B,Sol),
    nome(A,joao),
    instrumento(A,saxofone),
    pais(B,australia),
    %Marcos veio dos EUA e toca antes do violinista
    toca_antes(C,D,Sol),
    nome(C,marcos),
    pais(C,eua),
    instrumento(D,violino),
    %Um solista veio diretamente do Japão 
    membro(E,Sol),
    pais(E,japao),
    %Um deles chama-se Sam
    membro(F,Sol),
    nome(F,sam).

nome(solista(N,_,_),N). % o nome na estrutura solista é o primeiro parâmetro
instrumento(solista(_,I,_),I). % o instrumento na estrutura solista é o segundo parâmetro
pais(solista(_,_,P),P). % o país na estrutura solista é o terceiro parâmetro

membro(M,banda(M,_,_)). % a banda possui três membros (são três possibilidades)
membro(M,banda(_,M,_)).
membro(M,banda(_,_,M)).

toca_antes(A,B,banda(A,B,_)).
toca_antes(A,B,banda(A,_,B)).
toca_antes(A,B,banda(_,A,B)).






