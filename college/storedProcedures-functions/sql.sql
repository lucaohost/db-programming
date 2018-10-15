drop database if exists biblioteca;
create database biblioteca;
use biblioteca;
 create table cliente(
	cpf  bigint not null,
    nome varchar(255),
    endereco varchar (255),
    cpf_resposavel bigint,
    bloqueado boolean,
    primary key (cpf)
);
 create table livro (
	isbn bigint not null,
    titulo varchar(255),
    autor varchar(255),
    quantidade_atual int,
    quantiade_total int,
    primary key (isbn)
);
 create table reserva(
	cpf bigint not null,
    isbn bigint not null,
    data date,
    pendente boolean,
    constraint fk_clienteReserva foreign key (cpf) references cliente(cpf),
    constraint fk_livroReserva foreign key (isbn) references livro(isbn)
);
 create table aluga(
    cpf bigint not null,
    isbn bigint not null,
    data_retirada date not null,
    data_devolucao date,
    estado enum('retirado','atrasado','devolvido'),
    constraint fk_clienteAluga foreign key (cpf) references cliente(cpf),
    constraint fk_livroAluga foreign key (isbn) references livro(isbn),
    primary key(data_retirada),
    unique(cpf,isbn,data_retirada)
);
 create table irregularidade(
	cpf bigint not null,
    isbn bigint not null,
    data_retirada date not null,
    valor_multa decimal(5,2),
    constraint fk_clienteIrregularidade foreign key (cpf) references cliente(cpf),
    constraint fk_livroIrregularidade foreign key (isbn) references livro(isbn),
    constraint fk_alugaIrregularidade foreign key (data_retirada) references aluga(data_retirada)
);

drop function if exists biblioteca.multa;
DELIMITER $$ 
CREATE FUNCTION biblioteca.multa(dataRetirada date, dataDevolucao date) RETURNS int
    DETERMINISTIC
BEGIN
	declare diasEmAtraso int;
	declare multa int;
    	set diasEmAtraso = DATEDIFF(dataDevolucao,dataRetirada);
	set multa = (diasEmAtraso * 3) + 10;
    	return (multa);
END
DELIMITER ;

-- select biblioteca.multa('2018-08-10', '2018-08-20');

-- por não ter um parametro de data_retirada, assumi que o cliente só pode retirar uma vez o mesmo livro.
drop procedure if exists biblioteca.devolucao;
DELIMITER //
CREATE PROCEDURE devolucao(in cpfCliente varchar(255), in isbnLivro varchar(255))
   BEGIN
   declare dataRetiradaLivro date;
   declare dataDevolucaoLivro date;
   declare multaValor int;
   declare irregularidade int;
   select data_retirada into dataRetiradaLivro from aluga where cpf = cpfCliente and isbn = isbnLivro;
   select data_devolucao into dataDevolucaoLivro from aluga where cpf = cpfCliente and isbn = isbnLivro;
   if datediff(CURDATE(),dataRetiradaLivro) > 0 THEN
  	select valor_multa into irregularidade from aluga where cpf = cpfCliente and isbn = isbnLivro and data_retirada = dataRetiradaLivro;
    if irregularidade is null THEN
    	set multaValor = biblioteca.multa(dataRetiradaLivro,CURDATE());
    	insert into irregularidade values(cpfCliente, isbnLivro, dataRetiradaLivro, multaValor);
    end if;
   else
   	update biblioteca.aluga set estado = 'devolvido' where cpf = cpfCliente and isbn = isbnLivro;
   end if;
   END
DELIMITER ;

DELIMITER //
CREATE PROCEDURE consultaBiblioteca()
   BEGIN
  	select * from livros;
   END
DELIMITER ;

-- DROP USER 'funcionario'@'localhost';
CREATE USER 'funcionario'@'localhost' IDENTIFIED BY 'qwe123';
GRANT SELECT,INSERT,UPDATE
ON biblioteca.reserva
TO 'funcionario'@'localhost';

-- GRANT EXECUTE ON PROCEDURE biblioteca.consultaBiblioteca
-- TO 'funcionario'@'localhost';


-- DROP USER 'bibliotecario'@'localhost';
CREATE USER 'bibliotecario'@'localhost' IDENTIFIED BY 'qwe123';
GRANT insert
ON biblioteca.livro
TO 'bibliotecario'@'localhost';

DELIMITER //

CREATE PROCEDURE retirada(in cpfCliente varchar(255), in isbnLivro varchar(255))
   BEGIN
   declare irregularidade int;
   declare quantidadeAtual int;
   declare usuarioBloqueado boolean;
   select cpf into irregularidade from irregularidade where cpf = cpfCliente;
   select quantidade_atual into quantidadeAtual from livro where isbn = isbnLivro;
   select bloqueado into usuarioBloqueado from cliente where cpf = cpfCliente;
    if irregularidade is not null and (quantidadeAtual > 0) and bloqueado == false THEN
    	break;
    else
        insert into aluga values(cpfCliente, isbnLivro, CURDATE(), date_add(CURDATE(),INTERVAL 7 DAY),"retirado");
	update reserva set pendente = false where cpf = cpfCliente;
    end if;
   END
DELIMITER ;

insert into cliente values(312,"Jorge","Japão",null,false);
insert into cliente values(123,"Jorge Jr","Japão",312,false);

insert into livro values(123,"Rastafarianismo","Bob",5,10);
insert into livro values(312,"Budismo","Gandhi",0,0);


-- insert into irregularidade values(123,123,'2016-03-05',500);
-- insert into irregularidade values(123,123,'2016-03-06',600);
-- insert into irregularidade values(123,123,'2016-03-07',700);