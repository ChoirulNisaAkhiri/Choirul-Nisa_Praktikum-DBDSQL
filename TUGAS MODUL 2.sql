create database penjualanDVD;

create table penjualanDVD.MOVIE (
  KODE_DVD VARCHAR(10) not null,
  JUDUL VARCHAR(60) null,
  HARGA_SEWA DOUBLE null,
  DENDA DOUBLE null,
  TAHUN_RILIS smallint unsigned null,
  primary key(KODE_DVD)
);

create table penjualanDVD.GENRE (
  ID_GENRE smallint unsigned not null,
  GENRE VARCHAR(45) null,
  primary key(ID_GENRE)
);

create table penjualanDVD.GENRE_MOVIE (
  MOVIE_KODE_DVD VARCHAR(10) not null,
  GENRE_ID_GENRE smallint unsigned not null,
  primary key(MOVIE_KODE_DVD,
GENRE_ID_GENRE),
  index GENRE_MOVIE_FKIndex1(GENRE_ID_GENRE),
  index GENRE_MOVIE_FKIndex2(MOVIE_KODE_DVD)
);

create table penjualanDVD.TRANSAKSI (
  TANGGAL_SEWA DATE not null,
  MOVIE_KODE_DVD VARCHAR(10) not null,
  PELANGGAN_KODE_PELANGGAN VARCHAR(10) not null,
  TANGGAL_WAJIB_KEMBALI DATE null,
  TANGGAL_REALISASI_KEMBALI DATE null,
  primary key(TANGGAL_SEWA,
MOVIE_KODE_DVD,
PELANGGAN_KODE_PELANGGAN),
  index TRANSAKSI_FKIndex1(PELANGGAN_KODE_PELANGGAN),
  index TRANSAKSI_FKIndex2(MOVIE_KODE_DVD)
);

create table penjualanDVD.PELANGGAN (
  KODE_PELANGGAN VARCHAR(10) not null,
  KELURAHAN_ID_KELURAHAN smallint unsigned not null,
  NAMA VARCHAR(45) null,
  ALAMAT VARCHAR(60) null,
  JENIS_KELAMIN CHAR(1) null,
  primary key(KODE_PELANGGAN),
  index PELANGGAN_FKIndex1(KELURAHAN_ID_KELURAHAN)
);

create table penjualanDVD.KONTAK_PELANGGAN (
  PELANGGAN_KODE_PELANGGAN VARCHAR(10) not null,
  NO_HP VARCHAR(25) null,
  index KONTAK_PELANGGAN_FKIndex1(PELANGGAN_KODE_PELANGGAN),
  unique index KONTAK_PELANGGAN_index2315(NO_HP)
);

create table penjualanDVD.KELURAHAN (
  ID_KELURAHAN smallint unsigned not null,
  KECAMATAN_ID_KECAMATAN smallint unsigned not null,
  KELURAHAN VARCHAR(45) null,
  primary key(ID_KELURAHAN),
  index KELURAHAN_FKIndex1(KECAMATAN_ID_KECAMATAN)
);

create table penjualanDVD.KECAMATAN (
  ID_KECAMATAN smallint unsigned not null,
  KECAMATAN VARCHAR(45) null,
  primary key(ID_KECAMATAN)
);

alter table penjualanDVD.PELANGGAN 
  add constraint CK_JENIS_KELAMIN check (JENIS_KELAMIN in ('P', 'L'));

alter table penjualanDVD.MOVIE 
  modify TAHUN_RILIS year(4);