INSERT INTO Perusahaan (IDPerusahaan, NamaPerusahaan, Alamat)
  VALUES ('P01', 'PT. Adi Buana', 'Sby'), ('P02', 'PT. Lestari', 'Sby'), ('P03', 'PT. Dwi Tunggal', 'Sby');
SELECT
  *
FROM Perusahaan;


INSERT INTO Keahlian (IDKeahlian, NamaKeahlian, Keterangan)
  VALUES ('Ke01', 'Programmer', '-'), ('Ke02', 'Desain', '-'), ('Ke03', 'Tukang Batu', '-');
SELECT
  *
FROM Keahlian;


INSERT INTO Divisi (IDDivisi, NamaDivisi, Bidang)
  VALUES ('D01', 'HRD', 'Riset')
INSERT INTO Divisi (IDDivisi, NamaDivisi, Bidang)
  VALUES ('D02', 'HRD', 'Kesejahteraan')
INSERT INTO Divisi (IDDivisi, NamaDivisi, Bidang)
  VALUES ('D03', 'Marketing', 'Customer')
SELECT
  *
FROM Divisi;


INSERT INTO Karyawan (IDKaryawan, Nama, Alamat, IDDivisi)
  VALUES ('K01', 'Rudi', 'Sby', 'D02')
INSERT INTO Karyawan (IDKaryawan, Nama, Alamat, IDDivisi)
  VALUES ('K02', 'Wati', 'Sby', 'D02')
INSERT INTO Karyawan (IDKaryawan, Nama, Alamat, IDDivisi)
  VALUES ('K03', 'Joko', 'Sby', 'D01')
INSERT INTO Karyawan (IDKaryawan, Nama, Alamat, IDDivisi)
  VALUES ('K04', 'Ridwan', 'Sby', 'D01')
INSERT INTO Karyawan (IDKaryawan, Nama, Alamat, IDDivisi)
  VALUES ('K05', 'Tuti', 'Sby', 'D03')
SELECT
  *
FROM Karyawan;


UPDATE Divisi
SET IDKaryawan = 'K04'
WHERE IDDivisi = 'D01'
UPDATE Divisi
SET IDKaryawan = 'K01'
WHERE IDDivisi = 'D02'
UPDATE Divisi
SET IDKaryawan = 'K05'
WHERE IDDivisi = 'D03'
SELECT
  *
FROM Divisi;


UPDATE Karyawan
SET IDKaryawanS = 'K01'
WHERE IDKaryawan = 'K02'
UPDATE Karyawan
SET IDKaryawanS = 'K04'
WHERE IDKaryawan = 'K03'
SELECT
  *
FROM Karyawan;


INSERT INTO Memiliki (IDKaryawan, IDKeahlian)
  VALUES ('K01', 'Ke02'), ('K01', 'Ke03'), ('K03', 'Ke02')
SELECT
  *
FROM Memiliki;


INSERT INTO Punya (IDPerusahaan, IDDivisi)
  VALUES ('P01', 'D01'), ('P01', 'D02'), ('P03', 'D01')
SELECT
  *
FROM Punya;


UPDATE Karyawan
SET TglLahir = '07-02-1997'
WHERE IDKaryawan = 'K01'
UPDATE Karyawan
SET TglLahir = '02-02-1998'
WHERE IDKaryawan = 'K02'
UPDATE Karyawan
SET TglLahir = '03-02-1997'
WHERE IDKaryawan = 'K03'
UPDATE Karyawan
SET TglLahir = '04-05-1998'
WHERE IDKaryawan = 'K04'
UPDATE Karyawan
SET TglLahir = '05-05-1997'
WHERE IDKaryawan = 'K05'
SELECT
  *
FROM karyawan

/*
 =====================================================================
                          Query Untuk Tugas Baru
 =====================================================================
 */
-- cek tabel-tabel yang sudah ada
SELECT * FROM karyawan
SELECT * FROM divisi
SELECT * FROM keahlian
SELECT * FROM perusahaan
SELECT * FROM memiliki
SELECT * FROM punya

-- cek PK tabel memiliki
SELECT
  *
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_NAME = 'memiliki'

-- tambah tabel punya dengan keterangan divisi
ALTER TABLE Punya ADD KetDivisi nchar(30)

-- tambah tabel memiliki dengna IDMemiliki dan thn sertif
ALTER TABLE memiliki ADD IDMemiliki char(10), TahunSertif int

-- isi data IDMemiliki dan Tahun Sertif untuk data lama
UPDATE memiliki
SET IDMemiliki = 'M001',
    TahunSertif = 2018
WHERE IDKaryawan = 'K01'
AND IDKeahlian = 'Ke02'
UPDATE memiliki
SET IDMemiliki = 'M002',
    TahunSertif = 2019
WHERE IDKaryawan = 'K01'
AND IDKeahlian = 'Ke03'
UPDATE memiliki
SET IDMemiliki = 'M003',
    TahunSertif = 2017
WHERE IDKaryawan = 'K03'
AND IDKeahlian = 'Ke02'

-- delete pk yg sebelumnya ada di tabel memiliki
ALTER TABLE memiliki DROP CONSTRAINT PK__Memiliki__BD100E970223F607

-- menambahkan constrain not null ke IDMemiliki
ALTER TABLE memiliki ALTER COLUMN IDMemiliki char(10) NOT NULL

-- menjadikan IDMemiliki sbg PK baru untuk tabel memiliki
ALTER TABLE memiliki ADD PRIMARY KEY (IDMemiliki)

-- menambahkan record2 baru shg ada 5 racord utk tiap tabel
INSERT INTO Divisi
  VALUES ('D04', 'Marketing', 'Data Analyst', 'K02')
INSERT INTO Divisi
  VALUES ('D05', 'IT', 'Web', 'K03')
INSERT INTO Keahlian
  VALUES ('Ke04', 'Visualisasi Data', '-')
INSERT INTO Keahlian
  VALUES ('Ke05', 'Database', '-')
INSERT INTO Perusahaan
  VALUES ('P04', 'PT. ABC', 'Trk')
INSERT INTO Perusahaan
  VALUES ('P05', 'PT. Sejahtera Bersama', 'PNG')
INSERT INTO Punya
  VALUES ('P04', 'D05', 'Divisi Baru')
INSERT INTO Punya
  VALUES ('P05', 'D04', 'Divisi Baru')
INSERT INTO Memiliki
  VALUES ('K04', 'Ke04', 'M004', 2010)
INSERT INTO Memiliki
  VALUES ('K03', 'Ke02', 'M005', 2020)

-- cek isi record
SELECT * FROM karyawan
SELECT * FROM divisi
SELECT * FROM keahlian
SELECT * FROM perusahaan
SELECT * FROM memiliki
SELECT * FROM punya