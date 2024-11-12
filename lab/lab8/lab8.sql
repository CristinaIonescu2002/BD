            ---------------NECORELATE----------------

-- 1. Să se selecteze angajatul cu cel mai mare salariu din firmă.
SELECT id_dep, nume, functie, salariu
FROM angajati
WHERE salariu = (SELECT max(salariu)
                From angajati);


--Subcereri necorelate care întorc o coloană în clauza WHERE
-- Sunt subcereri care întorc mai multe valori și folosesc operatorii IN și NOT IN. 
-- În cazul în care se folosesc operatori de comparație în locul operatorului IN (NOT IN), 
-- atunci se generează o eroare.

-- 2. Să se selecteze angajații care au funcții similare funcțiilor din departamentul 20 și 
--nu lucrează în acest departament.
SELECT id_dep, nume, functie, salariu
FROM angajati
WHERE
    NOT id_dep = 20 AND functie IN (SELECT functie FROM angajati WHERE id_dep=20)
ORDER BY functie;

-- 3. Să se selecteze angajații care nu s-au angajat în lunile decembrie, ianuarie și februarie.
SELECT nume, functie, data_ang
FROM angajati
WHERE data_ang NOT IN (SELECT distinct(data_ang)
                        FROM angajati
                        WHERE TO_CHAR(data_ang, 'MON') IN ('DEC', 'JAN', 'FEB'))

-- 4. Să se selecteze angajații care au salariile in lista de salarii maxime pe departament.
SELECT den_dep, nume, salariu
FROM angajatii
    NATURAL JOIN departamente
WHERE salariu IN (SELECT MAX(salariu) FROM angajati GROUP BY id_dep)
ORDER BY den_dep;

-- Subcereri necorelate care întorc o linie în clauza WHERE
-- Sunt cereri care întorc mai multe colonale dar o singură linie;

-- 5. Să se selecteze angajații care au venit în același an și au aceeași funcție cu angajatul 
-- care are numele JONES.

SELECT id_dep, nume, functie, data_ang
FROM angajati
WHERE
    (TO_CHAR(data_ang, 'YYYY'), functie) IN
    (SELECT TO_CHAR(data_ang, 'YYYY'), functie
    FROM angajati
    WHERE LOWER(nume)='jones');

-- Subcereri necorelate care întorc mai multe linii în clauza WHERE
-- Aceste subcereri întorc mai multe linii și mai multe coloane, motiv pentru care se mai numesc și 
-- cereri care întorc o tabelă;

-- 6. Să se afișeze angajatii care au venitul lunar minim pe fiecare departament.
SELECT id_dep, nume, salariu
FROM angajati
WHERE (id_dep, salariu+nvl(comision, 0)) IN
        (SELECT id_dep, min(salariu+nvl(comision, 0))
                FROM angajati
                GROUP BY id_dep)
ORDER BY id_dep;

-- 7. Să se afișeze angajații care au salariul mai mare decât salariul maxim din departamentul SALES. 
-- Acesta este un exemplu de subcereri imbricate (in total 3 nivele), subcererile insa NU intorc mai 
-- multe linii in final, ci o singura valoare.
SELECT nume, functie, data_ang, salariu
FROM angajati
WHERE salariu > (SELECT MAX(salariu)
                    FROM angajati
                    WHERE id_dep = (SELECT id_dep
                                        FROM departamente
                                        WHERE LOWER(den_dep) = 'sales'));


                ------------------------CORELATE---------------------

-- 8. Să se afișeze angajații care au salariul peste valoarea medie a departamentului din care fac parte.
SELECT a.id_dep, a.nume, a.functie, a.salariu
FROM angajati a
WHERE
    a.salariu > (SELECT AVG(b.salariu)
                    FROM angajati b
                    WHERE b.id_dep = a.id_dep)
ORDER BY a.id_dep;

-- 9. Să se mărească salariile angajaților cu 10% din salariul mediu și să se acorde tuturor angajaților 
--un comision egal cu comisionul mediu pe departamentul din care face parte angajatul, numai pentru persoanele 
--angajate înainte de 1-JUN-1981.
UPDATE angajati a
SET (a.salariu a.comision) = (SELECT a.salariu+avg(b.salariu)*0.1, avg(b.comision)
                                FROM angajati b
                                WHERE b.id_dep = a.id_dep)
WHERE data_ang <= '1-JUN-81'

-------------------------- Subcereri pe tabelă temporară

-- 10. Să se afle salariul maxim pentru fiecare departament.
SELECT b.id_dep, a.den_dep, b.max_sal_dep
FROM 
    departamente a,
    (SELECT id_dep, max(salariu) max_sal_dep
        FROM angajati
        GROUP BY id_dep) b
WHERE a.id_dep = b.id_dep
ORDER BY b.id_dep;

SELECT b.id_dep, a.den_dep, b.max_sal_dep
FROM 
    departamente a INNER JOIN
                        (SELECT id_dep, max(salariu) max_sal_dep
                            FROM angajati
                            GROUP BY id_dep) b
                    ON a.id_dep = b.id_dep
ORDER BY b.id_dep;