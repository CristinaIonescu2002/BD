-- Să se selecteze numele angajatului, numele departamentului si salariul pentru angajatii 
--care au salariul egal cu salariul minim din departamentul in care lucreaza. Ordonati dupa 
--nume.

-- Rezolvati prin 4 metode:

-- o metoda care sa foloseasca o subcerere care intoarce o valoare
SELECT 
    a.nume,
    d.den_dep,
    a.salariu
FROM angajati a
    LEFT JOIN departamente d ON a.id_dep = d.id_dep
WHERE a.salariu = (SELECT MIN(b.salariu)
                    FROM angajati b
                    WHERE b.id_dep = a.id_dep)
ORDER BY a.nume;

-- o metoda care sa foloseasca o subcerere care intoarce o linie cu mai multe coloane
SELECT 
    a.nume,
    d.den_dep,
    a.salariu
FROM angajati a
    LEFT JOIN departamente d ON a.id_dep = d.id_dep
WHERE (a.id_dep, a.salariu) IN (SELECT id_dep, MIN(salariu)
                                    FROM angajati
                                    WHERE id_dep = a.id_dep
                                    GROUP BY id_dep)
ORDER BY a.nume;

-- o metoda care sa foloseasca o subcerere care intoarce mai multe linii cu mai multe coloane
SELECT 
    a.nume,
    d.den_dep,
    a.salariu
FROM angajati a
    LEFT JOIN departamente d ON a.id_dep = d.id_dep
WHERE (a.id_dep, a.salariu) IN (SELECT id_dep, MIN(salariu)
                                    FROM angajati
                                    GROUP BY id_dep)
ORDER BY a.nume;

-- o metoda care sa foloseasca o subcerere in clauza from
--- NU MERGEEEEEEEEEEEEEE
SELECT 
    a.nume,
    d.den_dep,
    s.salariu
FROM angajati a
    LEFT JOIN departamente d ON a.id_dep = d.id_dep
    INNER JOIN (SELECT id_dep, MIN(salariu)
        FROM angajati
        GROUP BY id_dep) s ON s.id_dep = a.id_dep
ORDER BY a.nume;

----------ex dat de tibi
----a
SELECT 
    a.nume,
    TO_CHAR(a.data_ang, 'MM/YY') AS data_angajarii,
    a.salariu,
    s.salariu_mediu_departament,
    CASE
        WHEN a.salariu < s.salariu_mediu_departament
            THEN 2
            ELSE 1
        END AS zile_libere_suplimentare,
    d.den_dep
FROM angajati a
    LEFT JOIN departamente d ON a.id_dep = d.id_dep
    INNER JOIN (SELECT id_dep, ROUND(AVG(salariu), 2) AS salariu_mediu_departament
                    FROM angajati
                    GROUP BY id_dep) s ON a.id_dep = s.id_dep;

-----b
SELECT 
    a.nume,
    TO_CHAR(a.data_ang, 'MM/YY') AS data_angajarii,
    a.salariu,
    (SELECT ROUND(AVG(salariu), 2)
        FROM angajati
        WHERE a.id_dep = id_dep
        GROUP BY id_dep) AS salariu_mediu_departament,
    CASE
        WHEN a.salariu < (SELECT ROUND(AVG(salariu), 2)
                            FROM angajati
                            WHERE a.id_dep = id_dep
                            GROUP BY id_dep)
            THEN 2
            ELSE 1
        END AS libere_extra,
    d.den_dep AS nume_dep
FROM angajati a
    LEFT JOIN departamente d ON a.id_dep = d.id_dep;