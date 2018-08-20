#1) buscar os dados dos pacientes que estão com sarampo
select * from paciente where doenca like 'Sarampo';

#2) buscar os dados dos médicos ortopedistas com mais de 40 anos
select * from medico where idade > 40 and Especialidade like 'Ortopedia';

#3) buscar os dados das consultas, exceto aquelas marcadas para os médicos com CRM 46 e 79
select * from consulta where crm not in (46,79);

#4) buscar os dados dos ambulatórios do quarto andar que ou tenham capacidade igual a 50 ou
tenham número superior a 10
-- interpretei como XOR
select * from ambulatorio where Andar = 4 and ((Capacidade = 50 and NumeroA < 10) or (Capacidade <> 50 and NumeroA > 10));

#5) buscar o nome e a especialidade de todos os médicos
select DISTINCT (Especialidade) from medico;

#6) buscar o número dos ambulatórios do terceiro andar
select NumeroA from ambulatorio where andar = 3;

#7) buscar o CRM dos médicos e as datas das consultas para os pacientes com RG 122 e 725
select CRM, data from consulta where RG in (122,725);

#8) buscar os números dos ambulatórios, exceto aqueles do segundo e quarto andares, que suportam
mais de 50 pacientes
select * from ambulatorio where andar <> 2 and capacidade > 50;

#9) buscar o nome dos médicos que têm consulta marcada e as datas das suas consultas
select m.nome, c.data from medico m inner join consulta c on m.crm = c.crm;

#10) buscar o número e a capacidade dos ambulatórios do quinto andar e o nome dos médicos que
atendem neles
select a.capacidade, m.nome,a.numeroA from ambulatorio a inner join medico m on a.numeroA = m.numeroA and a.andar = 5;

#11) buscar o nome dos médicos e o nome dos seus pacientes com consulta marcada, assim como a
data destas consultas
select m.nome as NomeMedico, p.nome as NomePaciente, c.data from medico m inner join consulta c on m.crm = c.crm inner join paciente p on c.rg = p.rg;

#12) buscar os nomes dos médicos ortopedistas com consultas marcadas para o período da manhã
(7hs-12hs) do dia 15/04/03.
select m.nome from consulta c inner join medico m on c.crm = m.crm where data = '2003-04-15' and hora BETWEEN '07:00:00' and '12:00:00';

#13) buscar os nomes dos pacientes, com consultas marcadas para os médicos João Carlos Santos ou
Maria Souza, que estão com pneumonia
select p.nome from paciente p inner join consulta c on p.rg = c.rg inner join medico m on c.crm = m.crm where m.crm in (116,117) or p.doenca like "Pneumonia";

#14) buscar os nomes dos médicos e pacientes cadastrados no hospital
select nome from medico m union select nome from paciente p;

#15) buscar os nomes e idade dos médicos, pacientes e funcionários que residem em Florianópolis
select * from (select nome,idade,cidade from medico m union select nome,idade,cidade from funcionario f union select nome,idade,cidade from paciente p) t where t.Cidade like "Florianópolis";

#16) buscar os nomes e RGs dos funcionários que recebem salários abaixo de R$ 300,00 e que não
estão internados como pacientes
select f.nome,f.rg from funcionario f left join paciente p on f.rg = p.rg where f.salario < 300.00 and p.rg is null;

#17) buscar os números dos ambulatórios onde nenhum médico dá atendimento
select a.numeroA from ambulatorio a left join medico m on a.numeroA = m.numeroA where m.numeroA is null;

#18) buscar os nomes e RGs dos funcionários que estão internados como pacientes
select f.nome, f.rg from funcionario f inner join paciente p on f.rg = p.rg;

#19) buscar os dados dos ambulatórios do quarto andar. Estes ambulatórios devem ter capacidade
igual a 50 ou o número do ambulatório deve ser superior a 10
select * from ambulatorio where andar = 4 and (capacidade = 50 or numeroA > 10);

#20) buscar os números dos ambulatórios que os médicos psiquiatras atendem
select numeroA from medico where especialidade like "Psiquiatra";


#21) buscar o nome e o salário dos funcionários de Florianopolis e Sao José que estão internados
como pacientes e têm consulta marcada com ortopedistas
select f.nome,f.salario from funcionario f inner join paciente p on f.rg = p.rg inner join consulta c on f.rg = c.rg inner join medico m on c.crm = m.crm where m.especialidade like "Ortopedia" and f.cidade in ("Florianópolis","São José");


#22) buscar o nome dos funcionários que não são pacientes
select f.nome from funcionario f left join paciente p on f.rg = p.rg where p.rg is null;
#23) Buscar o nome dos funcionários que são pacientes