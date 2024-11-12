SELECT nume, id_ang, id_dep, salariu*12 venit_anual FROM angajati
WHERE id_dep = &departament and salariu*12 > &&venit_anual_mediu;

undefine venit_anual_mediu;