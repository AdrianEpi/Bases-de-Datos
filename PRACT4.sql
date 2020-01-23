
1. Listar todos los registros de la tabla DEPARTAMENTO. Nombra explícitamente todos los campos detrás del SELECT.
	SELECT CD,D
	FROM DEPARTAMENTO;

2. Listar todos los registros de la tabla AREA. Utiliza * detrás del SELECT. 
	SELECT *
	FROM AREA;

3. Listar todos los DNI de los profesores.
	SELECT DNI
	FROM PROFESOR;

4. Listar todas las t-uplas de la tabla PROFESOR.
	SELECT *
	FROM PROFESOR;

5. Listar todas las t-uplas de la tabla PROFESOR proyectando los atributos en el siguiente orden: P, DNI, CAT, CAR.
	SELECT P, DNI, CAT, CAR
	FROM PROFESOR;

6. Idem que la anterior pero ahora pon un alias explicativo para cada uno de los atributos.
	SELECT DNI AS NUMERO_DNI, P AS PROFESOR, CAR AS CODIGO_AREA_CONOCIMIENTO, CAT AS CATEGORIA
	FROM PROFESOR;

7. Listar todas las t-uplas de la tabla ASIGNATURA.
	SELECT *
	FROM ASIGNATURA;

8. Listar todas las t-uplas de la tabla ASIGNATURA asociadas a la titulación GII.
	SELECT *
	FROM ASIGNATURA
	WHERE T = 'GII';

9. Listar los DNI de los profesores del área con código 7.
	SELECT DNI
	FROM PROFESOR
	WHERE CAR = 7;

10.Listar, eliminando duplicados, los nombres de los profesores del área con código 7.
	SELECT DISTINCT P AS NOMBRE_PROFESOR
	FROM PROFESOR
	WHERE CAR = 7;

11.Listar los nombres de las asignaturas que tengan un código mayor o igual que 7.
	SELECT A AS ASIGNATURA
	FROM ASIGNATURA
	WHERE CAS >= 7;

12.Listar los nombres de las asignaturas que tengan un código mayor que 7.
	SELECT A AS ASIGNATURA
	FROM ASIGNATURA
	WHERE CAS > 7;

13.Listar el código de la asignatura con nombre ‘ALMACENES DE DATOS’.
	SELECT CAS AS CODIGO_ASIGNATURA
	FROM ASIGNATURA
	WHERE A = 'ALMACENES DE DATOS';

14.Listar los nombres de las asignaturas que tengan un código distinto de 8.
	SELECT A AS ASIGNATURA
	FROM ASIGNATURA
	WHERE CAS != 8;

15.Listar los nombres de las asignaturas que tengan un código distinto de 8 y 11.
	SELECT A AS ASIGNATURA
	FROM ASIGNATURA
	WHERE (CAS != 8 AND CAS != 11);

16.Listar los códigos de las asignaturas impartidas por el profesor con DNI 3333.
	SELECT CAS AS CODIGO_ASIGNATURA
	FROM PLAN_DOCENTE
	WHERE DNI  = 3333;

17.Listar el código del departamento de ‘ASTROFÍSICA’.
	SELECT CD AS CODIGO_DEPARTAMENTO
	FROM DEPARTAMENTO
	WHERE D  = 'ASTROFISICA';

18.Listar los DNI de los profesores que han sido asignados a asignaturas el día ‘01-09-09’.
	SELECT DNI
	FROM PLAN_DOCENTE
	WHERE FI = '01-SEP-09';

19.Listar los DNI de los profesores que han sido asignados a asignaturas con anterioridad al ’01-01-09’.
	SELECT DNI
	FROM PLAN_DOCENTE
	WHERE FI < '01-SEP-09';

20.Listar los nombres de las asignaturas adscritas a las áreas 3, 5 y 8.
	SELECT A
	FROM ASIGNATURA
	WHERE (CAR = 3 OR CAR = 5 OR CAR = 8);

21.Listar los nombres de las asignaturas que no están adscritas a las áreas 3, 5 y 8.
	SELECT A
	FROM ASIGNATURA
	WHERE (CAR != 3 AND CAR != 5 AND CAR != 8);

22.Listar los nombres de los profesores cuyo DNI está comprendido entre 3000 y 7000.
	SELECT P AS PROFESOR
	FROM PROFESOR
	WHERE (DNI < 7000 AND DNI > 3000);


23.Listar los nombres de los profesores cuyo DNI no está comprendido entre 3000 y 7000.
	SELECT P AS PROFESOR
	FROM PROFESOR
	WHERE !(DNI > 7000 OR DNI < 3000);

24.Listar los códigos de las asignaturas asignadas actualmente al profesor con DNI 1111.
	SELECT CAS AS CODIGO_ASIGNATURA
	FROM PLAN_DOCENTE
	WHERE DNI  = 1111;

25.Obtener para cada asignatura el número total de créditos que tiene.
	SELECT CT + CP + CL AS CREDITOS_TOTALES
	FROM ASIGNATURA;
