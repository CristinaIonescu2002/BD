-- 1. Să se calculeze și afișeze funcția și venitul mediu lunar pentru fiecare funcție. 
--Să se folosească o subcerere în clauza select.
SELECT a.functie, 
       (SELECT AVG(salariu + nvl(comision, 0))
       FROM angajati
       WHERE a.functie = functie) AS venit_mediu_lunar
FROM angajati a;

-- 2. Să se facă o listă cu funcție, gradul salarial, salariul mediu angajați calculat 
--după funcție și grad unde salariul mediu angajați este mai mare sau egal cu salariu 
--mediu pentru grad.
SELECT 
    a.functie,
    g.grad_salarial, 
    (SELECT AVG(salariu)
     FROM angajati b
     WHERE b.functie = a.functie) AS salariu_mediu
FROM 
    angajati a
    LEFT JOIN grila_salariu g ON (SELECT AVG(salariu)
                                    FROM angajati b
                                    WHERE b.functie = a.functie) >= g.nivel_inf
                                    AND (SELECT AVG(salariu)
                                        FROM angajati b
                                        WHERE b.functie = a.functie) <= g.nivel_sup
ORDER BY a.functie, g.grad_salarial;



-- 3. Să se selecteze angajatul/angajații cu cel mai mare venit lunar din departamentul 
--în care lucrează. Afișați

-- numele angajatului
-- numele departamentului în care lucrează angajatul
-- funcția angajatului
-- venitul lunar
-- Ordonați după numele departamentului.

-- Să se rezolve fără a folosi funcții agregate (de grup).

-- Rezolvati in 3 metode, folosind:

-- operatorul some/any
SELECT 
    a.nume,
    d.den_dep,
    a.functie,
    (a.salariu + NVL(a.comision, 0)) AS venit_lunar
FROM angajati a
JOIN departamente d ON a.id_dep = d.id_dep
WHERE (a.salariu + NVL(a.comision, 0)) >= ANY (SELECT a2.salariu + NVL(a2.comision, 0) 
                                             FROM angajati a2 
                                             WHERE a2.id_dep = a.id_dep)
ORDER BY 
    d.den_dep;
-- operatorul all
SELECT 
    a.nume,
    d.den_dep,
    a.functie,
    (a.salariu + NVL(a.comision, 0)) AS venit_lunar
FROM angajati a
JOIN departamente d ON a.id_dep = d.id_dep
WHERE (a.salariu + NVL(a.comision, 0)) >= ALL (SELECT a2.salariu + NVL(a2.comision, 0) 
                                             FROM angajati a2 
                                             WHERE a2.id_dep = a.id_dep)
ORDER BY d.den_dep;

-- operatorul exists
SELECT 
    a.nume,
    d.den_dep,
    a.functie,
    (a.salariu + NVL(a.comision, 0)) AS venit_lunar
FROM angajati a
JOIN departamente d ON a.id_dep = d.id_dep
WHERE 
    EXISTS (SELECT 1 
            FROM angajati a2 
            WHERE a2.id_dep = a.id_dep 
            GROUP BY a2.id_dep 
            HAVING MAX(a2.salariu + NVL(a2.comision, 0)) = a.salariu + NVL(a.comision, 0))
ORDER BY d.den_dep;


