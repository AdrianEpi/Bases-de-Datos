1. Listar los nombres de asignaturas adscritas a áreas cuyo nombre empiece por ‘A’.
	SELECT A
		FROM ASIGNATURA
		WHERE CAR IN (SELECT CAR 
			FROM AREA
			WHERE AR LIKE 'A%');
		

2. Listar los nombres de asignaturas adscritas a áreas cuyo nombre termine en ‘A’.
	SELECT A
		FROM ASIGNATURA
		WHERE CAR IN (SELECT CAR 
			FROM AREA
			WHERE AR LIKE '%A');

3. Listar los nombres de asignaturas que lleven la palabra ‘DATOS’.
	SELECT A
		FROM ASIGNATURA
		WHERE A LIKE '%DATOS%';
	

4. Listar los DNI de los profesores en cuyo nombre el tercer carácter sea ‘R’.
	SELECT DNI
		FROM PROFESOR
		WHERE (P LIKE '%__R%');

5. Listar, sin contar duplicados, los DNI de los profesores con nombres de, a lo sumo, 5
caracteres de longitud.
	SELECT DISTINCT DNI
		FROM PROFESOR
		WHERE (P NOT LIKE '_____*');

6. Listar, sin contar duplicados, los DNI de los profesores con nombres de, al menos, 5
caracteres de longitud.
	SELECT DISTINCT DNI
		FROM PROFESOR
		WHERE (P NOT LIKE '_____*' or P like '_____');

7. Listar los nombres de los profesores que actualmente imparten alguna asignatura.
	SELECT P
		FROM PROFESOR
		WHERE DNI IN (SELECT DNI
			FROM PLAN_DOCENTE
			WHERE FF IS NULL);

8. Nombres de los profesores que han impartido la asignatura con código 8.
	SELECT P
		FROM PROFESOR
		WHERE DNI IN (SELECT DNI
			FROM PLAN_DOCENTE
			WHERE CAS = '8');
9. Listar las t-uplas de la tabla PLAN_DOCENTE ordenadas de forma ascendente, según el
campo FF.
	SELECT *
		FROM PLAN_DOCENTE
		ORDER BY FF ASC;

10.Listar las t-uplas de la tabla PLAN_DOCENTE ordenadas de forma descendente, según el
campo FF.
	SELECT *
		FROM PLAN_DOCENTE
		ORDER BY FF DESC;

11.Nombres de los profesores que han impartido la asignatura ‘OPTIMIZACIÓN’ en la
titulación GII. Ordena los nombres ascendentemente.
	SELECT P
		FROM PROFESOR
		WHERE DNI IN (SELECT DNI
			FROM PLAN_DOCENTE
			WHERE CAS IN (SELECT CAS
				FROM ASIGNATURA
				WHERE A = 'OPTIMIZACION' AND T = 'GII'));

12.Listar los nombres de los profesores del departamento ‘MATEMÁTICA
FUNDAMENTAL’. Ordena los nombres descendentemente.
	SELECT P 
		FROM PROFESOR
		WHERE CAR IN (SELECT CAR
			FROM AREA
			WHERE CD IN (SELECT CD
				FROM DEPARTAMENTO
				WHERE D = 'MATEMÁTICA'))
		ORDER BY P DESC;

13.Listar los nombres de las asignaturas impartidas por el profesor con DNI 1010.
	SELECT A 
		FROM ASIGNATURA
		WHERE CAS IN (SELECT CAS
			FROM PLAN_DOCENTE
			WHERE DNI = '1010'));
14.Listar los nombres de las asignaturas impartidas por el profesor con nombre ‘DAVID’.
	SELECT A 
		FROM ASIGNATURA
		WHERE CAS IN PLAN_DOCENTE (SELECT CAS
			FROM PLAN_DOCENTE
			WHERE DNI IN (SELECT DNI
				FROM PROFESOR
				WHERE P = 'DAVID'));

15.Listar los nombres de las áreas adscritas al departamento ‘ESTADISTICA,
INVESTIGACIÓN OPERATIVA Y COMPUTACIÓN’.
	SELECT AR
		FROM AREA
		WHERE CD IN (SELECT CD
			FROM DEPARTAMENTO
			WHERE ((D = 'ESTADISTICA') OR (D = 'INVESTIGACION OPERATIVA') OR (D = 'COMPUTACION')));

16.Listar los nombres de las asignaturas impartidas actualmente por catedráticos de universidad
(categoría CU).
	SELECT A 
		FROM ASIGNATURA
		WHERE (( FF = NULL) AND (CAS IN (SELECT CAS
			FROM PLAN_DOCENTE
			WHERE DNI IN (SELECT DNI
				FROM PROFESOR
				WHERE CAT = 'CU'))));

17.Listar los nombres de las asignaturas que siempre han sido impartidas por catedráticos de
universidad (categoría CU).
	SELECT A 
		FROM ASIGNATURA
		WHERE NOT EXISTS (SELECT * 
			FROM PLAN_DOCENTE 
			NATURAL JOIN PROFESOR
			WHERE ASIGNATURA.CAS = PLAN_DOCENTE.CAS AND CAT <>'CU');


18.Listar los nombres de asignaturas adscritas a ‘LENGUAJES Y SISTEMAS
INFORMÁTICOS’ o a ‘CIENCIAS DE LA COMPUTACIÓN E INTELIGENCIA
ARTIFICIAL’.
	SELECT A
		FROM ASIGNATURA
		WHERE CAR IN (SELECT CAR
			FROM AREA
			WHERE ((AR = 'LENGUAJES Y SISTEMAS INFORMATICOS') OR (AR = 'CIENCIAS DE LA COMPUTACION E INTELIGENCIA ARTIFICIAL')));

19.Listar los nombres de profesores que actualmente dan clases en las titulaciones ‘GII’ o en
‘MII’.
	SELECT P
		FROM PROFESOR
		WHERE DNI IN (SELECT DNI
			FROM PLAN_DOCENTE
			WHERE ((T = 'GII') OR (T = 'MII')));

20.Listar los nombres de profesores que actualmente dan clases en las titulaciones ‘GII’ y en
‘MII’ simultáneamente.
	SELECT P
		FROM PROFESOR
		WHERE DNI IN (SELECT DNI
			FROM PLAN_DOCENTE
			WHERE ((T = 'GII') AND (T = 'MII')));

21.Listar los nombres de profesores que actualmente no imparten ninguna asignatura.
	SELECT P
		FROM PROFESOR
		WHERE NOT EXISTS (SELECT *
			FROM PLAN_DOCENTE
			NATURAL JOIN PROFESOR
			WHERE (PROFESOR.DNI = PLAN_DOCENTE.DNI));

22. Listar los nombres de asignaturas impartidas en la titulación GII.
	SELECT A 
		FROM ASIGNATURA
		WHERE T = 'GII';
23.Listar los nombres de las áreas de conocimiento y los nombres de las asignaturas que
pertenecen a ellos.
	SELECT AR, A
		FROM AREA
		NATURAL JOIN ASIGNATURA;

24.Listar los nombres de departamentos y los nombres de las áreas adscritas a ellos. Ambos
campos deben estar ordenados de forma alfabética.
	SELECT D, AR
		FROM DEPARTAMENTO
		NATURAL JOIN AREA;


25.Listar los nombres de departamentos y los profesores de cada uno de ellos. Ambos campos
deben estar ordenados de forma alfabética.
	SELECT D ORDER BY D ASC, P ORDER BY P ASC
		FROM DEPARTAMENTO
		NATURAL JOIN PROFESOR;