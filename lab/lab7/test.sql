-- NR 1

SELECT
    INITCAP(a.nume) nume,
    d.den_dep departament,
    CASE
        WHEN count(a2.nume) > 0
            THEN  CAST(COUNT(a2.nume) AS VARCHAR(10))
            ELSE 'Nu are subalterni'
        END AS nr_subalterni,
    CASE
        WHEN avg(a2.salariu) > 0
            THEN CAST(avg(a2.salariu) AS VARCHAR(10))
            ELSE 'N/A'
        END AS sal_med_subalterni
FROM angajati a
    JOIN departamente d ON a.id_dep = d.id_dep
    LEFT JOIN  angajati a2 ON a2.id_sef = a.id_ang
GROUP BY a.nume, d.den_dep
HAVING count(a2.nume) < 3;