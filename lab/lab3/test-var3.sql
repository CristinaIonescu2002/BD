accept salariu_ref NUMBER prompt 'Introduceti salariul cu care doriti sa comparati:'

SELECT nume, functie, salariu FROM angajati
WHERE salariu > &salariu_ref3;