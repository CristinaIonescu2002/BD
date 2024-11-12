-- 1. Să se creeze o copie a tabelului DEPT care să se numească departamente cu 
--următoarele coloane:

CREATE TABLE departamente AS
SELECT
    deptno id_dep,
    dname den_dep,
    loc locatie
FROM dept;

-- 2. Să se creeze o copie a tabelului EMP care să se numească angajati.​

CREATE TABLE angajati AS
SELECT
    empno id_and,
    ename nume,
    job functie,
    mgr id_sef,
    hiredate data_ang,
    sal salariu,
    comm comision,
    deptno id_dep
FROM emp;

-- 3. Să se selecteze toate înregistrările și toate coloanele din tabela angajați

SELECT * FROM angajati;

-- 4. Să se selecteze id-ul și numele departamentului din tabela departamente.

SELECT id_dep, den_dep FROM departamente;

-- 5. Să se selecteze id-ul, numele, funcția și data angajării pentru toți angajații 
-- din firmă, ordonați descrescător în funcție de id. Concatenați id-ul cu numele.

SELECT
    id_ang ||'-'||nume angajat,
    functie,
    data_ang
FROM angajati
ORDER BY id_ang DESC;

-- 6. Să se selecteze id-ul, numele, funcția și venitul lunar pentru toți angajații din 
-- firmă. Să se adauge la select o coloană goală care să se numească semnătura. Concatenați 
-- id-ul cu numele. Ordonați după departament.

SELECT
    id_ang ||'-'||nume angajat,
    functie,
    salariu+nvl(comision,0) AS "venit lunar",
    '        ' AS semnatura
FROM angajati
ORDER BY id_dep;

-- 7. Să se selecteze numele și funcția angajaților.

SELECT nume, 'cu functie', functie
FROM angajati;

-- 8. Să se facă o listă cu numele departamentului și codul acestuia. Ordonați după numele 
-- departamentului.

SELECT
    de_dep||' are codul '||id_dep "Lista Departamente"
FROM Departamente
ORDER BY den_dep ASC;

-- 9. Să se listeze toți angajații din departamentul 10.

SELECT
    a.id_ang ecuson,
    a.nume,
    a.data_ang AS "Data Angajarii",
    a.salariu
FROM angajati a WHERE id_dep = 10;

-- 10. Să se selecteze toți angajații care au funcția MANAGER. Ordonați după id-ul 
--departamentului.

SELECT
    id_dep "Nr. departament",
    nume,
    functie,
    salariu,
    data_ang AS "Dara Angajarii"
FROM angajati
WHERE LOWER(functie) = 'manager'
ORDER BY id_dep;

-- 11. Selectați toate persoanele care s-au angajat intr-o anumită perioadă.

-- metoda 1
SELECT
    id_dep departament,
    functie,
    nume,
    data_ang AS "Data Angajarii"
FROM angajati
WHERE data_ang BETWEEN '1-MAY-1981' AND '31-DEC-1981'
ORDER BY 1, 2 DESC;

-- metoda 2
SELECT
    id_dep departament,
    functie,
    nume,
    data_ang AS "Data Angajarii"
FROM angajati
WHERE data_ang >= '1-MAY-1981' AND data_ang <='31-DEC-1981'
ORDER BY 1, 2 DESC;

-- 12. Să se listeze id-ul, numele, funcția, venitul lunar pentru angajații care au următoarele 
--id-uri: 7499,7902, 7876.

--metoda1
SELECT 
    id_ang AS ecusom,
    nume,
    functie,
    salariu + nvl(comision, 0) "Venit lunar"
FROM angajati 
WHERE id_ang IN (7499, 7902, 7876)
ORDER BY nume;
--metoda2
SELECT 
    id_ang AS ecusom,
    nume,
    functie,
    salariu + nvl(comision, 0) "Venit lunar"
FROM angajati 
WHERE id_ang = 7499 OR id_ang = 7902 OR id_ang = 7876
ORDER BY nume;

-- 13. Să se selecteze toate persoanele care au fost angajate în anul 1980.

SELECT
    id_ang AS ecuson,
    nume,
    functie,
    data_ang AS "Data Angajarii"
FROM angajati
WHERE data_ang LIKE '%80';

-- 14. Să se selecteze toate persoanele al căror nume începe cu litera F și numele funcției are 7 caractere.

SELECT
    id_ang AS ecuson,
    nume,
    functie,
    data_ang AS "Data Angajarii"
FROM angajati
WHERE nume LIKE 'F%' AND functie LIKE '-___';

-- 15. Să se listeze angajații din departamentul 20 care nu au primit comision.

SELECT
    id_ang AS ecuson,
    nume,
    functie,
    salariu,
    comision
FROM angajati
WHERE
    (comision = 0 OR comision IS NULL) AND id_dep = 20
ORDER BY nume;

-- 16. Să se listeze angajații care au primit comision și au funcția SALESMAN.

SELECT
    id_ang AS ecuson,
    nume,
    functie,
    salariu,
    comision
FROM angajati
WHERE
    (comision != 0 OR comision IS NOT NULL) AND UPPER(functie) = UPPER('salesman')
ORDER BY nume;

-- 17. Să se selecteze toți angajații care au funcția MANAGER și salariul peste 1500, 
--și toți angajații care au funcția ANALYST.

SELECT
    id_ang AS ecuson,
    nume,
    functie,
    salariu,
    comision
FROM angajati
WHERE
    salariu > 1500 AND LOWER(functie) = 'manager' OR UPPER(functie) = 'ANALYST'
ORDER BY functie, nume DESC;



DISTINCT - returnează numai o înregistrare în cazul în care comanda găsește valori duplicate pe coloana unde apare;
ALL - returnează toate înregistrările simple și duplicate;
schema.table - reprezintă numele complet de identificare a tabelului/view-ului(în general schema are același nume cu utilizatorul) ;
expression - reprezintă numele unei coloane sau o expresie care folosește funcții de sistem (sau stocate);
expression_alias - este un nume alocat unei expresii care va fi folosit în formatarea coloanei (apare în antetul listei);
dblink - reprezintă numele de identificare, complet sau parțial, a unei baze de date.
table_alias - este un nume alocat unei tabele/view care va fi folosit în cererile corelate;
WHERE conditions - reprezintă o condiție (înlănțuire de condiții) care trebuie să fie îndeplinită în criteriul de selecție a înregistrărilor;
START WITH conditions - stabilește criteriul de selecție pentru prima înregistrare pentru o ordonare ierarhică;
CONNECT BY conditions - stabilește o ierarhie de selecție a înregistrărilor;
GROUP BY expressions - stabilește criteriile de grupare a înregistrărilor (numele coloanelor folosite în criteriul de grupare);
HAVING conditions - restricționarea înregistrărilor din grup la anumite condiții;
UNION [ALL] | INTERSECT | MINUS - combină liniile selectate de mai multe comenzi SELECT prin aplicarea anumitor restricții;
ORDER BY expressions|positions ordonează înregistrările selectate după coloanele din expresie sau în ordinea coloanelor specificate prin poziție;
FOR UPDATE OF - face o blocare (lock) a înregistrărilor în vederea modificării anumitor coloane;
NOWAIT - returnează controlul userului dacă comanda așteaptă eliberarea unei înregistrări blocate de un alt user.