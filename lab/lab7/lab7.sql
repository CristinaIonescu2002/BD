TO_CHAR(expr[,format[,’nlsparams’]])	face conversia lui expr (care poate avea tipul fie numeric, fie dată) la VARCHAR2
TO_DATE(expr[,format[,’nlsparams’]])	face conversia lui expr (cu tipul CHAR sau VARCHAR2) în formatul DATE
TO_NUMBER(expr [,format[,’nlsparams’]])	face conversia lui expr la o valoare de tip NUMBER

9	Numere (nr. de 9 determină lungimea de afișare)
0	Afișează 0 de la început
$	Semnul $
.	Punct decimal
,	Virgulă
MI	Semnul minus la dreapta
PR	Paranteze pentru numere negative
EEEE	Notație științifică
V	Înmulțire cu 10 (nr. de 9 de după V specifică de câte ori se face înmulțirea)
B	Afișează valori 0 ca blancuri
D	Specifică câte zerouri să fie înainte și după delimitatorul decimal

GREATEST(exp1[,expr2[,…]])	--returnează cel mai mare elemet din listă
LEAST(exp1[,expr2[,…]])	--returnează cel mai mic element din listă


-----------------------------------DECODE și CASE
------------------DECODE
--2. Să se caluleze o primă pentru angajații din departamentul 20 în funcție de 
--jobul angajatului.
SELECT nume, functie, salariu
    decode (fucntie, 'MANAGER', salariu*1.25,
                      'ANALYST', salariu*1.24,
                      salariu/4) prima
FROM angajati 
WHERE id_dep = 20
ORDER BY functie;

--3. Să se calculeze o primă în funcție de vechime pentru angajații din departamentul 20.
SELECT nume, functie, salariu
    TO_CHAR (data_ang, 'YYYY') an_ang
    decode (sign(data_ang - to_date('1-JAN-1982')),
                -1, salariu*1.25,
                salariu*1.10) prima
FROM angajati 
WHERE id_dep = 20
ORDER BY functie;

------------------CASE
SELECT
    CASE LOWER(locatie)
        WHEN 'new york' THEN 1
        WHEN 'dallas' THEN 2
        WHEN 'chicago' THEN 3
        WHEN 'boston' THEN 4
    END cod_dep
FROM departamente;

----------------NVL(expr1, expr2) 
SET null NULL
SELECT nume, comision, nvl (comision, 0) nvl_com,
        salariu + comision "Sal+Com"
        salariu+nvl (comision, 0) "sal + Nvl_Com"
FROM angajati
WHERE id_dep = 30
set null ''

-----------------------------------Funcții de grup
----------AVG([DISTINCT|ALL] expr)
--Ex 4. Afișați media salariilor pentru toate valorile din tabel, iar apoi doar 
--pentru salariile distincte. Rezultatul este diferit deoarece există salarii duplicate.
SELECT AVG(salariu) salariu FROM angajati;
SELECT AVG(ALL salariu) salariu FROM angajati;
SELECT AVG(DISTINCT salariu) salariu FROM angajati;

--5. Să se calculeze salariul mediu pentru fiecare departament.
SELECT id_dep, AVG(salariu) FROM angajati
GROUP BY id_dep
ORDER BY 1;

--6. Să se calculeze venitul lunar mediu pentru fiecare departament. Afișati id_dep și 
--venitul lunar doar pentru departamentele care au venitul lunar mediu mai mare de 2000. 
--Pentru a aplica o condiție bazată pe funcții de agregare, folosim HAVING în loc de WHERE.
SELECT id_dep, AVG(salariu + nvl(comision, 0))
FROM angajati
GROUP BY id_dep
HAVING AVG(salariu + nvl(comision, 0)) > 2000;

----------COUNT(*|[DISTINCT|ALL] expr)
--7. Să se afișeze numărul angajatilor care au primit salariu pentru fiecare departament.
SELECT id_dep, count(*) nr_ang,
        count(salariu) count,
        count(ALL salariu) caunt_all,
        count(DISTINCT salariu) count_distinct
FROM angajati
GROUP BY id_dep
ORDER BY 1;

--8. Să se afișeze departamentele care au cel puțin două funcții distincte pentru angajați.
SELECT id_dep,
        count(functie) count,
        count(DISTINCT fucntie) count_distinct
FROM angajati
GROUP BY id_dep
HAVING count(DISTINCT functie) >= 2
ORDER BY 1;

----------MAX([DISTINCT|ALL] expr) 
----------MIN([DISTINCT|ALL] expr)
----------SUM([DISTINCT|ALL] expr)
--9. Să se afișeze salariul minim, maxim și suma slariilor pentru fiecare departament.
SELECT d.den_dep,
        min(a.salariu) sal_min,
        min(DISTINCT a.salariu) sal_min_d,
        max(a.salariu) sal_max,
        max(DISTINCT a.salariu) sal_max_d,
        sum(a.salariu) sal_sum,
        sum(DISTINCT a.salariu) sal_sum_d
FORM angajati a NATURAL JOIN departamente s
GROUP BY d.den_dep
ORDER BY d.den_dep;

----------VARIANCE([DISTINCT|ALL] expr) 
----------STDDEV([DISTINCT|ALL] expr)
--10. Să se afișeze varianția standard și deviația standard a salariilor pentru fiecare departament.
SELECT id_dep,
        variance(salariu) sal_sarstd,
        variance(DISTINCT salariu) sal_sarstd_d,
        stddev(salariu) sal_devstd,
        stddev(DISTINCT salariu) sal_devstd_s,
        stddev(comision) com_devstd
FROM angajati
ORDER BY id_dep
ORDER BY 1;

