Lista
Conteúdo: Stored Procedures e Functions
Esquema:
cliente (cpf, nome, endereco, cpf_responsavel, bloquado)
a coluna pendente pode estar ativa se a reserva ainda não foi retirada ou finalizada se o
livro foi retirado.
reserva (cpf, isbn, data, pendente)
aluga (cpf, isbn, data_retirada, data_devolução, estado)
livro (isbn, titulo, autor, quantidade_atual, quantidade_total)
irregularidade (cpf, isbn, data_retirada, valor_multa)
(cpf, isbn, data_retirada) referenciam aluga além de referenciar cliente e livro
Espere para popular o banco de acordo com os exercícios, de forma a verificar se os procedimentos
estão corretos.
Dica: use o tipo ENUM para a coluna estado, com os possíveis valores: “retirado”, “atrasado” e
“devolvido”. Qual a desvantagem de usar ENUMs em vez de uma tabela própria?
1) Suponha que existam dois usuários que acessam o sistema, o(s) funcionário(s) que gerencia(m) as
reservas e pode(m) fazer cadastro de usuários e o bibliotecário que pode cadastrar livros. Para evitar
que os funcionários furtem livros, esse usuário só terá acesso à biblioteca através de stored
procedures.
Escreva um procedimento chamado retirada que recebe um cpf e um isbn como parâmetros e insere
um registro na tabela aluga com a data atual como data de retirada, a data atual mais 7 dias como
data de devolução e marca o estado como “retirado”. Além disso, caso exista uma reserva com o
mesmo cpf e isbn e estado ativo, essa reserva deverá ser marcada como finalizada. Se existir uma
pendência para essa pessoa ou qualquer dependente dela ou responsável por ela, o sistema não
deverá deixar a reserva ser feita. Deverá também ser feita uma verificação se o livro está disponível
(quantidade_atual > 0) e se o usuário e seus dependentes/responsável não está(o) bloqueado(s).
Sugestões: usar a função DATE_ADD() para a data de devolução e CURDATE() para a data atual.
2) Faça um procedimento devolucao que recebe um cpf e isbn como parâmetros e atualiza a tabela
aluga caso o livro não esteja em atraso (verifique a data atual). Caso contrário, calcule o valor da
multa e insira na tabela irregularidade, caso essa multa não exista ainda.
3) Escreva um procedimento chamado bloqueia que não recebe nenhum parâmetro e que bloqueia o
cliente e seus dependentes ou seu responsável caso o cliente tenha 3 ou mais reservas consecutivas
que geraram irregularidades ou se o valor da multa não for pago por 1 mês.
4) Escreva uma função multa que recebe duas datas e retorna o valor da multa segundo o cálculo:
dias em atraso * 3 + 10.
5) Se possível, crie dois usuários e crie permissões de acordo com a descrição na questão 1.