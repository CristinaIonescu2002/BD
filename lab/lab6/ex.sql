-- Pentru angajatii ce au numele de lungime 4, faceti o lista cu:

-- numele angajatului scris cu litere mari
-- ziua in care s-au angajat
-- denumirea departamentului in care lucreaza scrisa cu litere mici
-- initiala numelui sefului

SELECT 
    UPPER(a.nume) AS "Nume Angajat",
    a.data_ang AS "Zi Angajare",
    d.den_dep AS "Denumire departament",
    SUBSTR(a2.nume, 1, 1) AS "Initiala Sef"
FROM angajati a 
    JOIN departamente d ON a.id_dep = d.id_dep
    LEFT JOIN angajati a2 ON a2.id_ang = a.id_sef
WHERE LENGTH(a.nume) = 4;

-- Pentru angajatii care se afla in departamentul din Chicago, afisati:

--  numele (scris cu prima litera mare si restul mici)
--  email(de forma'nume_id@gmail.com')
--  luna si anul angajarii de forma MM/YY
--  initiala numelui sefului

--  Antet: nume, email, data_angajarii, initiala_sef

SELECT 
    INITCAP(a.nume) AS nume,
    CONCAT(LOWER(a.nume) || '_' || a.id_ang, '@gmail.com') AS email,
    TO_CHAR(a.data_ang, 'MM/YY') AS data_angajarii,
    SUBSTR(a2.nume, 1, 1) initiala_sef
FROM angajati a 
    JOIN departamente d ON a.id_dep = d.id_dep and UPPER(d.locatie) = 'CHICAGO'
    JOIN angajati a2 ON a2.id_ang = a.id_sef;