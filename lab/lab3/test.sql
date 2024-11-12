-- Nr 2:

-- Sa creem niste tabele si sa inseram cate un rand de date pt fiecare 
-- 2 metode

create table book (
    id NUMBER PRIMARY KEY,
    title VARCHAR2(30),
    author VARCHAR2(30)
);

create table loan (
    user_id NUMBER,
    book_id NUMBER
);

create table users (
    id NUMBER PRIMARY KEY,
    name VARCHAR2(30),
    email VARCHAR2(30)
);

alter table loan add constraint fk_id_user foreign key (user_id)
    references users(id);
    
alter table loan add constraint fk_id_book foreign key (book_id)
	references book(id);

insert into book values(001, 'HAi sa vedem', 'LALALALAL');
insert into users values(111, 'nume original', 'nume_original@gmail.com');
insert into loan values(112,001);

-- metoda1

SELECT nume, functie, salariu FROM angajati
WHERE salariu > &salariu_ref1;

-- metoda2

SELECT nume, functie, salariu FROM angajati
WHERE salariu > &&salariu_ref2;

undefine salariu_ref2;

--metoda 3

