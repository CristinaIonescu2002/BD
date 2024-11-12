INNER
LEFT OUTER JOIN
RIGHT OUTER JOIN
FULL OUTER JOIN
CROSS JOIN

--------------------- JOIN

SELECT [DISTINCT|ALL] [[TABLE|table_alias].]{COLUMN|expression} [column_alias]
FROM 
	[schema.]table1 [table1_alias], 
	[schema.]table2 [table2_alias]
WHERE 
	{table1|table1_alias.}COLUMN = {tabel2|table2_alias}.COLUMN
[ORDER BY {expresion|POSITION} [ASC|DESC]]

---------------------- CROSS JOIN (Produsul Cartezian)

-- 1 Să se facă un Cross Join pe tabele angajati si departamente pentru angajații care 
--au funcția ANALYST. Să se selecteze numele angajatului, funcția acestuia și numele 
--departamentului.

SELECT nume, functie, den_dep
FROM angajati, Departamente
WHERE functie = 'ANALYST';

SELECT nume, functie, den_dep
FROM angajati
        CROSS JOIN Departamente
WHERE functie = 'ANALYST';

---------------------- INNER JOIN

-- 2.Să se selecteze id-ul departamentului, numele departamentului, numele și funcția pentru 
--toți angajații care lucrează în departmanentul 10.

SELECT a.id_dep, d.den_dep, a.nume, a.functie
FROM angajati a, departamente d
WHERE a.id_dep = d_id_dep AND a.id_dep = 10
ORDER BY 3;

SELECT angajati.id_dep, departamente.den_dep, angajati.nume, angajati.functie
FROM angajati, departamente
WHERE a.id_dep = d_id_dep AND a.id_dep = 10
ORDER BY 3;

SELECT a.id_dep, d.den_dep, a.nume, a.functie
FROM angajati a
    JOIN departamente d ON a.id_dep = d.id_dep
WHERE a.id_dep = 10
ORDER BY 3;

SELECT a.id_dep, d.den_dep, a.nume, a.functie
FROM angajati a
    INNER JOIN departamente d ON a.id_dep = d.id_dep
WHERE a.id_dep = 10
ORDER BY 3;

SELECT a.id_dep, d.den_dep, a.nume, a.functie
FROM angajati a
    INNER JOIN departamente d USING(id_dep)
WHERE a.id_dep = 10
ORDER BY 3;

SELECT a.id_dep, d.den_dep, a.nume, a.functie
FROM angajati a
    JOIN departamente d USING(id_dep)
WHERE a.id_dep = 10
ORDER BY 3;

---------------------- Natural Join

-- 3. Să se rezolve exercițiul 2 folosind Natural Join.

SELECT
    id_dep, den_dep, nume, functie
FROM angajati 
    NATURAL JOIN Departamente
WHERE id_dep = 10
ORDER BY 3;

--------- Non Equi-join (Θ-Join)

-- 4. Să se listeze numele, salariul și gradul de salarizare pentru angajații din 
--departamentul 20. Când una sau mai multe tabele care nu au coloane comune, sau 
--operatorul folosit nu este egal și trebuie să corelăm tabelele, avem un NON EQUI-JOIN.

SELECT a.nume, a.salariu, g.grad
FROM angajati a, grila_salariu g 
WHERE a.salariu BETWEEN g.nivel_inf AND g.nivel_sup
    AND a.id_dep = 20;

SELECT a.nume, a.salariu, g.grad
FROM angajati a INNER JOIN grila_salariu g ON a.salariu BETWEEN g.nivel_inf AND g.nivel_sup
WHERE a.id_dep = 20;

-- 5. Să se listeze numele, salariul, gradul de salarizare și numele departamentului pentru 
--angajații din departamentul 20.

SELECT a.nume, a.salariu, g.grad, d.den_dep
FROM angajati a, grila_salariu g, departamente d_id_dep
WHERE a.salariu BETWEEN g.nivel_inf AND g.nivel_sup
    AND d.id_dep = a.id_dep
AND a.id_dep = 20
ORDER BY 3, 1;

SELECT a.nume, a.salariu, g.grad, d.den_dep
FROM angajati a
    INNER JOIN grila_salariu g ON a.salariu BETWEEN g.nivel_inf AND g.nivel_sup
    INNER JOIN departamente d ON d.id_dep = a.id_dep
WHERE a.id_dep = 20
ORDER BY 3, 1;

SELECT a.nume, a.salariu, g.grad, d.den_dep
FROM angajati a
    JOIN departamente d ON d.id_dep = a.id_dep
    JOIN grila_salariu g ON a.salariu >= g.nivel_inf AND a.salariu <= g.nivel_sup
WHERE a.id_dep = 20
ORDER BY 3,1;

--------- Self Join
-- 6. Să se listeze numele, funcția, numele șefului și funcția sefului pentru angajații din departamentul 10.

SELECT
    a1.nume "Nume Angajat",
    a1.functie "Functie Angajat",
    a2.nume "Nume Sef",
    a2.functie "Functie Sef"
FROM angajati a1, angajati a2
WHERE a1.id_sef = a2.id_ang AND a1.id_dep = 10;

SELECT
    a1.nume "Nume Angajat",
    a1.functie "Functie Angajat",
    a2.nume "Nume Sef",
    a2.functie "Functie Sef"
FROM angajati a1
        INNER JOIN angajati a2 ON a1.id_ang = a2.id_ang
WHERE ai.id_dep = 10;

---------------------- Left Outer Join

-- 7. Să se selecteze toate departamentele și angajații care fac parte din fiecare 
--departament. Să se ordoneze crescător după id-ul departamentului.

SELECT d.id_dep, d.den_dep, a.nume, a.functie
FROM departamente d, angajati a
WHERE d.id_dep = a.id_dep(+)
ORDER BY a.id_dep;

-- * (+) se pune în dreptul tabelei deficitare de informație

SELECT d.id_dep, d.den_dep, a.nume, a.functie
FROM departamente d
        LEFT OUTER JOIN angajati a ON d.id_dep = a.id_dep
ORDER BY a.id_dep;

---------------------- Right Outer Join

-- 9. Să se afișeze numele, funcția, salariul si gradul de salarizare pentru toți angajații , după ce se 
--li se dublează salariul.

SELECT a.nume, a.salariu, g.grad
FROM grila_salariu g 
        FULL OUTER JOIN angajati a ON a.salariu*2 BETWEEN g.nivel_inf AND g.nivel_sup
ORDER BY a.nume;

-- 10. Să se selecteze numele de departament, numele, salariu si gradul de salariu pentru 
--angajații din firmă, după ce salariile se dublează. Să se afișeze și numele departamentelor
--care nu au angajați și gradele care nu corespund niciunui salariu dublat.

SELECT d.den_dep, a.nume, a.salariu, g.grad
FROM grila_salariu g 
        FULL OUTER JOIN angajati a 
            RIGHT OUTER JOIN departamente d ON d.id_dep = a.id_dep
                ON a.salariu*2 BETWEEN g.nivel_inf AND g.nivel_sup
ORDER BY d.den_dep, a.nume, g.grad;

SELECT d.den_dep, a.nume, a.salariu, g.grad
FROM angajati a 
        FULL OUTER JOIN grila_salariu g 
                ON a.salariu*2 BETWEEN g.nivel_inf AND g.nivel_sup
        FULL OUTER JOIN departamente d 
                ON d.id_dep = a.id_dep
ORDER BY d.den_dep, a.nume, g.grad;

---------------------- Join Vertical

-- 11. Să se listeze angajații din departamentele 10 și 30.

SELECT id_Dep, nume, functie, salariu
FROM angajati 
WHERE id_dep = 10
UNION
SELECT id_dep, nume, functie, salariu
FROM angajati
WHERE id_dep = 30;

-- 12. Să se construiască o cerere care reunește pe aceeași coloană salariile angajațiilor 
--din departamentul 10 și comisionale celor din departamentul 30.

SELECT id_dep, nume, 'are salariu' are, salariu sal_com
FROM angajati WHERE id_dep = 10
UNION
SELECT id_dep, nume, 'are comisionul' are, comision sal_com
FROM angajati WHERE id_dep = 30;

-- 13. Să se selecteze toate funcțiile din departamentul 10 și 20.

SELECT functie FROM angajati WHERE id_dep = 10
UNION ALL
SELECT functie FROM angajati WHERE id_dep = 20;

-- 14. Să se selecteze funcțiile care au primit același comision și se regăsesc în departamentele 10, 20,30.

SELECT functie, nvl(comision, 0) comision
FROM angajati WHEREid_dep = 10
INSERT
SELECT functie, nvl(comision, 0)
FROM angajați WHERE id_dep = 20
INTERSECT
SELECT functie, nvl(comision, 0)
FROM angajati WHERE id_dep = 30;

-- 15. Să se selecteze funcțiile care se găsesc în departamentul 10 dar nu se regăsesc în departamentul 30.

SELECT functie FROM angajati WHERE id_dep = 10
MINUS
SELECT functie FROM angajați WHERE id_dep = 30;
