--- Crearea unei copii a unui tabel

CREATE TABLE angajati (
    id_and NUMBER(4),
    nume VARCHAR2(20),
    data_ang DATE
);

INSERT INTO angajati SELECT * from emp; -- copie a tabelulii emp 1

CREATE TABLE angajati AS SELECT * FROM emp;  --2

--- Variabile subtile
-- pentru nemere &var
-- pentru string/date '&var'

--   1.Să se selecteze id_ang, nume, functie și salariu pentru angajatii
--care au același sef. Id-ul șefului se va introduce de la tastatură.
SELECT id_ang, nume, functie, salariu
FROM angajati
WHERE id_sef =  &id_sef;

set verify off -- pt a nu se afisa valori vechi

--    2. Să se selecteze numele, funcția și salariu pentru angajații care 
--au aceași funcție. Funcția va fi introdusa de la tastatură.

SELECT nume, '&functie' functie, salariu
FROM angajati
WHERE functie = &functie;

--    3.Să se selecteze numele, funcția și salariul anual pentru toți angajații
-- din același departament. Salariul anual este calculat după formula 12*salariu.
--Se va introduce de la tastatură funcția pentru salariul anual, numele tabelului, 
--numele coloanei pe care se pune condiția și id-ul departamentului.

SELECT nume, functie, &salariu_anual salariu_anual
FROM &tabel
WHERE &nume_coloana = &valoare_coloana;

--    4.Să se selecteze numele, funcția și venitul lunar pentru toți angajații 
--care au venitul lunar mai mare de 2000. Venitul lunar este o funcție care are 
--formula salariu + nvl(comision, 0).

SELECT nume, functie, &&venit_lunar venit_lunar
FROM angajati
WHERE &venit_lunar > 2000;

SELECT id_ang, nume, functie, data_ang
FROM angajati
WHERE functie 
UNDEFINE venit_lunar -- pentru resetare var5iabila cu &&
nvl(param1, param2) -- param1 ?? param2

--    5.Să se selecteze id-ul angajatului, numele, funcția și data angajării pentru
--toți angajații care au aceeași funcție și au venit în firmă după o anumită dată.
--Funcția și data se vor da de la tastatură în momentul când se execută fișierul de
--comenzi.
= '&1' and data_ang > '&2'
ORDER BY data_ang;

SQL> cale_fisier_in_care_am_pus_codul param1 param2

--    6.Să se selecteze numele, salariul și funcția angajaților care au aceeași 
--funcție. Funcția se va da de la tastatură. Se vor scrie următoarele comenzi într-un
--fisier (de exemplu ex6.sql)

ACC[EPT] variable [NUM[BER] | CHAR | DATE | BINARY_FLOAT | BINARY_DOUBLE] [FOR[MAT] format] [DEF[AULT] default] [PROMPT text|NOPR[OMPT]] [HIDE]

accept functie_ang char prompt 'Introduceti functiea angajatului:'

SELECT nume, salariu, comision
FROM angajati
WHERE functie = '&functie_ang'

undefine functie_ang

--    7.Să se adauge un nou angajat. La introducerea salariului caracterele să fie ascunse.

accept id_ang char prompt 'Introduceti ecusonul angajatului:'
accept nume char prompt 'Introduceti numele angajatului:'
accept functie char prompt 'Introduceti functie angajatului:'
accept salariu char prompt 'Introduceti salariu angajatului:' hide

INSERT INTO angajati(id_ang, nume, functie, salariu)
    VALUES(&id_angajati, '&nume', '&functie', &salariu);

undefine id_ang
undefine functie
undefine nume
undefine salariu

SQL> set verify on
SQL> cale_fisier_in_care_am_pus_codul
-- iti sa promt pentru alegerea variabilelor de mai sus

--    8.Să se calculeze o primă de 15% pentru toți angajații din departamentul 20.

define procent_prima = 0.15
define id_dep = 20

SELECT nume, salariu, salariu*&procent_prima prima
FROM angajati
WHERE id_dep = &id_dep;

undefine procent_prima
undefine id_dep

-- pentru a vedea setarile tuturor variabilelor active
define