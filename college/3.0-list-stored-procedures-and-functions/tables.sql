drop database if exists biblioteca;
create database biblioteca;
use biblioteca;


create table cliente(
	cpf  bigint not null,
    nome varchar(255),
    endereco varchar (255),
    cpf_resposavel bigint not null,
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