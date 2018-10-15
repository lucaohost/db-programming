drop database if EXISTS hospital;
create database hospital;
use hospital;

CREATE TABLE Ambulatorio(
    NumeroA INT NOT NULL AUTO_INCREMENT,
    Andar INT,
    Capacidade INT,
    PRIMARY KEY(NumeroA)
); CREATE TABLE Medico(
    CRM BIGINT NOT NULL,
    Nome VARCHAR(255),
    Idade INT,
    Cidade VARCHAR(255),
    Especialidade VARCHAR(255),
    NumeroA INT,
    PRIMARY KEY(CRM),
    CONSTRAINT FK_AmbulatorioMedico FOREIGN KEY(NumeroA) REFERENCES Ambulatorio(NumeroA)
); CREATE TABLE Paciente(
    RG BIGINT NOT NULL,
    Nome VARCHAR(255),
    Idade INT,
    Cidade VARCHAR(255),
    Doenca VARCHAR(255),
    PRIMARY KEY(RG)
); CREATE TABLE Consulta(
    CRM BIGINT NOT NULL,
    RG BIGINT NOT NULL,
    DATA DATE,
    Hora TIME,
    CONSTRAINT FK_MedicoConsulta FOREIGN KEY(CRM) REFERENCES Medico(CRM),
    CONSTRAINT FK_PacienteConsulta FOREIGN KEY(RG) REFERENCES Paciente(RG)
); CREATE TABLE funcionario(
    RG BIGINT NOT NULL,	
    nome VARCHAR(255),
    idade INT,
    cidade VARCHAR(255),
    salario DOUBLE(6, 2),
    PRIMARY KEY(RG)
);