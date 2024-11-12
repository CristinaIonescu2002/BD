create table categories (
    id_category number Primary key,
    categry VARCHAR2(20)
);

create table songs (
    id_song number Primary Key,
    id_category number not null,
    id_album number not null,
    title VARCHAR2(20),
    length number,
    content VARCHAR(20)
);

create table compossers (
    id_song number,
    id_artist number
);

create table artists (
  	id_artist number Primary key,
    id_band number,
	firstname Varchar2(20),
    lastname varchar2(20),
    date_of_birth date default SYSDATE -- / default 2000
);

create table albums (
  	id_album number Primary key,
    title varchar2(20),
    year number,
    id_band number
);

create table bands (
  	id_band number primary key,
    name varchar2(20)
);

alter table songs add constraint pk_id_category foreign key (id_category)
	references categories(id_category);

alter table songs add constraint pk_id_album foreign key (id_album)
	references albums(id_album);

alter table albums add constraint pk_id_band foreign key(id_band)
    references bands(id_band);

alter table artists add constraint pk_id_band_a foreign key(id_band)
    references bands(id_band);

alter table compossers add constraint fk_id_songs foreign key (id_song)
    references songs(id_song);
    
alter table compossers add constraint fk_id_artist foreign key (id_artist)
	references artists(id_artist);

alter table compossers add constraint pk_song_artist primary key (id_song, id_artist);


insert into bands values(111, 'lala');
insert into bands values(112, 'dada');

insert into artists values(11, 111, 'si', 'nono', to_date('2000-NOV-11', 'YYYY-MM-DD'));
insert into artists values(12, 112, 'lili', 'hiho', to_date('2000-MAY-29', 'YYYY-MM-DD'));

insert into albums values(1, 'hhhhhhh', 2010, 111);
insert into albums values(2, 'ggggggg', 2010, 112);

insert into categories values(0001, 'categorie1');
insert into categories values(0002, 'categorie2');

insert into songs values(0011, 0001, 1, 'titlu1', 30, 'content1');
insert into songs values(0012, 0002, 2, 'titlu2', 80, 'content2');

insert into compossers values();
insert into compossers values();


-- SELECT [* | {column_name1[, column_name2[,...]]}]
-- FROM  TABLE_NAME
-- [WHERE conditions]



