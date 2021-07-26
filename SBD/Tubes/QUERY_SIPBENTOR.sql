/*
Query Untuk Isian Awal
*/
-- Insert Karyawan
INSERT INTO Pegawai VALUES ('K01', 'Gunawan', 'Montir', 'Madura')
INSERT INTO Pegawai VALUES ('K02', 'Dwi', 'Montir', 'Solo')
INSERT INTO Pegawai VALUES ('K03', 'Cahyani', 'Kasir', 'Madiun')
INSERT INTO Pegawai VALUES ('K04', 'Bambang', 'Manajer', 'Sidoarjo')
INSERT INTO Pegawai VALUES ('K05', 'Mawar', 'Front Officer', 'Surabaya')
INSERT INTO Pegawai VALUES ('K06', 'Agung', 'Montir', 'Surabaya')
INSERT INTO Pegawai VALUES ('K07', 'Ahmad', 'Bagian Barang', 'Solo')
SELECT * FROM Pegawai
UPDATE Pegawai SET Alamat = 'Gresik' WHERE ID_Pegawai ='K04'
SELECT * FROM Pegawai

-- Insert Pelanggan
INSERT INTO Pelanggan VALUES (623001, 'Jason', 'Surabaya')
INSERT INTO Pelanggan VALUES (623002, 'Budi', 'Jakarta')
INSERT INTO Pelanggan VALUES (623003, 'Cahyo', 'Sidoarjo')
INSERT INTO Pelanggan VALUES (623004, 'El', 'Medan')
SELECT * FROM Pelanggan

--    Insert Motor
INSERT INTO Motor VALUES ('L0061MM', 'M3432345GH68F', 'Kawasaki Ninja RR', 500, 623003)
INSERT INTO Motor VALUES ('S1061GF', 'GH64M3432358F', 'Honda CBR', 250, 623001)
INSERT INTO Motor VALUES ('L4431AD', 'L94M6Y34335FH', 'Yamaha Vixion', 250, 623001)
INSERT INTO Motor VALUES ('AB1231AD', 'L94M6Y34335FH', 'Honda Vario', 125, 623004)
SELECT * FROM Motor
UPDATE Motor SET Kapasitas_Mesin = 150 WHERE Nomor_Plat = 'L4431AD'

-- Insert Beli
INSERT INTO Beli VALUES ('Beli01', '2021-01-07')
INSERT INTO Beli VALUES ('Beli02', '2021-01-07')
INSERT INTO Beli VALUES ('Beli03', '2021-01-08')

--		Insert List
INSERT INTO List VALUES ('Beli01', 'Sp01', 1)
INSERT INTO List VALUES ('Beli01', 'Sp02', 1)
INSERT INTO List VALUES ('Beli01', 'Sp03', 1)
INSERT INTO List VALUES ('Beli01', 'Sp04', 2)
INSERT INTO List VALUES ('Beli01', 'Sp05', 2)
INSERT INTO List VALUES ('Beli02', 'Sp02', 1)
INSERT INTO List VALUES ('Beli02', 'Sp04', 1)
INSERT INTO List VALUES ('Beli03', 'Sp02', 3)

-- Insert Sparepart
INSERT INTO Sparepart VALUES ('Sp01', 'Jok Standar', 'Kawasaki', 'Jok', 15, 50000)
INSERT INTO Sparepart VALUES ('Sp02', 'Aki MF', 'GS Astra', 'Aki', 5, 75000)
INSERT INTO Sparepart VALUES ('Sp03', 'Aki MF', 'Yuasa', 'Aki', 25, 70000)
INSERT INTO Sparepart VALUES ('Sp04', 'Ban Depan Tubeless', 'FDR', 'Ban', 25, 200000)
INSERT INTO Sparepart VALUES ('Sp05', 'Ban Belakang Tubeless', 'FDR', 'Ban', 25, 300000)
SELECT * FROM Sparepart

-- Insert Servis
INSERT INTO Servis VALUES ('Ser01', 'Ganti Oli', 50000)
INSERT INTO Servis VALUES ('Ser02', 'Perawatan Rutin', 75000)
INSERT INTO Servis VALUES ('Ser03', 'Ganti Ban', 20000)
INSERT INTO Servis VALUES ('Ser04', 'Ganti Aki', 20000)
UPDATE Servis SET Jenis_Servis = 'Ganti Ban Belakang' WHERE ID_Servis = 'Ser03'
SELECT * FROM Servis

--    Insert Melakukan
INSERT INTO Melakukan VALUES ('MSer01', 'L4431AD', 'Ser02', '10-01-2021')
INSERT INTO Melakukan VALUES ('MSer02', 'S1061GF', 'Ser02', '10-02-2021')
INSERT INTO Melakukan VALUES ('MSer03', 'L4431AD', 'Ser03', '10-03-2021')
INSERT INTO Melakukan VALUES ('MSer04', 'AB1231AD', 'Ser02', '01-03-2021')
INSERT INTO Melakukan VALUES ('MSer05', 'AB1231AD', 'Ser04', '01-03-2021')
INSERT INTO Melakukan VALUES ('MSer06', 'S1061GF', 'Ser04', '01-04-2021')
INSERT INTO Melakukan VALUES ('MSer07', 'S1061GF', 'Ser04', '01-05-2021')
UPDATE Melakukan SET Tgl_Servis = '01-01-2021' WHERE ID_Melakukan = 'MSer01'
UPDATE Melakukan SET Tgl_Servis = '01-02-2021' WHERE ID_Melakukan = 'MSer02'
UPDATE Melakukan SET Tgl_Servis = '01-03-2021' WHERE ID_Melakukan = 'MSer03'
SELECT * FROM Melakukan
SELECT * FROM Servis

--    Insert Membutuhkan
INSERT INTO Membutuhkan VALUES ('MB01', 'Ser03', 'Sp05')
INSERT INTO Membutuhkan VALUES ('MB02', 'Ser04', 'Sp02')
INSERT INTO Membutuhkan VALUES ('MB03', 'Ser04', 'Sp03')
INSERT INTO Membutuhkan VALUES ('MB04', 'Ser04', 'Sp03')
SELECT * FROM Membutuhkan
SELECT * FROM Sparepart

--    Insert Mengerjakan
INSERT INTO Mengerjakan VALUES ('Kr01', 'K01', 'Ser02', '2021-01-01')
INSERT INTO Mengerjakan VALUES ('Kr02', 'K02', 'Ser02', '2021-01-02')
INSERT INTO Mengerjakan VALUES ('Kr03', 'K01', 'Ser03', '2021-01-03')
INSERT INTO Mengerjakan VALUES ('Kr04', 'K02', 'Ser02', '2021-01-03')
INSERT INTO Mengerjakan VALUES ('Kr05', 'K01', 'Ser04', '2021-01-03')
INSERT INTO Mengerjakan VALUES ('Kr06', 'K02', 'Ser04', '2021-01-04')
INSERT INTO Mengerjakan VALUES ('Kr07', 'K01', 'Ser04', '2021-01-05')

SELECT * FROM Pelanggan
SELECT * FROM Motor
SELECT * FROM Membutuhkan
SELECT * FROM Servis
SELECT * FROM Melakukan
SELECT * FROM Mengerjakan
SELECT * FROM Pegawai
SELECT * FROM Sparepart
SELECT * FROM Beli
SELECT * FROM List

--------------------------------------------------------------------------------------

/*
=======================================================================================
					Query Case-Case yang Mungkin Sesuai Tugas Awal
=======================================================================================
*/

-- 2. Menangani transaksi pembelian sparepart
-- 2.1 Cek Stok & Harga
SELECT * FROM Sparepart WHERE Jenis_Sparepart = 'Aki'
-- 2.2 Insert ke tabel Beli
INSERT INTO Beli VALUES ('B01', 'Sp03', 3, '2021-01-12')
-- 2.2 Update tabel Sparepart
UPDATE Sparepart SET Stok = Stok - 3 WHERE ID_Sparepart = 'Sp03'
-- 2.3 Hasil akhir
SELECT * FROM Sparepart WHERE Jenis_Sparepart = 'Aki'

-- Nyari semua motor jason yang pernah di servis
SELECT P.Nama_Pelanggan Nama, M.Nomor_Plat No_Plat, M.Nomor_Mesin, M.Merk_Motor Merk, M.Kapasitas_Mesin CC
FROM Pelanggan P INNER JOIN Motor M ON P.NIK = M.NIK
WHERE P.Nama_Pelanggan = 'Jason'

-- Nyari semua riwayat servis motor jason
SELECT 
	P.Nama_Pelanggan Nama, 
	M.Nomor_Plat No_Plat, 
	M.Nomor_Mesin, 
	M.Merk_Motor Merk, 
	M.Kapasitas_Mesin CC,
	Mel.Tgl_Servis,
	S.Jenis_Servis,
	S.Biaya_Servis
FROM Pelanggan P 
	JOIN Motor M ON P.NIK = M.NIK
	JOIN Melakukan Mel ON Mel.Nomor_Plat = M.Nomor_Plat
	JOIN Servis S ON S.ID_Servis = Mel.ID_Melakukan
WHERE P.Nama_Pelanggan = 'Jason'

--  4.1 Historis tracking perawatan kendaraan
SELECT 
	P.Nama_Pelanggan, 
	Mel.Nomor_Plat, 
	M.Merk_Motor Merk, 
	M.Nomor_Mesin, 
	M.Kapasitas_Mesin CC, 
	Mel.Tgl_Servis, 
	S.Jenis_Servis, 
	Pg.Nama_Pegawai Montir,
	CONCAT('Rp.', S.Biaya_Servis) Biaya_Servis,
	CASE 
		WHEN Sp.Nama_Sparepart IS NOT NULL THEN Sp.Nama_Sparepart
		ELSE '-'
	END Nama_Sparepart,
	CASE 
		WHEN Sp.Merk_Sparepart IS NOT NULL THEN Sp.Merk_Sparepart
		ELSE '-'
	END Merk,	
	CASE
		WHEN Sp.Harga IS NOT NULL THEN CONCAT('Rp.', Sp.Harga) 
		ELSE CONCAT('Rp.', 0) 
	END Harga_Sparepart,	 
	CASE 
		WHEN Sp.Harga IS NOT NULL THEN CONCAT('Rp.', S.Biaya_Servis+Sp.Harga)
		ELSE CONCAT('Rp.', S.Biaya_Servis) 		
	END Total_Biaya	
FROM (Pelanggan P
	INNER JOIN Motor M ON M.NIK = P.NIK
	INNER JOIN Melakukan Mel ON Mel.Nomor_Plat = M.Nomor_Plat
	INNER JOIN Servis S ON S.ID_Servis = Mel.ID_Servis
	LEFT JOIN Membutuhkan Mb ON (S.ID_Servis = Mb.ID_Servis AND Mel.Tgl_Servis = Mb.Tgl_Butuh)
	LEFT JOIN Sparepart Sp ON Mb.ID_Sparepart = Sp.ID_Sparepart)	
	INNER JOIN Mengerjakan Mr ON (S.ID_Servis = Mr.ID_Servis AND Mel.Tgl_Servis = Mr.Tgl_Pengerjaan)
	INNER JOIN Pegawai Pg ON Mr.ID_Pegawai = Pg.ID_Pegawai
-- Search By NIK
WHERE P.NIK = 623003 OR P.NIK = 623001 OR P.NIK = 623004
-- Search By Nama
WHERE P.Nama_Pelanggan = 'El'
-- Search By No Plat
WHERE Mel.Nomor_Plat = 'L4431AD'

--  4.2 Historis tracking pekerjaan montir
SELECT
	Pg.Nama_Pegawai,
	S.Jenis_Servis,
	P.Nama_Pelanggan Customer,
	M.Nomor_Plat,
	Mr.Tgl_Pengerjaan,
	CASE
		WHEN Sp.Nama_Sparepart IS NOT NULL THEN Sp.Nama_Sparepart
		ELSE '-'
	END Sparepart_Yg_Diganti,
	CASE
		WHEN Sp.Merk_Sparepart IS NOT NULL THEN Sp.Merk_Sparepart
		ELSE '-'
	END Merk
FROM (Pegawai Pg
	INNER JOIN Mengerjakan Mr ON Mr.ID_Pegawai = Pg.ID_Pegawai
	INNER JOIN Servis S ON S.ID_Servis = Mr.ID_Servis
	INNER JOIN Melakukan Mel ON (Mel.ID_Servis = S.ID_Servis AND Mr.Tgl_Pengerjaan = Mel.Tgl_Servis)
	INNER JOIN Motor M ON M.Nomor_Plat = Mel.Nomor_Plat
	INNER JOIN Pelanggan P ON P.NIK=M.NIK)
	LEFT JOIN Membutuhkan Mb ON (S.ID_Servis = Mb.ID_Servis AND Mr.Tgl_Pengerjaan = Mb.Tgl_Butuh)
	LEFT JOIN Sparepart Sp ON Mb.ID_Sparepart = Sp.ID_Sparepart
WHERE Pg.ID_Pegawai = 'K06' OR Pg.ID_Pegawai = 'K02' OR Pg.ID_Pegawai = 'K01'


-- 5.1 Melakukan searching untuk melihat ketersediaan sparepart
SELECT * FROM Sparepart
WHERE Jenis_Sparepart = 'Aki'

-- 5.2 List Pembelian
SELECT 
	Bl.ID_Beli,
	Bl.Tgl_Beli_Sparepart Tgl_Beli,
	Sp.Nama_Sparepart,
	Sp.Merk_sparepart,
	L.Jml,
	Sp.Harga,
	L.Jml*Sp.Harga Total_Harga
FROM Beli Bl
	INNER JOIN List L ON L.ID_Beli = Bl.ID_Beli
	INNER JOIN Sparepart Sp ON Sp.ID_Sparepart = L.ID_Sparepart
WHERE Bl.ID_Beli = 'Beli01'
/*
=======================================================================================
								CRUD Tabel-Tabel Master
=======================================================================================
*/
 -- CRUD Pelanggan
 -- Tombol Tambah (INSERT)
 INSERT INTO Pelanggan VALUES (623005, 'Joko', 'Gresik')
 -- Tombol Edit (UPDATE)
 UPDATE Pelanggan SET Nama_Pelanggan = 'Susi' WHERE NIK = 623005
 UPDATE Pelanggan SET Alamat_Pelanggan = 'Lamongan' WHERE NIK = 623005
 UPDATE Pelanggan SET NIK = 623006 WHERE NIK = 623005
 -- Tombol Delete (DELETE)
 DELETE FROM Pelanggan WHERE NIK=623006
 SELECT * FROM Pelanggan 

 -- CRUD Motor
 /*
 Note:
 Alurnya, pastiin dulu pelanggan nya udah ke daftar. kalau belum terdaftar gabisa nambah motor.
 Bisa dikasih pop up notif misal mau nambah motor tapi blm terdaftar di pelanggan.
 */
 -- Tombol Tambah (INSERT)
 INSERT INTO Motor VALUES ('N8976FF', 'LK8098NH654D4', 'Yamaha Mio', 110, 623002)
 -- Tombol Edit (Update)
 UPDATE Motor SET Nomor_Mesin = 'LK8098NH654D3' WHERE Nomor_Plat = 'N8976FF'
 UPDATE Motor SET Merk_Motor = 'Honda Beat' WHERE Nomor_Plat = 'N8976FF'
 UPDATE Motor SET Kapasitas_Mesin = 125 WHERE Nomor_Plat = 'N8976FF'
 UPDATE Motor SET Nomor_Plat = 'M9976GF' WHERE Nomor_Plat = 'N8976FF'
 /*
 Note:
 Misal ada kasus yang agak aneh, karena motor dijual-> pemiliknya ganti, update-annya:
 */
 UPDATE Motor SET NIK = 623004 WHERE Nomor_Plat = 'N8976FF'
 -- Tombol Hapus (Delete)
 DELETE FROM Motor WHERE Nomor_Plat = 'M9976GF'
 SELECT * FROM Motor

 -- CRUD Pegawai
 -- Tombol Tambah (INSERT)
 INSERT INTO Pegawai VALUES ('K08', 'Mega', 'Front Officer', 'Tulungagung')
 -- Tombol Edit (UPDATE)
 UPDATE Pegawai SET Nama_Pegawai='Megi' WHERE ID_Pegawai = 'K08'
 UPDATE Pegawai SET Jabatan='Kasir' WHERE ID_Pegawai = 'K08'
 UPDATE Pegawai SET Alamat='Surabaya' WHERE ID_Pegawai = 'K08'
 UPDATE Pegawai SET ID_Pegawai='K09' WHERE ID_Pegawai = 'K08'
 -- Tombol Hapus (DELETE)
 DELETE FROM Pegawai WHERE ID_Pegawai = 'K09'
 SELECT * FROM Pegawai
 -- Historis tracking pekerjaan montir
SELECT
	Pg.Nama_Pegawai,
	S.Jenis_Servis,
	P.Nama_Pelanggan Customer,
	M.Nomor_Plat,
	Mr.Tgl_Pengerjaan,
	CASE
		WHEN Sp.Nama_Sparepart IS NOT NULL THEN Sp.Nama_Sparepart
		ELSE '-'
	END Sparepart_Yg_Diganti,
	CASE
		WHEN Sp.Merk_Sparepart IS NOT NULL THEN Sp.Merk_Sparepart
		ELSE '-'
	END Merk
FROM (Pegawai Pg
	INNER JOIN Mengerjakan Mr ON Mr.ID_Pegawai = Pg.ID_Pegawai
	INNER JOIN Servis S ON S.ID_Servis = Mr.ID_Servis
	INNER JOIN Melakukan Mel ON (Mel.ID_Servis = S.ID_Servis AND Mr.Tgl_Pengerjaan = Mel.Tgl_Servis)
	INNER JOIN Motor M ON M.Nomor_Plat = Mel.Nomor_Plat
	INNER JOIN Pelanggan P ON P.NIK=M.NIK)
	LEFT JOIN Membutuhkan Mb ON (S.ID_Servis = Mb.ID_Servis AND Mr.Tgl_Pengerjaan = Mb.Tgl_Butuh)
	LEFT JOIN Sparepart Sp ON Mb.ID_Sparepart = Sp.ID_Sparepart
WHERE Sp.Merk_Sparepart = 'Yuasa'
--WHERE Pg.ID_Pegawai = 'K06' OR Pg.ID_Pegawai = 'K02' OR Pg.ID_Pegawai = 'K01'

 -- CRUD Sparepart
 -- Tombol Tambah (INSERT)
 INSERT INTO Sparepart VALUES ('Sp06', 'Spion Standar', 'Yamaha', 'Kaca Spion', 30, 100000)
 -- Tombol Edit (UPDATE)
 UPDATE Sparepart SET Nama_Sparepart='Spion Biasa' WHERE ID_Sparepart='Sp06'
 UPDATE Sparepart SET Merk_Sparepart='Suzuki' WHERE ID_Sparepart='Sp06'
 UPDATE Sparepart SET Jenis_Sparepart='Spion' WHERE ID_Sparepart='Sp06'
 UPDATE Sparepart SET Stok=50 WHERE ID_Sparepart='Sp06'
 UPDATE Sparepart SET Harga=110000 WHERE ID_Sparepart='Sp06'
  /*
 Note:
 Misal ada kasus yang agak aneh, Ganti ID Sparepartnya
 (Tapi untuk semua tabel tidak disarankan bisa ganti ID. Kecuali Input ID nya manual
 */
 UPDATE Sparepart SET ID_Sparepart='Sp07' WHERE ID_Sparepart='Sp06'
 -- Tombol Hapus (DELETE)
 DELETE FROM Sparepart WHERE ID_Sparepart = 'Sp07'
 SELECT * FROM Sparepart


/*
=======================================================================================
							QUERY DAN ALGORITMA UNTUK TRANSAKSI
=======================================================================================
*/ 

/*
A.TRANSAKSI SERVIS MOTOR
 Alurnya (Algoritma), kalau ada pembelian sparepart:
	1. Siapkan data/info awal yang diperlukan:
		1) Cek Udah Terdaftar & Pernah Servis Belum
			> Kalo belum tambah ke tabel "Pelanggan" dan "Motor" 
			  (Karena perlu data nomor_plat)
			> Kalo sudah langsung ke langkah berikutnya
		2) Mau Servis apa
		3) Perlu ganti sparepart / tidak 
			> Jika ya: sparepartnya apa terus cek ketersediaan dari stok 
			  atau variasi jenis + harga (karena perlu id_sparepart)
			> Jika tidak langsung ke langkah berikutnya
		4) Siapkan info tgl juga.
	2. INSERT Record baru ke Tabel "Melakukan"
	3. INSERT Record baru ke Tabel "Mengerjakan"
	4. Jika tadi perlu pergantian Sparepart
		1) INSERT Record baru ke Tabel "Membutuhkan"
		2) UPDATE Stok Sparepart	
	5. Hitung Total Harga
*/
 -- Contoh Pengecekan manual, kalo di gui langsung di interfacenya
SELECT * FROM Pelanggan WHERE NIK = 623003
SELECT * FROM Motor WHERE Nomor_Plat = 'L0061MM'
SELECT * FROM Sparepart WHERE Jenis_Sparepart = 'Aki'
SELECT * FROM Pegawai
SELECT * FROM Melakukan
SELECT * FROM Mengerjakan
SELECT * FROM Membutuhkan
-- 2. INSERT Record baru ke Tabel "Melakukan"
INSERT INTO Melakukan VALUES ('MSer08', 'L0061MM', 'Ser04', '2021-01-15')
-- 3. INSERT Record baru ke Tabel "Mengerjakan"
INSERT INTO Mengerjakan VALUES ('Kr08', 'K06', 'Ser04', '2021-01-15')
-- 4. Jika tadi perlu pergantian Sparepart
INSERT INTO Membutuhkan VALUES ('Mb05', 'Ser04', 'Sp03', '2021-01-15')
UPDATE Sparepart SET Stok = Stok - 1 WHERE ID_Sparepart = 'Sp03'
-- 5. Untuk Hitung Total Harga
SELECT S.Biaya_Servis, Sp.Harga Harga_Sparepart, S.Biaya_Servis+Sp.Harga Total_Harga
FROM Melakukan Mel	
	INNER JOIN Servis S ON S.ID_Servis = Mel.ID_Servis
	INNER JOIN Membutuhkan Mb ON Mb.ID_Servis = S.ID_Servis
	INNER JOIN Sparepart Sp ON Sp.ID_Sparepart = Mb.ID_Sparepart
WHERE Mel.ID_Melakukan = 'MSer08' AND Mel.Tgl_Servis=Mb.Tgl_Butuh

--  Cek Historis tracking perawatan kendaraan
SELECT 
	P.Nama_Pelanggan, 
	Mel.Nomor_Plat, 
	M.Merk_Motor Merk, 
	M.Nomor_Mesin, 
	M.Kapasitas_Mesin CC, 
	Mel.Tgl_Servis, 
	S.Jenis_Servis, 
	Pg.Nama_Pegawai Montir,
	CONCAT('Rp.', S.Biaya_Servis) Biaya_Servis,
	CASE 
		WHEN Sp.Nama_Sparepart IS NOT NULL THEN Sp.Nama_Sparepart
		ELSE '-'
	END Nama_Sparepart,
	CASE 
		WHEN Sp.Merk_Sparepart IS NOT NULL THEN Sp.Merk_Sparepart
		ELSE '-'
	END Merk,	
	CASE
		WHEN Sp.Harga IS NOT NULL THEN CONCAT('Rp.', Sp.Harga) 
		ELSE CONCAT('Rp.', 0) 
	END Harga_Sparepart,	 
	CASE 
		WHEN Sp.Harga IS NOT NULL THEN CONCAT('Rp.', S.Biaya_Servis+Sp.Harga)
		ELSE CONCAT('Rp.', S.Biaya_Servis) 		
	END Total_Biaya	
FROM (Pelanggan P
	INNER JOIN Motor M ON M.NIK = P.NIK
	INNER JOIN Melakukan Mel ON Mel.Nomor_Plat = M.Nomor_Plat
	INNER JOIN Servis S ON S.ID_Servis = Mel.ID_Servis
	LEFT JOIN Membutuhkan Mb ON (S.ID_Servis = Mb.ID_Servis AND Mel.Tgl_Servis = Mb.Tgl_Butuh)
	LEFT JOIN Sparepart Sp ON Mb.ID_Sparepart = Sp.ID_Sparepart)	
	INNER JOIN Mengerjakan Mr ON (S.ID_Servis = Mr.ID_Servis AND Mel.Tgl_Servis = Mr.Tgl_Pengerjaan)
	INNER JOIN Pegawai Pg ON Mr.ID_Pegawai = Pg.ID_Pegawai
WHERE Mel.ID_Melakukan = 'MSer08'
-- Search By NIK
WHERE P.NIK = 623003 OR P.NIK = 623001 OR P.NIK = 623004

-- Delete Sampel Transaksi yang barusan
DELETE FROM Melakukan WHERE ID_Melakukan='MSer08'
DELETE FROM Mengerjakan WHERE ID_Pengerjaan='Kr08'
DELETE FROM Membutuhkan WHERE ID_Membutuhkan='Mb05'
UPDATE Sparepart SET Stok = Stok + 1 WHERE ID_Sparepart = 'Sp03'


/*
B.TRANSAKSI PEMBELIAN SPAREPART
 Alurnya (Algoritma), kalau ada pembelian sparepart:
 	1. Cek Stok Dulu
	2. INSERT data pembelian ke tabel "Beli"
	3. INSERT data ke tabel "List"
	4. UPDATE Stok di tabel "Sparepart"
	5. Tampilin Harga Totalnya	
*/
 -- Contoh Pengecekan manual, kalo di gui langsung di interfacenya
SELECT * FROM Sparepart -- WHERE Jenis_Sparepart = 'Aki'
SELECT * FROM Beli
SELECT * FROM List
-- 2. INSERT Record baru ke Tabel "Beli"
INSERT INTO Beli VALUES ('Beli04', '2021-01-10')
-- 3. INSERT Record baru ke Tabel "List"
INSERT INTO List VALUES ('Beli04', 'Sp03', 1)
INSERT INTO List VALUES ('Beli04', 'Sp02', 2)
INSERT INTO List VALUES ('Beli04', 'Sp05', 3)
INSERT INTO List VALUES ('Beli04', 'Sp01', 4)
-- 4. UPDATE stok Sparepart
UPDATE Sparepart Set Stok = Stok - 1 WHERE ID_Sparepart = 'Sp03'
UPDATE Sparepart Set Stok = Stok - 2 WHERE ID_Sparepart = 'Sp02'
UPDATE Sparepart Set Stok = Stok - 3 WHERE ID_Sparepart = 'Sp05'
UPDATE Sparepart Set Stok = Stok - 4 WHERE ID_Sparepart = 'Sp01'
-- 5. Total Harga
SELECT SUM(L.Jml*Sp.Harga) Total_Harga
FROM List L INNER JOIN Sparepart Sp ON L.ID_Sparepart = Sp.ID_Sparepart
WHERE L.ID_Beli='Beli04'

-- List Pembelian
SELECT 
	Bl.ID_Beli,
	Bl.Tgl_Beli_Sparepart Tgl_Beli,
	Sp.Nama_Sparepart,
	Sp.Merk_sparepart,
	L.Jml,
	Sp.Harga,
	L.Jml*Sp.Harga Total_Harga
FROM Beli Bl
	INNER JOIN List L ON L.ID_Beli = Bl.ID_Beli
	INNER JOIN Sparepart Sp ON Sp.ID_Sparepart = L.ID_Sparepart
WHERE Bl.ID_Beli = 'Beli04'

-- Delete Sampel Transaksi yang barusan
DELETE FROM List WHERE ID_Beli='Beli04'
DELETE FROM Beli WHERE ID_Beli='Beli04'
UPDATE Sparepart SET Stok = Stok + 1 WHERE ID_Sparepart = 'Sp03'
UPDATE Sparepart SET Stok = Stok + 2 WHERE ID_Sparepart = 'Sp02'
UPDATE Sparepart SET Stok = Stok + 3 WHERE ID_Sparepart = 'Sp05'
UPDATE Sparepart SET Stok = Stok + 4 WHERE ID_Sparepart = 'Sp01'

SELECT * FROM Pelanggan WHERE CONCAT (NIK,Nama_Pelanggan,Alamat_Pelanggan) LIKE '%a%'
