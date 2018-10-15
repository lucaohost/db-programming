Lista de exerc�cios:
Dado o esquema relacional abaixo, implemente ele em MySQL (usando o Workbench), insira
algumas tuplas (registros) e fa�a as seguintes buscas:
Ambulat�rio (n�meroA, andar, capacidade)
M�dico (CRM, nome, idade, cidade, especialidade, #n�meroA)
Paciente (RG, nome, idade, cidade, doen�a)
Consulta (#CRM, #RG, data, hora)
Funcion�rio (RG, nome, idade, cidade, sal�rio)
1) buscar os dados dos pacientes que est�o com sarampo
2) buscar os dados dos m�dicos ortopedistas com mais de 40 anos
3) buscar os dados das consultas, exceto aquelas marcadas para os m�dicos com CRM 46 e 79
4) buscar os dados dos ambulat�rios do quarto andar que ou tenham capacidade igual a 50 ou
tenham n�mero superior a 10
5) buscar o nome e a especialidade de todos os m�dicos
6) buscar o n�mero dos ambulat�rios do terceiro andar
7) buscar o CRM dos m�dicos e as datas das consultas para os pacientes com RG 122 e 725
8) buscar os n�meros dos ambulat�rios, exceto aqueles do segundo e quarto andares, que suportam
mais de 50 pacientes
9) buscar o nome dos m�dicos que t�m consulta marcada e as datas das suas consultas
10) buscar o n�mero e a capacidade dos ambulat�rios do quinto andar e o nome dos m�dicos que
atendem neles
11) buscar o nome dos m�dicos e o nome dos seus pacientes com consulta marcada, assim como a
data destas consultas
12) buscar os nomes dos m�dicos ortopedistas com consultas marcadas para o per�odo da manh�
(7hs-12hs) do dia 15/04/03
13) buscar os nomes dos pacientes, com consultas marcadas para os m�dicos Jo�o Carlos Santos ou
Maria Souza, que est�o com pneumonia
14) buscar os nomes dos m�dicos e pacientes cadastrados no hospital
15) buscar os nomes e idade dos m�dicos, pacientes e funcion�rios que residem em Florian�polis
16) buscar os nomes e RGs dos funcion�rios que recebem sal�rios abaixo de R$ 300,00 e que n�o
est�o internados como pacientes
17) buscar os n�meros dos ambulat�rios onde nenhum m�dico d� atendimento
18) buscar os nomes e RGs dos funcion�rios que est�o internados como pacientes
19) buscar os dados dos ambulat�rios do quarto andar. Estes ambulat�rios devem ter capacidade
igual a 50 ou o n�mero do ambulat�rio deve ser superior a 10
20) buscar os n�meros dos ambulat�rios que os m�dicos psiquiatras atendem
21) buscar o nome e o sal�rio dos funcion�rios de Florianopolis e Sao Jos� que est�o internados
como pacientes e t�m consulta marcada com ortopedistas
22) buscar o nome dos funcion�rios que n�o s�o pacientes
23) Buscar o nome dos funcion�rios que s�o pacientes