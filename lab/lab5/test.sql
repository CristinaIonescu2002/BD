---- nr 2.

SELECT
    a1.nume "Nume angajat",
    a2.nume "Nume sef",
    a1.salariu "Salariu",
    (a1.salariu + nvl(a1.comision, 0)) * 12 "Venit anual",
    d.den_dep "Nume departament",
    a1.comision "Comision angajat"
FROM
    angajati a1
    JOIN angajati a2 ON a2.id_ang = a1.id_sef
    JOIN departamente d ON a1.id_dep = d.id_dep
WHERE a2.nume = 'BLAKE' AND nvl(a1.comision, 0) > 0; 
------------var1--------------

SELECT
    a1.nume "nume_angajat",
    a2.nume "nume_sef",
    a1.salariu "salariu",
    (a1.salariu + nvl(a1.comision, 0)) * 12 "venit_anual",
    d.den_dep "nume_dep",
    a1.comision "comision"
FROM
    angajati a1
    JOIN angajati a2 ON a2.id_ang = a1.id_sef
    JOIN departamente d ON a1.id_dep = d.id_dep
WHERE a2.nume = 'BLAKE' AND nvl(a1.comision, 0) > 0; 

--------------var2------------

SELECT
    a1.nume "nume_angajat",
    a2.nume "nume_sef",
    a1.salariu "salariu",
    (a1.salariu + nvl(a1.comision, 0)) * 12 "venit_anual",
    d.den_dep "nume_dep",
    a1.comision "comision"
FROM
    angajati a1
    RIGHT OUTER JOIN angajati a2 ON a2.id_ang = a1.id_sef
    RIGHT OUTER JOIN departamente d ON a1.id_dep = d.id_dep
WHERE a2.nume = 'BLAKE' AND nvl(a1.comision, 0) > 0; 

--------------------------

SELECT
    a1.nume "nume_angajat",
    a2.nume "nume_sef",
    a1.salariu "salariu",
    (a1.salariu + nvl(a1.comision, 0)) * 12 "venit_anual",
    d.den_dep "nume_dep",
    a1.comision "comision"
FROM
    angajati a1
    RIGHT JOIN angajati a2 ON a2.id_ang = a1.id_sef
    RIGHT JOIN departamente d ON a1.id_dep = d.id_dep
WHERE a2.nume = 'BLAKE' AND nvl(a1.comision, 0) > 0; 