SELECT id_dep, count(nume) nr_ang FROM angajati
GROUP BY id_dep;



-- Ex 1. Să se facă o listă cu:

-- id-ul sefului
-- numele sefului
-- numarul de subalterni
-- numele departamentului din care face parte seful
-- salariu minim/mediu/maxim pt subalterni

SELECT
    a.id_sef,
    a2.nume nume_sef,
    count(a.nume) nr_subalterni,
    d.den_dep nume_departament,
    min(a.salariu) salariu_min,
    avg(DISTINCT a.salariu) salariu_mediu,
    max(a.salariu) salariu_max
FROM angajati a
    LEFT JOIN angajati a2 ON a2.id_ang = a.id_sef
    JOIN departamente d ON a.id_dep = d.id_dep
GROUP BY a.id_sef, a2.nume, d.den_dep
HAVING a.id_sef IS NOT NULL;


-- Ex 2. Să se facă o listă cu:

-- numele angajatului - formatați prima litera mare și restul mici
-- departamentul în care lucreaza angajatul - formatați cu litere mici
-- data angajării pentru angajat - afișati doar luna și anul
-- prima - calculată conform regulilor de mai jos
-- gradul salarial în funcție de salariu
-- numele șefului - formatați prima litera mare și restul mici
-- departamentul în care lucreaza șeful - formatați cu litere mici
-- Prima se acorda doar pentru angajații care au gradul salarial 2 sau 4 și au venit în firmă în același an cu șeful lor

-- dacă angajatul are gradul salarial 2: salariu * sqrt(c * log2(n))
-- dacă angajatul are gradul salarial 4: salariu * sqrt(c * log3(n))
-- altfel: 0
-- unde n este vechimea în firmă calculată în luni și c este o valoare introdusă de la tastatură (folosiți 0.15 pentru testare).

-- Ordonați rezultatele crescător dupa numele angajatului.


SELECT
    INITCAP(a.nume) nume_angajat,
    LOWER(d.den_dep) departament,
    TO_CHAR(a.data_ang, 'MM/YY') AS data_angajarii,
    CASE
        WHEN g.grad IN (2, 4) 
            AND EXTRACT(YEAR FROM a2.data_ang) - EXTRACT(YEAR FROM a.data_ang) = 0 
            THEN a.salariu * SQRT(0.15 * LOG(2, MONTHS_BETWEEN(SYSDATE, a.data_ang)))
        ELSE 0
    END AS prima,
    g.grad AS grad_salariu,
    INITCAP(a2.nume) nume_sef,
    LOWER(d2.den_dep) departament_sef
FROM angajati a
    JOIN angajati a2 ON a2.id_ang = a.id_sef
    JOIN departamente d ON a.id_dep = d.id_dep
    JOIN departamente d2 ON a2.id_dep = d2.id_dep
    JOIN grila_salariu g ON 1.salariu BETWEEN g.nivel_inf AND g.nivel_sup
ORDER BY a.nume ASC;