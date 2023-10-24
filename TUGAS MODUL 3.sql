create database UNIVERSITAS;

use UNIVERSITAS;

create table FAKULTAS(
	ID_FAKULTAS smallint not null primary key,
	FAKULTAS VARCHAR (45)
);

create table JURUSAN(
	ID_JURUSAN smallint not null primary key,
	ID_FAKULTAS smallint,
	JURUSAN VARCHAR (45),
	foreign key (ID_FAKULTAS) references FAKULTAS (ID_FAKULTAS)
);

create table STRATA(
	ID_STRATA smallint not null primary key,
	SINGKAT VARCHAR (10),
	STRATA VARCHAR (45)
);

create table PROGRAM_STUDI(
	ID_PROGRAM_STUDI smallint not null primary key,
	ID_STRATA smallint,
	ID_JURUSAN smallint,
	PROGRAM_STUDI VARCHAR (60),
	foreign key (ID_STRATA) references STRATA (ID_STRATA),
	foreign key (ID_JURUSAN) references JURUSAN (ID_JURUSAN)
);

create table SELEKSI_MASUK(
	ID_SELEKSI_MASUK smallint not null primary key,
	SINGKAT VARCHAR (12),
	SELEKSI_MASUK VARCHAR (45)
);

alter table seleksi_masuk 
drop column SELEKSI_MASUK;

alter table seleksi_masuk 
add column SELEKSI_MASUK VARCHAR(60);

create table MAHASISWA (
	NIM VARCHAR (15) not null primary key,
	ID_SELEKSI_MASUK smallint,
	ID_PROGRAM_STUDI smallint,
	NAMA VARCHAR (45),
	ANGKATAN smallint,
	TGL_LAHIR date,
	KOTA_LAHIR VARCHAR (60),
	JENIS_KELAMIN CHAR(1),
	constraint chk_JENIS_KELAMIN check (JENIS_KELAMIN in ('P', 'L')), 
	foreign key (ID_SELEKSI_MASUK) references SELEKSI_MASUK (ID_SELEKSI_MASUK),
	foreign key (ID_PROGRAM_STUDI) references PROGRAM_STUDI (ID_PROGRAM_STUDI)
);

select
	*
from
	FAKULTAS;

insert
	into
	FAKULTAS(ID_FAKULTAS,
	FAKULTAS)
values (1,
'Ekonomi & Bisnis');

insert
	into
	FAKULTAS (ID_FAKULTAS,
	FAKULTAS)
values (2,
'Ilmu Komputer');

select
	*
from
	JURUSAN;

insert
	into
	JURUSAN (ID_JURUSAN,
	ID_FAKULTAS,
	JURUSAN)
values (21,
2,
'Informatika');

insert
	into
	JURUSAN (ID_JURUSAN,
	ID_FAKULTAS,
	JURUSAN)
values (22,
2,
'Sistem Informasi');

insert
	into
	JURUSAN (ID_JURUSAN,
	ID_FAKULTAS,
	JURUSAN)
values (23,
2,
'Teknik Komputer');

select
	*
from
	strata ;

insert
	into
	strata (ID_STRATA,
	SINGKAT,
	strata)
values (1,
'D1',
'Diploma');

insert
	into
	strata (ID_STRATA,
	SINGKAT,
	strata)
values (2,
'S1',
'Sarjana');

insert
	into
	strata (ID_STRATA,
	SINGKAT,
	strata)
values (3,
'S2',
'Magister');

select
	*
from
	PROGRAM_STUDI;

insert
	into
	PROGRAM_STUDI (ID_PROGRAM_STUDI,
	ID_STRATA,
	ID_JURUSAN,
	PROGRAM_STUDI)
values (211,
2,
21,
'Teknik Informatika');

insert
	into
	PROGRAM_STUDI (ID_PROGRAM_STUDI,
	ID_STRATA,
	ID_JURUSAN,
	PROGRAM_STUDI)
values (212,
2,
21,
'Teknik Komputer');

insert
	into
	PROGRAM_STUDI (ID_PROGRAM_STUDI,
	ID_STRATA,
	ID_JURUSAN,
	PROGRAM_STUDI)
values (219,
3,
21,
'Magister Ilmu Komputer');

select
	*
from
	seleksi_masuk ;

insert
	into
	seleksi_masuk (id_seleksi_masuk,
	SINGKAT,
	SELEKSI_MASUK)
values (1,
'SNMPTN',
'SELEKSI NASIONAL MASUK PERGURUAN TINGGI NEGERI');

insert
	into
	seleksi_masuk (id_seleksi_masuk,
	SINGKAT,
	SELEKSI_MASUK)
values (2,
'SBMPTN',
'SELEKSI BERSAMA MASUK PERGURUAN TINGGI NEGERI');

select
	*
from
	mahasiswa ;

insert
	into
	mahasiswa (NIM,
	ID_SELEKSI_MASUK,
	ID_PROGRAM_STUDI,
	NAMA,
	ANGKATAN ,
	TGL_LAHIR,
	KOTA_LAHIR,
	JENIS_KELAMIN)
values ('155150400',
1,
211,
'JONI',
2015,
'1997/1/1',
'Malang',
'P');

insert
	into
	mahasiswa (NIM,
	ID_SELEKSI_MASUK,
	ID_PROGRAM_STUDI,
	NAMA,
	ANGKATAN ,
	TGL_LAHIR,
	KOTA_LAHIR,
	JENIS_KELAMIN)
values ('155150401',
2,
212,
'JONO',
2015,
'1997/10/2',
'Situbondo',
'L');