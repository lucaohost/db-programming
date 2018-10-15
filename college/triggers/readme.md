Considere as tabelas abaixo:
CREATE TABLE EMPREGADO (
Operacao VARCHAR2(3) NOT NULL,
Usuario int NOT NULL PRIMARY KEY,
Data DATE NOT NULL,
CPF CHAR(12) NOT NULL,
Num_Departamento SMALLINT NOT NULL,
Nome VARCHAR(30) NULL,
Data_nascimento DATE NULL,
Endereco VARCHAR(40) NULL,
Sexo CHAR(1) NULL,
Salario DECIMAL(10,2) NULL,
Supervisor CHAR(12) NULL
);
CREATE TABLE PROJETO (
id_projeto int PRIMARY KEY
);
CREATE TABLE EMPREGADO_PROJETO (
id_usuario int,
id_projeto int,
Foreign key (id_usuario) references empregado(usuario),
Foreign key (id_projeto) references projeto(id_projeto)
);
1) Fa�a um trigger de auditoria que armazene as informa��es do empregado, bem como, o evento
(delete ou update) que disparou este trigger, o usu�rio respons�vel pela altera��o e a data do sistema.
2) Fa�a um trigger para manter a faixa salarial em valores m�nimo e m�ximo estabelecidos (inserts e
updates).
3) Fa�a um trigger para n�o permitir a diminui��o ou o aumento superior a 50% dos sal�rios dos
empregados, emitindo uma mensagem de erro (Dica: use o comando SIGNAL:
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'age less than 0'; )
4) Fa�a um trigger para que um empregado n�o possa ter mais do que 44 horas na soma dos projetos.
5) Fa�a um trigger de seguran�a, para restringir o hor�rio de manipula��o da tabela de empregados
entre as 08:00 e 18:00 horas dos dias �teis