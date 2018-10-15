Lista de exercícios:
Dado o esquema relacional abaixo, implemente ele em MySQL (usando o Workbench), insira
algumas tuplas (registros) e faça as seguintes buscas:
Ambulatório (númeroA, andar, capacidade)
Médico (CRM, nome, idade, cidade, especialidade, #númeroA)
Paciente (RG, nome, idade, cidade, doença)
Consulta (#CRM, #RG, data, hora)
Funcionário (RG, nome, idade, cidade, salário)
1) buscar os dados dos pacientes que estão com sarampo
2) buscar os dados dos médicos ortopedistas com mais de 40 anos
3) buscar os dados das consultas, exceto aquelas marcadas para os médicos com CRM 46 e 79
4) buscar os dados dos ambulatórios do quarto andar que ou tenham capacidade igual a 50 ou
tenham número superior a 10
5) buscar o nome e a especialidade de todos os médicos
6) buscar o número dos ambulatórios do terceiro andar
7) buscar o CRM dos médicos e as datas das consultas para os pacientes com RG 122 e 725
8) buscar os números dos ambulatórios, exceto aqueles do segundo e quarto andares, que suportam
mais de 50 pacientes
9) buscar o nome dos médicos que têm consulta marcada e as datas das suas consultas
10) buscar o número e a capacidade dos ambulatórios do quinto andar e o nome dos médicos que
atendem neles
11) buscar o nome dos médicos e o nome dos seus pacientes com consulta marcada, assim como a
data destas consultas
12) buscar os nomes dos médicos ortopedistas com consultas marcadas para o período da manhã
(7hs-12hs) do dia 15/04/03
13) buscar os nomes dos pacientes, com consultas marcadas para os médicos João Carlos Santos ou
Maria Souza, que estão com pneumonia
14) buscar os nomes dos médicos e pacientes cadastrados no hospital
15) buscar os nomes e idade dos médicos, pacientes e funcionários que residem em Florianópolis
16) buscar os nomes e RGs dos funcionários que recebem salários abaixo de R$ 300,00 e que não
estão internados como pacientes
17) buscar os números dos ambulatórios onde nenhum médico dá atendimento
18) buscar os nomes e RGs dos funcionários que estão internados como pacientes
19) buscar os dados dos ambulatórios do quarto andar. Estes ambulatórios devem ter capacidade
igual a 50 ou o número do ambulatório deve ser superior a 10
20) buscar os números dos ambulatórios que os médicos psiquiatras atendem
21) buscar o nome e o salário dos funcionários de Florianopolis e Sao José que estão internados
como pacientes e têm consulta marcada com ortopedistas
22) buscar o nome dos funcionários que não são pacientes
23) Buscar o nome dos funcionários que são pacientes