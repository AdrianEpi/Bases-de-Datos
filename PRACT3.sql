1.- Conéctate a tu cuenta de ORACLE a través del sqlplus.

	Para conectarnos usamos la siguiente sentencia de comandos:
		ssh -p 2203 alu0101158280@exthost2.etsii.ull.es
		"password(alu)"
		sqlplus2 alu0101158280
		"password(alu)"


2.- Crear un fichero de SPOOL denominado PRACT3.
	
	SPOOL PRACT3


3.- Crear la tabla DEPARTAMENTO como se indica a continuación:

	CREATE TABLE DEPARTAMENTO
	(CD NUMBER(2) PRIMARY KEY,
	D VARCHAR2(60));


4.- Crear la tabla AREA como se indica a continuación:
	CREATE TABLE AREA
	(CAR NUMBER(3) PRIMARY KEY,
	AR VARCHAR2(60),
	CD NUMBER(2) REFERENCES DEPARTAMENTO ON DELETE CASCADE);


5.- Crear la tabla PROFESOR como se indica a continuación:

	CREATE TABLE PROFESOR
	(DNI NUMBER(8) PRIMARY KEY,
	P VARCHAR2(60),
	CAR NUMBER(3),
	CAT VARCHAR2(5),
	FOREIGN KEY (CAR) REFERENCES AREA ON DELETE SET NULL);



6.- Crear la tabla ASIGNATURA como se indica a continuación:

	CREATE TABLE ASIGNATURA
	(CAS NUMBER(3) PRIMARY KEY,
	A VARCHAR2(50) NOT NULL,
	T CHAR(4) NOT NULL,
	CUR NUMBER(1) CHECK (CUR BETWEEN 1 AND 5),
	CAR NUMBER(3) REFERENCES AREA ON DELETE SET NULL,
	CT NUMBER(3,1) DEFAULT 0.0,
	CP NUMBER(3,1) DEFAULT 0.0,
	CL NUMBER(3,1) DEFAULT 0.0);


7.- Crear la tabla PLAN_DOCENTE como se indica a continuación:
	
	CREATE TABLE PLAN_DOCENTE
	(DNI NUMBER(8),
	CAS NUMBER(3),
	CTA NUMBER(3,1)DEFAULT 0.0,
	CPA NUMBER(3,1)DEFAULT 0.0,
	CLA NUMBER(3,1)DEFAULT 0.0,
	FI DATE DEFAULT SYSDATE,
	FF DATE,
	PRIMARY KEY (DNI, CAS, FI),
	FOREIGN KEY (CAS) REFERENCES ASIGNATURA ON DELETE CASCADE,
	FOREIGN KEY (DNI) REFERENCES PROFESOR ON DELETE CASCADE,
	CHECK (FF >= FI));


8.- Razonar el motivo de las definiciones hechas. Poner especial atención en las claves
primarias, las claves ajenas, las acciones compensatorias de integridad, las restricciones de
dominios (valores no nulos, condiciones check, …)
	
	- Tabla departamento:
		+ Clave primaria -> CD
		+ Atributos -> CD (Codigo Departamento, 2 numeros)
					-> D (Departamento, 60 caracteres)

	- Tabla Area:
		+ Clave primaria -> CAR (Codigo Area de conocimiento, 3 numeros)
		+ Referencia -> CD (Referencia a tabla de departamento)
		+ Atributos -> AR (Area, 60 caracteres)
					-> CD (Codigo Departamento, 2 números)

	- Tabla Profesor:
		+ Clave primaria -> DNI (Documento Nacional de Identidad, 8 numeros)
		+ Clave ajena -> CAR (Codigo Area de conocimiento, referencia a tabla de area, en caso de dejar de pertenecer a dicha tabla ponerlo a null)
		+ Atributos -> P (Profesor, 60 caracteres)
					-> CAR (Codigo Area de conocimiento, 3 digitos)
					-> CAT (Categoria, 8 caracteres)

	- Tabla Asignatura:
		+ Clave primaria -> CAS
		+ Referencia -> CAR (Referencia a tabla de area)
		+ Atributos -> CAS (Codigo asignatura, 3 numeros)
					-> A (Asignatura, 50 caracteres, no puede tomar valor nulo)
					-> CUR (Curso, 1 digito, debe tomar un valor entre 1 y 5)
					-> CAR (Codigo Area de conocimiento, 3 digitos)
					-> CT (Creditos Teoricos, "3 digitos, 1 digito", por defecto 0.0)
					-> CP (Créditos Prácticos, "3 digitos, 1 digito", por defecto 0.0)
					-> CL (Créditos de Laboratorio, "3 digitos, 1 digito", por defecto 0.0)

	- Tabla Plan_Docente:
		+ Clave primaria -> (DNI, CAS, FI)						 	
		+ Claves ajenas -> CAS (Codigo Asignatura, referencia a tabla de asignatura)
						-> DNI (Documento Nacional de Identidad, referencia a tabla de profesor)
		+ Atributos -> DNI (Documento Nacional de Identidad, 8 numeros)
					-> CAS (Codgio asignatura, 3 numeros)
					-> CTA (Creditos Teoricos Asignados, "3 digitos, 1 digito", por defecto 0.0)
					-> CPA (Créditos Prácticos Asignados, "3 digitos, 1 digito", por defecto 0.0)
					-> CLA (Créditos de Laboratorio Asignados, "3 digitos, 1 digito", por defecto 0.0)
					-> FI (Fecha Inicio, por defecto la fecha del día)	
					-> FF (Fecha finalizacion, fecha)

		+ Check -> Fecha de finalizacion debe ser mayor o igual que la fecha de inicio


9.- Insertar en las tablas creadas la información suministrada en la guía de prácticas. Observa los
ejemplos dados a continuación:

	He tenido problemas a la hora de insertar, he entrado como administrador con password admin y me he dado los 100Mb de quota de memoria, pero al insertar no detecta las tildes y no me deja remplazarlo ni hacer un update por lo que las dos primeras lineas de la tabla de de departamento le falta una letra, a partir de ahí los pase todos sin tildes para evitar el error.

	Para la tabla DEPARTAMENTO:
	INSERT INTO DEPARTAMENTO
	VALUES(1,'ANALISIS MATEMÁTICO');
	INSERT INTO DEPARTAMENTO
	VALUES(2, 'ASTROFÍSICA');
	INSERT INTO DEPARTAMENTO
	VALUES(3, 'ESTADÍSTICA, INVESTIGACIÓN OPERATIVA Y COMPUTACIÓN');
	INSERT INTO DEPARTAMENTO
	VALUES(4, 'MATEMÁTICA FUNDAMENTAL');


	Para la tabla AREA:
	INSERT INTO AREA
	VALUES(1, 'ÁLGEBRA', 4);
	INSERT INTO AREA
	VALUES(2, 'ANÁLISIS MATEMÁTICO', 1);
	INSERT INTO AREA
	VALUES(3, 'ASTRONOMÍA Y ASTROFÍSICA ', 2);
	INSERT INTO AREA
	VALUES(4, 'CIENCIAS DE LA COMPUTACIÓN E INTELIGENCIA ARTIFICIAL', 3);
	INSERT INTO AREA
	VALUES(5, 'DIDÁCTICA DE LA MATEMÁTICA ', 1);
	INSERT INTO AREA
	VALUES(6, 'ESTADÍSTICA E INVESTIGACIÓN OPERATIVA', 3);
	INSERT INTO AREA
	VALUES(7, 'LENGUAJES Y SISTEMAS INFORMÁTICOS', 3);
	INSERT INTO AREA
	VALUES(8, 'MATEMÁTICA APLICADA', 1);


	Para la tabla PROFESOR:
	INSERT INTO PROFESOR
	VALUES(1111,'JUAN', 6,'CU');
	INSERT INTO PROFESOR
	VALUES(2222,'CARLOS', 7,'TU');
	INSERT INTO PROFESOR
	VALUES(3333,'PEDRO', 4,'TEU');
	INSERT INTO PROFESOR
	VALUES(4444,'MARIA', 7,'TU');
	INSERT INTO PROFESOR
	VALUES(5555,'IVAN', 1,'CEU');
	INSERT INTO PROFESOR
	VALUES(6666,'CARMEN', 3,'CD');
	INSERT INTO PROFESOR
	VALUES(7777,'MARIO', 2,'TU');
	INSERT INTO PROFESOR
	VALUES(8888,'FRANCISCO', 5,'TU');
	INSERT INTO PROFESOR
	VALUES(9999,'ANGELA', 8,'TEU');
	INSERT INTO PROFESOR
	VALUES(1010,'DAVID', 4,'TU');
	INSERT INTO PROFESOR
	VALUES(2020,'SOLEDAD', 7,'CU');
	INSERT INTO PROFESOR
	VALUES(3030,'JOSE MANUEL', 6,'TEU');


	Para la tabla ASIGNATURA:
	INSERT INTO ASIGNATURA
	VALUES(1,'BASES DE DATOS','GII',3,7,3,1.5,1.5);
	INSERT INTO ASIGNATURA
	VALUES(2,'INTELIGENCIA ARTIFICIAL','GII',3,4,1.5,1.5,3);
	INSERT INTO ASIGNATURA
	VALUES(3,'ALMACENES DE DATOS','MII',1,7,1.5,0,1.5);
	INSERT INTO ASIGNATURA
	VALUES(4,'MINERIA DE DATOS','MII',1,7,1.5,0,1.5);
	INSERT INTO ASIGNATURA
	VALUES(5,'INFORMATICA BASICA','GII',1,7,3,1.5,1.5);
	INSERT INTO ASIGNATURA
	VALUES(6,'ALGEBRA','GII',1,1,3,3,0);
	INSERT INTO ASIGNATURA
	VALUES(7,'CALCULO','GII',1,8,3,3,0);
	INSERT INTO ASIGNATURA
	VALUES(8,'OPTIMIZACION','GII',1,6,3,1.5,1.5);
	INSERT INTO ASIGNATURA
	VALUES(9,'GESTION DE RIESGOS','GII',3,4,3,0,3);
	INSERT INTO ASIGNATURA
	VALUES(10,'ASTRONOMIA ','GF',2,3,3,1.5,1.5);
	INSERT INTO ASIGNATURA
	VALUES(11,'ENSEÑANZA DE LA MATEMATICA','GM',2,5,6,0,0);
	INSERT INTO ASIGNATURA
	VALUES(12,'ANALISIS COMPLEJO','GM',4,2,4.5,3,0);


	Para la tabla PLAN_DOCENTE:
	INSERT INTO PLAN_DOCENTE
	VALUES(4444,1,3,1.5,1.5,'01-SEP-11',NULL);
	INSERT INTO PLAN_DOCENTE
	VALUES(4444,4,1.5,0,1.5,'01-SEP-08','31-AUG-10');
	INSERT INTO PLAN_DOCENTE
	VALUES(4444,5,3,0,0,'01-SEP-10',NULL);
	INSERT INTO PLAN_DOCENTE
	VALUES(1111,8,3,1.5,1.5,'01-SEP-07','31-AUG-09');
	INSERT INTO PLAN_DOCENTE
	VALUES(1111,8,3,0,0,'01-SEP-09',NULL);
	INSERT INTO PLAN_DOCENTE
	VALUES(3030,8,0,1.5,1.5,'01-SEP-09',NULL);
	INSERT INTO PLAN_DOCENTE
	VALUES(2222,4,1.5,0,1.5,'01-SEP-09',NULL);
	INSERT INTO PLAN_DOCENTE
	VALUES(2222,3,1.5,0,1.5,'01-SEP-06','31-AUG-07');
	INSERT INTO PLAN_DOCENTE
	VALUES(1010,2,1.5,1.5,3,'01-SEP-05','31-AUG-08');
	INSERT INTO PLAN_DOCENTE
	VALUES(3333,2,1.5,1.5,3,'01-SEP-08',NULL);
	INSERT INTO PLAN_DOCENTE
	VALUES(1010,9,3,0,3,'01-SEP-08','31-AUG-09');
	INSERT INTO PLAN_DOCENTE
	VALUES(1010,9,1.5,0,1.5,'01-SEP-09',NULL);
	INSERT INTO PLAN_DOCENTE
	VALUES(9999,7,3,3,0,'01-SEP-10',NULL);
	INSERT INTO PLAN_DOCENTE
	VALUES(5555,6,3,3,0,'31-MAR-10',NULL);
	INSERT INTO PLAN_DOCENTE
	VALUES(6666,10,3,1.5,1.5,'01-SEP-08','31-AUG-11');
	INSERT INTO PLAN_DOCENTE
	VALUES(8888,11,6,0,0,'01-SEP-09',NULL);
	INSERT INTO PLAN_DOCENTE
	VALUES(2020,3,1.5,0,1.5,'01-SEP-08',NULL);
	INSERT INTO PLAN_DOCENTE
	VALUES(7777,12,4.5,3,0,'01-SEP-10',NULL);
	INSERT INTO PLAN_DOCENTE
	VALUES(3333,9,1.5,0,1.5,'01-SEP-09',NULL);


10.- Listar los contenidos de cada una de las tablas.
	
	SELECT CD,D
	FROM DEPARTAMENTO;

	SELECT CAR,AR
	FROM AREA;

	SELECT DNI,P,CAR,CAT
	FROM PROFESOR;

	SELECT CAS,A,T,CUR,CAR,CT,CP,CL
	FROM ASIGNATURA;

	SELECT DNI,CAS,CTA,CPA,CLA,FI,FF
	FROM PLAN_DOCENTE;

11.- Cierra el fichero de SPOOL PRACT3.

	SPOOL OFF

12.- Desde el sqlplus comprueba el contenido del fichero de SPOOL PRACT3.