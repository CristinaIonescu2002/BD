-- Să se facă o listă cu:
    -- Nume Angajat
    -- Departament Angajat
    -- Grad Angajat
    -- Nume Sef
    -- Departament Sef
    -- Grad Sef
-- Sa se afiseze toate rezutlatele, chiar daca nu se gasesc legaturi de JOIN intre intregistrarile din diferitele tabele.

SELECT
    a1.nume "Nume Angajat",
    d1.den_dep "Departament Angajat",
    g1.grad "Grad Angajat",
    a2.nume "Nume Sef",
    d2.den_dep "Departament Sef",
    g2.grad "Grad Sef"
FROM angajati a1
    JOIN departamente d1 ON a1.id_dep = d1.id_dep
    JOIN angajati a2 ON a2.id_ang = a1.id_sef
    JOIN departamente d2 ON a2.id_dep = d2.id_dep
    JOIN grila_salariu g1 ON a1.salariu BETWEEN g1.nivel_inf AND g1.nivel_sup
    JOIN grila_salariu g2 ON a2.salariu BETWEEN g2.nivel_inf AND g2.nivel_sup;


SELECT
    a1.nume "Nume Angajat",
    d1.den_dep "Departament Angajat",
    g1.grad "Grad Angajat",
    a2.nume "Nume Sef",
    d2.den_dep "Departament Sef",
    g2.grad "Grad Sef"
FROM angajati a1
    FULL OUTER JOIN angajati a2 ON a2.id_ang = a1.id_sef
    FULL OUTER JOIN departamente d1 ON a1.id_dep = d1.id_dep
    FULL OUTER JOIN departamente d2 ON a2.id_dep = d2.id_dep
    FULL OUTER JOIN grila_salariu g1 ON nvl(a1.salariu,0) BETWEEN g1.nivel_inf AND g1.nivel_sup
    FULL OUTER JOIN grila_salariu g2 ON nvl(a2.salariu,0) BETWEEN g2.nivel_inf AND g2.nivel_sup
ORDER BY 1;