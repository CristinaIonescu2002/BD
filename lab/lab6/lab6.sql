SIN(n)	--returnează sinus de n unde n este în radiani
COS(n)	--returnează cosinus de n unde n este în radiani
TAN(n)	--returnează tangenta de n unde n este în radiani
SINH(n)	--returnează sinus hiperbolic de n
COSH(n)	--returnează cosinus hiperbolic de n
TANH(n)	--returnează tangenta hiperbolică de n
ASIN(n)	--returnează arcsinus de n
ACOS(n)	--returnează arccosinus de n
ATAN(n)	--returnează arctangenta de n
SIGN(n)	--returnează -1 dacă n<0, 0 dacă n=0, 1 dacă n>0
ABS(n)	--returnează valoarea absolută a lui n
CEIL(n)	--returnează cel mai mic întreg>=n
FLOOR(n)	--returnează cel mai mare întreg<=n
EXP(n)	--returnează e la puterea n
POWER(m,n)	--returnează m la puterea n
SQRT(n)	--returnează rădăcina pătrată a lui n
LN(n)	--returnează logaritmul natural al lui n (n>0)
LOG(m,n)	--returnează logaritmul în baza m a lui n
MOD(m,n)	--returnează restul împărțirii lui m la n
ROUND(n[, m])	--returnează n rotunjit astfel: m zecimale dacă m>0, 0 dacă m este omis, m cifre înainte de virgulă dacă m<0
TRUNC(n[, m])	--returnează n trunchiat astfel: m zecimale dacă m>0, 0 dacă m este omis, m cifre înainte de virgulă dacă m<0



CHR(n)	--returnează caracterul care are reprezentarea decimală n
CONCAT(str1, str2)	--returnează concatenarea lui str1 cu str2
INITCAP(str)	--converteste fiecare prima litera a fiecarui cuvânt din str la litera mare iar restul de litere la litere mici
REPLACE(str, strOld, strNew)	--înlocuiește în șirul de caractere str subșirul de caractere strOld cu subșirul de caractere strNew
RPAD(str1, n[,str2])	--adaugă la dreapta lui str1 caracterele din str2 până la lungimea n iar dacă str2 lipseșe adaugă spațiu
LPAD(str1, n[,str2])	--adaugă la stânga lui str1 caracterele din str2 până la lungimea n iar dacă str2 lipseșe adaugă spațiu
RTRIM(str1[, str2])	--șterge din str1 ultimele caractere dacă sunt în str2
SUBSTR(str, m[, n])	--returnează n caractere din str începând cu poziția m
INSTR(str1, str2[, n[, m]])	--returnează poziția lui str2 în str1, începând cu poziția n, la a m-a apariție
TRANSLATE(str1, from_str, to_str)	--înlocuiește în șirul de caractere str1 toate aparițiile caracterelor din form_str cu caracterul corespondent din to_str (înlocuirea se face caracter cu caracter)
LENGTH(str)	--returnează lungimea șirului de caractere str

CC, SCC -- pentru secol
SYYYY, YYYY, YEAR, SYEAR, YYY, YY, Y -- pentru an
MONTH, MON, MM, RM -- pentru lună
WW --ziua din săptămână în care este cuprinsă data care coincide cu prima zi a anului
W -- ziua din săptămână în care este cuprinsă data care coincide cu prima zi a lunii
DDD, DD --prentru zi
DAY, DY, D -- pentru prima zi din săptămână în care este cuprinsă data
HH, HH12, HH24 -- pentru oră
MI -- minute
SS -- secunde
RR -- formatul pentru an și secol

LAST_DAY(date)	--returnează data ultimei zile din luna cuprinsă în date
NEXT_DAY(date, str)	--returnează data următoarei zile din săptămână dată de str, după data date
ADD_MONTHS(date, n)	--returnează o dată prin adăugarea a n luni la date
MONTHS_BETWEEN(date1, date2)	--returnează numărul de luni (și fracțiuni de luni) cuprinse între date1 și date2. Dacă date1>=date2 rezultatul va fi pozitiv, altfel negativ
ROUND(date, format)	--returnează data prin rotunjirea lui date la formatul format
TRUNC(date, format)	--returnează data prin trunchierea lui date la formatul format
SYSDATE	--returnează data curentă(data de sistem) în diferite formate
EXTRACT(part FROM date)	--extrage partea part din dată date, returnează o valoare numerică
