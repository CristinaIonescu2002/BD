----------------nr 1
SELECT
    a.nume,
    TO_CHAR(a.data_ang, 'DD-MONTH-YYYY') AS data_ang,
    nvl(a.comision, 0) AS comision_actual,
    (SELECT AVG(DISTINCT nvl(comision, 0))
                                    FROM angajati) AS comision_mediu,
    CASE
        WHEN nvl(comision, 0) >= (SELECT AVG(DISTINCT nvl(comision, 0))
                                    FROM angajati)
            THEN  nvl(comision, 0) * 1.5 + nvl(comision, 0)
            ELSE a.salariu * 0.1 + nvl(comision, 0)
        END AS comision_nou,
    d.den_dep AS departament
FROM angajati a
    JOIN departamente d ON a.id_dep = d.id_dep
ORDER BY (SELECT COUNT(*)
            FROM angajati c
            WHERE a.id_dep = c.id_dep), a.nume ASC;




SELECT COUNT(*)
    FROM angajati c
    WHERE c.id_dep = 10