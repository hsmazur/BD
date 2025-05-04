DROP TABLE IF EXISTS dependente;
DROP TABLE IF EXISTS trabalha_em;
DROP TABLE IF EXISTS projeto;
DROP TABLE IF EXISTS localizacao_dep;
DROP TABLE IF EXISTS funcionario;
DROP TABLE IF EXISTS departamento;



CREATE TABLE DEPARTAMENTO (
    Dnome varchar(20),
    Dnumero int,
    Cpf_gerente varchar(20),
    Data_inicio_gerente Date,
    primary key (Dnumero)
);

CREATE TABLE FUNCIONARIO (
    Pnome varchar(20),
    Minicial varchar(20),
    Unome varchar(20),
    Cpf varchar(20),
    Datanasc Date,
    Endereco varchar(50),
    Sexo varchar(1),
    Salario int,
    Cpf_supervisor varchar(20),
    Dnr int,
  
    foreign key (Dnr) REFERENCES DEPARTAMENTO(Dnumero),
    primary key (Cpf)
);

CREATE TABLE LOCALIZACAO_DEP (
    Dlocal varchar(50),
    Dnumero int,
    foreign key (Dnumero) REFERENCES DEPARTAMENTO(Dnumero),
    primary key (Dnumero, Dlocal)
);

CREATE TABLE PROJETO (
   Projnome varchar(20),
   Projnumero int,
   Projlocal varchar(50),
   Dnum int,
   primary key (Projnumero),
   foreign key (Dnum) REFERENCES DEPARTAMENTO(Dnumero)
);

CREATE TABLE TRABALHA_EM (
   Fcpf varchar(20),
   Pnr int,
   Horas int,
   primary key (Fcpf, Pnr),
   foreign key (Pnr) REFERENCES PROJETO(Projnumero)
);

CREATE TABLE DEPENDENTE (
   Fcpf varchar(20),
   Nome_dependente varchar(20),
   Sexo varchar(1),
   Datanasc Date,
   Parentesco varchar(10),
   foreign key (Fcpf) REFERENCES FUNCIONARIO(Cpf),
   primary key (Fcpf, Nome_dependente)
);

INSERT INTO DEPARTAMENTO VALUES
  ('Pesquisa', 5, '33344555587', '1988-05-22'),
  ('Administração', 4, '98765432168', '1995-01-01'),
  ('Matriz', 1, '88866555576', '1981-06-19');

INSERT INTO FUNCIONARIO VALUES
  ('Joao', 'B', 'Silva', '12345678966', '1965-01-09', 'Rua das Flores, 751, São Paulo, SP', 'M', 30000, '33344555587', 5),
  ('Fernando', 'T', 'Wong', '33344555587', '1955-12-09', 'Rua da Lapa, 34, São Paulo, SP', 'M', 40000, '88866555576', 5),
  ('Alice', 'J', 'Zelaya', '99988777767', '1968-01-19', 'Rua Souza Lima, 35, Curitiba, PR', 'F', 25000, '98765432168', 4),
  ('Jennifer', 'S', 'Souza', '98765432168', '1941-06-20', 'Av. Arthur de Lima, 54, Santo André, SP F', 'F', 43000, '88866555576', 4),
  ('Ronaldo', 'K', 'Lime', '66688444476', '1962-09-15', 'Rua Rebouças, 65, Piracicaba, SP', 'M', 38000, '33344555587', 5),
  ('Joice', 'A', 'Leite', '45345345376', '1972-07-31', 'Av. Lucas Obes, 74, São Paulo, SP', 'F', 25000, '33344555587', 5),
  ('André', 'V', 'Pereira', '98798798733', '1969-03-29', 'Rua Timbira, 35, São Paulo, SP', 'M', 25000, '98765432168', 4),
  ('Daniel', 'V', 'Bastos', '1111111133', '1999-10-17', 'Rua Euzébio de Queiros, 418', 'M', 25000, '98765432168', 4),
  ('Jorge', 'E', 'Brito', '88866555576', '1937-11-10', 'Rua do Horto, 35, São Paulo, SP', 'M', 55000, NULL, 1);
  
INSERT INTO LOCALIZACAO_DEP VALUES
   ('São Paulo', 1),
   ('Mauá', 4),
   ('Santo André', 5),
   ('Itu', 5),
   ('São Paulo', 5);
   
INSERT INTO PROJETO VALUES
  ('ProdutoX', 1, 'Santo André', 5),
  ('ProdutoY', 2, 'Itu', 5),
  ('ProdutoZ', 3, 'São Paulo', 5),
  ('Informatização', 10, 'Mauá', 4),
  ('Reorganização', 20, 'São Paulo', 1),
  ('Novosbenefícios', 30, 'Mauá', 4);
  
INSERT INTO TRABALHA_EM VALUES
  ('12345678966', 1, 32.5),
  ('12345678966', 2, 7.5),
  ('12345678966', 3, 32.5),
  ('12345678966', 10, 32.5),
  ('12345678966', 20, 32.5),
  ('12345678966', 30, 32.5),
  ('66688444476', 3, 40),
  ('45345345376', 1, 20),
  ('45345345376', 2, 20),
  ('33344555587', 2, 10),
  ('33344555587', 3, 10),
  ('33344555587', 10, 10),
  ('33344555587', 20, 10),
  ('99988777767', 30, 30),
  ('99988777767', 10, 10),
  ('98798798733', 10, 35),
  ('98798798733', 30, 5),
  ('98765432168', 30, 20),
  ('98765432168', 20, 15),
  ('88866555576', 20, NULL);
  
INSERT INTO DEPENDENTE VALUES
  ('33344555587', 'Alicia', 'F', '1986-04-05', 'Filha'),
  ('33344555587', 'Tiago', 'M', '1983-10-25', 'Filho'),
  ('33344555587', 'Janaína', 'F', '1958-05-03', 'Esposa'),
  ('98765432168', 'Antonio', 'M', '1942-02-28', 'Marido'),
  ('12345678966', 'Michael', 'M', '1988-01-04', 'Filho'),
  ('12345678966', 'Alicia', 'F', '1988-12-30', 'Filha'),
  ('12345678966', 'Elizabeth', 'F', '1967-05-05', 'Esposa');

-- 8. Retorne o nome e endereço de todos os funcionários que trabalham para o departamento nº 4.
SELECT Pnome, Unome, Endereco
FROM FUNCIONARIO;

-- 9. Retorne, por ordem crescente de idade, o nome e endereço, e data de nascimento de todos
--os funcionários que nasceram a partir da década de 70. Lembre que o Banco de dados
--está no formato ’ano-mes-dia’.
SELECT Pnome, Unome, Endereco, Datanasc
FROM FUNCIONARIO
WHERE Datanasc >= '1970-01-01'
ORDER BY Datanasc DESC;

--10. Retorne os cpfs (distintos) dos funcionários que trabalham 20 horas ou mais em algum
--projeto ou que trabalham no projeto nº 10.
SELECT Fcpf
FROM TRABALHA_EM
WHERE Horas >= 20 OR Pnr = 10;

--11. Retorne todos os atributos dos funcionários com endereço em São Paulo e salário maior
--ou igual a 30 mil. Ordene por nome.
SELECT *
FROM FUNCIONARIO
WHERE Endereco LIKE '%São Paulo, SP' AND Salario >= 30000
ORDER BY Pnome ASC;

--12. Mostre o nome e salário com 10% de aumento para todos os funcionários.
SELECT Pnome, Unome, Salario * 1.10
FROM FUNCIONARIO;

--13. Mostre o nome e endereço de todos os funcionários que trabalham para o departamento
--de Administração.
SELECT F.Pnome, F.Unome, F.Endereco
FROM FUNCIONARIO F
JOIN DEPARTAMENTO D ON F.Dnr = D.Dnumero
WHERE D.Dnome = 'Administração';

--14. Para cada projeto localizado em São Paulo, liste o nome do projeto nome do departamento
--que controla o projeto; e o sobrenome, endereço e data de nascimento do gerente do
--departamento.
SELECT P.Projnome, D.Dnome, F.Unome, F.Endereco, F.Datanasc
FROM PROJETO P
JOIN DEPARTAMENTO D ON P.Dnum = D.Dnumero
JOIN FUNCIONARIO F ON D.Cpf_gerente = F.Cpf
WHERE P.Projlocal = 'São Paulo';

--15. Para cada funcionário, mostre o primeiro e o último nome do funcionário e o primeiro e
--o último nome de seu supervisor imediato. Ordene pelo sobrenome dos supervisores.
SELECT 
F.Pnome AS Pnome_funcionario, 
F.Unome AS Unome_funcionario, 
S.Pnome AS Pnome_supervisor, 
S.Unome AS Unome_supervisor
FROM FUNCIONARIO F
JOIN FUNCIONARIO S ON F.Cpf_supervisor = S.Cpf 
ORDER BY S.Unome;

--16. Faça uma lista de todos os números de projeto para aqueles que envolvam um funcionário
--cujo sobrenome é Wong, seja como um trabalhador ou como um gerente do departamento
--que controla o projeto. Orderne pelo nº do projeto. Dica: use o operador de união.
SELECT TE.Pnr AS Projeto_numero
FROM FUNCIONARIO F
JOIN TRABALHA_EM TE ON F.Cpf = TE.Fcpf
WHERE F.Unome = 'Wong'

UNION

SELECT P.Projnumero
FROM FUNCIONARIO F
JOIN DEPARTAMENTO D ON F.Cpf = D.Cpf_gerente
JOIN PROJETO P ON D.Dnumero = P.Dnum
WHERE F.Unome = 'Wong'

ORDER BY Projeto_numero;

--17. Mostrar os salários resultantes se cada funcionário que trabalha no projeto ’Informatização’
--receber um aumento de 30 por cento.
SELECT F.Salario * 1.30
FROM FUNCIONARIO F
JOIN TRABALHA_EM TE ON F.Cpf = TE.Fcpf
JOIN PROJETO P ON TE.Pnr = P.Projnumero
WHERE P.Projnome = 'Informatização';

--18. Mostre o nome, cpf e data de ínicio dos gerentes que começaram a geranciar algum
--departamento entre 1980 e 1990. Use o operador Between.
SELECT F.Pnome, F.Unome, F.Cpf, D.Data_inicio_gerente
FROM DEPARTAMENTO D
JOIN FUNCIONARIO F ON D.Cpf_gerente = F.Cpf
WHERE D.Data_inicio_gerente BETWEEN '1980-01-01' AND '1990-12-31';

--19. Recupere os nomes de todos os funcionários no departamento 5 que trabalham mais de
--10 horas por semana no projeto ProdutoX.
SELECT F.Pnome, F.Unome
FROM FUNCIONARIO F
JOIN TRABALHA_EM TE ON F.Cpf = TE.Fcpf
JOIN PROJETO P ON TE.Pnr = P.Projnumero
WHERE F.Dnr = 5 AND TE.Horas >10 AND P.Projnome = 'ProdutoX';

--20. Ache os nomes de todos os funcionários que são supervisionados diretamente por Fernando Wong.
SELECT F.Pnome, F.Unome
FROM FUNCIONARIO F
JOIN FUNCIONARIO S ON F.Cpf_supervisor = S.Cpf
WHERE S.Pnome = 'Fernando' AND S.Unome = 'Wong';