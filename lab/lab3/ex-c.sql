SELECT nume, id_ang, id_dep, salariu*12 venit_anual FROM angajati
WHERE id_dep = &1 and salariu*12 > &2;

@D:\1.Facultate\BD\lab\lab3\ex-c.sql 10 9000

-- define sau accept