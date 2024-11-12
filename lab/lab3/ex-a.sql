-- 1. Să se scrie o comandă SQL care listează toți angajații dintr-un departament
--(introdus ca parametru de la tastatură), care au venitul anual peste un venit mediu
--anual (introdus tot de la tastatură). Să se afișeze numele angajatului, id-ul de
--departamentul, venitul anual.

-- Dați cel puțin 4 metode de rezolvare.


SELECT nume, id_ang, id_dep, salariu*12 venit_anual FROM angajati
WHERE id_dep = &departament and salariu*12 > &venit_anual_mediu;

SELECT nume, id_ang, id_dep, salariu*12 venit_anual FROM angajati
WHERE id_dep = &departament and salariu*12 > &&venit_anual_mediu;

undefine venit_anual_mediu;

