Lista
Conte�do: Stored Procedures e Functions
Esquema:
cliente (cpf, nome, endereco, cpf_responsavel, bloquado)
a coluna pendente pode estar ativa se a reserva ainda n�o foi retirada ou finalizada se o
livro foi retirado.
reserva (cpf, isbn, data, pendente)
aluga (cpf, isbn, data_retirada, data_devolu��o, estado)
livro (isbn, titulo, autor, quantidade_atual, quantidade_total)
irregularidade (cpf, isbn, data_retirada, valor_multa)
(cpf, isbn, data_retirada) referenciam aluga al�m de referenciar cliente e livro
Espere para popular o banco de acordo com os exerc�cios, de forma a verificar se os procedimentos
est�o corretos.
Dica: use o tipo ENUM para a coluna estado, com os poss�veis valores: �retirado�, �atrasado� e
�devolvido�. Qual a desvantagem de usar ENUMs em vez de uma tabela pr�pria?
1) Suponha que existam dois usu�rios que acessam o sistema, o(s) funcion�rio(s) que gerencia(m) as
reservas e pode(m) fazer cadastro de usu�rios e o bibliotec�rio que pode cadastrar livros. Para evitar
que os funcion�rios furtem livros, esse usu�rio s� ter� acesso � biblioteca atrav�s de stored
procedures.
Escreva um procedimento chamado retirada que recebe um cpf e um isbn como par�metros e insere
um registro na tabela aluga com a data atual como data de retirada, a data atual mais 7 dias como
data de devolu��o e marca o estado como �retirado�. Al�m disso, caso exista uma reserva com o
mesmo cpf e isbn e estado ativo, essa reserva dever� ser marcada como finalizada. Se existir uma
pend�ncia para essa pessoa ou qualquer dependente dela ou respons�vel por ela, o sistema n�o
dever� deixar a reserva ser feita. Dever� tamb�m ser feita uma verifica��o se o livro est� dispon�vel
(quantidade_atual > 0) e se o usu�rio e seus dependentes/respons�vel n�o est�(o) bloqueado(s).
Sugest�es: usar a fun��o DATE_ADD() para a data de devolu��o e CURDATE() para a data atual.
2) Fa�a um procedimento devolucao que recebe um cpf e isbn como par�metros e atualiza a tabela
aluga caso o livro n�o esteja em atraso (verifique a data atual). Caso contr�rio, calcule o valor da
multa e insira na tabela irregularidade, caso essa multa n�o exista ainda.
3) Escreva um procedimento chamado bloqueia que n�o recebe nenhum par�metro e que bloqueia o
cliente e seus dependentes ou seu respons�vel caso o cliente tenha 3 ou mais reservas consecutivas
que geraram irregularidades ou se o valor da multa n�o for pago por 1 m�s.
4) Escreva uma fun��o multa que recebe duas datas e retorna o valor da multa segundo o c�lculo:
dias em atraso * 3 + 10.
5) Se poss�vel, crie dois usu�rios e crie permiss�es de acordo com a descri��o na quest�o 1.