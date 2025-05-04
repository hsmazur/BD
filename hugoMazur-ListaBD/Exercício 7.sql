DROP TABLE IF EXISTS Trab;
DROP TABLE IF EXISTS Func;
DROP TABLE IF EXISTS Dept;

CREATE TABLE Func (
   id_func INT NOT NULL,
   nome_func VARCHAR(50),
   idade INT,
   salario INT,
   PRIMARY KEY (id_func)
);
CREATE TABLE Dept (
	id_dept INT NOT NULL,
	nome_depto VARCHAR(50),
	orcamento INT,
	gerente VARCHAR(50),
	PRIMARY KEY (id_dept)
);
CREATE TABLE Trab (
	id_func INT NOT NULL,
	id_dept INT NOT NULL,
	tempo FLOAT,
	FOREIGN KEY (id_func) REFERENCES Func(id_func),
	FOREIGN KEY (id_dept) REFERENCES Dept(id_dept)
);

INSERT INTO Func(id_func, nome_func, idade, salario) VALUES 
(1, 'Zézinho da Silva', 34, 3000),
(2, 'Aninha da Silva', 29, 2800);
INSERT INTO Dept(id_dept, nome_depto, orcamento, gerente) VALUES 
(10, 'Departamento de TI', 50000, 'Carlinhos de Sousa'),
(20, 'Departamento de Produção', 100000, 'Maria das Dores');
INSERT INTO Trab(id_func, id_dept, tempo) VALUES 
(1, 20, 40),
(2, 10, 36);



