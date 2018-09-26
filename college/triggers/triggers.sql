drop database if exists empregos; 
create database empregos;
use empregos; 

create table empregado (
    operacao varchar(3) not null,
    usuario int not null primary key,
    data date not null,
    cpf char(12) not null,
    nome varchar(30) null,
    data_nascimento date null,
    endereco varchar(40) null,
    sexo char(1) null,
    salario decimal(10,2) null,
    supervisor char(12) null,
    horasemprojetos int
);

create table projeto (
    id_projeto int primary key, 
    nome varchar(64) not null
);

create table empregado_projeto (
    id_usuario int, 
    id_projeto int,
    foreign key(id_usuario) references empregado(usuario),
    foreign key(id_projeto) references projeto(id_projeto)
);

insert into empregado values ("insert", 1, current_date(), "411.892.880-95", "maria souza", "1976-10-20", "av. oscar freire são paulo - sp", "feminino", 2900.00, "joão", "20");
insert into empregado values ("insert", 2, current_date(), "339.169.230-80", "josé da silva", "1969-05-18", "av. paulista são paulo - sp", "masculino", 2450.00, "joão", "40");  
insert into empregado values ("insert", 3, current_date(), "428.734.220-84", "mariana de andrade", "1985-12-06", "av. tiradentes são paulo - sp", "feminino", 4500.00, "joão", "12");   

insert into projeto values (1, "projeto graphite");
insert into projeto values (2, "projeto macassar");
insert into projeto values (3, "projeto mediware4");

insert into empregado_projeto values (1, 3);
insert into empregado_projeto values (2, 1);
insert into empregado_projeto values (2, 2);
insert into empregado_projeto values (1, 1);


delimiter $
create trigger auditorioupdate after update on empregado
for each row
    begin
        insert into auditoria("update",  current_timestamp(), current_user(), old.id);
    end; $
delimiter ;

delimiter $
create trigger auditoriodelete after delete on empregado
    for each row 
    begin
        insert into auditoria("delete",  current_timestamp(), current_user(), old.id);
    end $
delimiter ;

update empregado set data_nascimento = "1976-11-20" where usuario = 1;
delete from empregado where usuario = 3;

updates).

delimiter $
create trigger faixa_salarial 
    before update on empregado
        for each row 
            begin
                if new.salario < 1400,00  then
                    set new.salario = 1400,00;
                else if new.salario > 7500,00 then
                    set new.salario = 7500,00;
                end if;
            end; $
delimiter ;

delimiter $
create trigger faixa_salarial 
    before insert on empregado
        for each row 
            begin
                if new.salario < 1400,00  then
                    set new.salario = 1400,00;
                else if new.salario > 7500,00 then
                    set new.salario = 7500,00;
                end if;
            end; $
delimiter ;

insert into empregado values ("insert", 4, current_date(), "131.429.990-51", "rafael bastos", "1978-01-16", "av. 23 de maio são paulo - sp", "masculino", 8000,00, "joão", "05"); 
update empregado set salario = 800,00 where usuario = 2;
empregados, emitindo uma mensagem de erro (dica: use o comando signal:
signal sqlstate '45000' set message_text = 'age less than 0'; )

delimiter $
create trigger alteracaosalario before update on empregado
for each row 
begin
    if new.salario < old.salario - 50 %
        set new.salario = old.salario;
    else if new.salario > old.salario + 50%
        set new.salario = old.salario; 
    end if;

signal sqlstate '45000' set message_text = 'não foi possível alterar o salário';
end $
delimiter $

update empregado set salario = 2900,00 where usuario = 2;

4) faça um trigger para que um empregado não possa ter mais do que 44 horas na soma dos projetos.

delimiter $
create trigger tempoemprojetos before update on empregado
for each row 
begin
    if new.horasemprojetos > 44
        set new.horasemprojetos = old.horasemprojetos;
    end if;
    
signal sqlstate '45000' set message_text = 'não foi possível alterar o tempo em projetos';
end $
delimiter $

update empregado set horasemprojetos = 50 where usuario = 1;

delimiter $
create trigger horariomanip before update on empregado
for each row begin 
    if (current_timestamp() < 8:00 or current_timestamp() > 18:00) then
        set message_text = 'horário permitido para alteração é das 8:00 as 18:00'
    else if (dayofweek(curdate()) == 1 or dayofweek(curdate()) == 7) then
        set message_text = 'permitido apenas durante dias úteis'
    end if;
end $
delimiter ;

update empregado set salario = 2500,00 where usuario = 4;