-- nr 1

-- Pasul 1:

-- SELECT 
--     id_dep,
--     den_dep,
--     (SELECT AVG(nvl(a.salariu, 0))
--         FROM angajati a
--         WHERE d.id_dep = a.id_dep) salariu_mediu_min
-- FROM departamente d
-- ORDER BY d.den_dep;

SELECT
    min(salariu_mediu_min)
FROM (SELECT 
        id_dep,
        den_dep,
        (SELECT AVG(nvl(a.salariu, 0))
            FROM angajati a
            WHERE d.id_dep = a.id_dep) salariu_mediu_min
    FROM departamente d);




--     JOIN departamente d ON a.id_dep = d.id_dep
-- WHERE MIN(AVG(SELECT salariu))


-- SELECT AVG(nvl(a.salariu, 0))
-- FROM departamente d
--     JOIN angajati a ON d.id_dep = a.id_dep;



-- Pasul 2:
SELECT a.id_ang, a.nume, g.grad, a.id_sef, a2.nume, g2.grad
FROM angajati a
    JOIN grila_salariu g ON a.salariu BETWEEN g.nivel_inf AND g.nivel_sup
    JOIN angajati a2 ON a2.id_ang = a.id_sef
    JOIN grila_salariu g2 ON a2.salariu BETWEEN g2.nivel_inf AND g2.nivel_sup
WHERE g.grad > g2.grad / 2;


-- Final
SELECT 
    a.nume nume_ang, 
    g.grad grad_ang, 
    a2.nume nume_sef, 
    g2.grad graf_sef
FROM angajati a
    JOIN grila_salariu g ON a.salariu BETWEEN g.nivel_inf AND g.nivel_sup
    JOIN angajati a2 ON a2.id_ang = a.id_sef
    JOIN grila_salariu g2 ON a2.salariu BETWEEN g2.nivel_inf AND g2.nivel_sup
WHERE a.id_dep = (SELECT
                    MIN(salariu_mediu_min),
                    id_dep
                    FROM (SELECT 
                            id_dep,
                            den_dep,
                            (SELECT AVG(nvl(a.salariu, 0))
                                FROM angajati a
                                WHERE d.id_dep = a.id_dep) salariu_mediu_min
                                FROM departamente d))

a.salariu = (SELECT MIN(b.salariu)
                    FROM angajati b
                    WHERE b.id_dep = a.id_dep)