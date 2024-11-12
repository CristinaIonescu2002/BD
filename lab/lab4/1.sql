-- 1.Selectați toți angajații care s-au angajat înainte de anul 1982 și nu au 
--primit comision.

SELECT * FROM angajati
WHERE data_ang < '01-JAN-82' and nvl(comision, 0) = 0;

-- 2.Selectați toți angajații care au salariul peste 3000 și nu au șefi, ordonați 
--după departament.

SELECT * FROM angajati
WHERE salariu > 3000 and id_sef IS NULL
ORDER BY id_dep;
-- pt testare pt ca cel de sus are doar o intrare
SELECT * FROM angajati
WHERE salariu > 2500 and id_sef IS NOT NULL
ORDER BY id_dep;

-- 3.Selectați numele, funcția și venitul anual al angajaților care nu au funcția 
--MANAGER pentru un departament introdus de la tastatură.

SELECT nume, functie, nvl(salariu, 0)*12 "Venit anual al angajatului", id_dep
FROM angajati
WHERE functie != 'MANAGER' and id_dep = &departament;

-- 4.Selectați departamentul, numele, data angajării și salariul tuturor persoanelor 
--angajate în anul 1981 din două departamente care se introduc de la tastatură.

SELECT id_dep, nume, nvl(salariu, 0)*12 "Venit anual al angajatului"
FROM angajati
WHERE data_ang LIKE '%81' and (id_dep = &departament1 or id_dep = &departament2);