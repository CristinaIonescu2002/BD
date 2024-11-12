accept id_dep char prompt 'Introduceti ecusonul id-ul departamentului:'
accept venit_anual_mediu char prompt 'Introduceti functie angajatului:'

SELECT nume, id_ang, id_dep, salariu*12 venit_anual FROM angajati
WHERE id_dep = &departament and salariu*12 > &venit_anual_mediu;

@D:\1.Facultate\BD\lab\lab3\ex-c.sql 10 9000