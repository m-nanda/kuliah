CREATE TABLE Karyawan (
  IDKaryawan char(10) NOT NULL PRIMARY KEY,
  Nama nchar(30),
  Alamat nchar(30),
  TglLahir date,
  IDDivisi char(10),
  IDKaryawanS char(10)
);

CREATE TABLE Divisi (
  IDDivisi char(10) NOT NULL PRIMARY KEY,
  NamaDivisi nchar(30),
  Bidang nchar(30),
  IDKaryawan char(10)
);

CREATE TABLE Perusahaan (
  IDPerusahaan char(10) NOT NULL PRIMARY KEY,
  NamaPerusahaan nchar(30),
  Alamat nchar(30)  
);

CREATE TABLE Keahlian (
  IDKeahlian char(10) NOT NULL PRIMARY KEY,
  NamaKeahlian nchar(30),
  Keterangan nchar(30)  
);

CREATE TABLE Memiliki (
  IDKaryawan char(10) NOT NULL,
  IDKeahlian char(10) NOT NULL,
  PRIMARY KEY (IDKaryawan,IDKeahlian)
);

CREATE TABLE Punya (
  IDPerusahaan char(10) NOT NULL,
  IDDivisi char(10) NOT NULL,
  PRIMARY KEY (IDPerusahaan, IDDivisi)
);