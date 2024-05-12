#ScalarSubquery IN
SELECT nm_pegawai
FROM pegawai
WHERE salary < (SELECT AVG(salary) FROM pegawai);

#Single Row Subquery = 
SELECT
	kd_dosen,nm_dosen
FROM dosen
WHERE
	kd_dosen = (SELECT kd_dosen FROM matakuliah where nama_mk='Praktikum Basis Data');

#Multiple Row Subquery IN
SELECT
	kd_dosen,nm_dosen
FROM dosen
WHERE
	kd_dosen in (SELECT kd_dosen FROM matakuliah);

#Multiple Row Subquery ANY
SELECT
	*
FROM matakuliah
WHERE
	sks = ANY (SELECT sks FROM matakuliah where semester=3);

#Multiple Row Subquery ALL
SELECT
	*
FROM matakuliah
WHERE
	sks > ALL (SELECT sks FROM matakuliah where semester=3);


#Corelated
SELECT p.kd_pegawai , p.nm_pegawai
FROM pegawai p
WHERE salary < (SELECT AVG(salary) FROM pegawai where kd_pegawai in (101,102));



#Insert Subquery di tabel pegawai2 jumlah kolomnyanya harus sama dengan tabel pegawai
INSERT INTO pegawai2 
(SELECT * FROM pegawai WHERE salary < 6000000);

SELECT * FROM pegawai2;

#Insert Subquery di tabel pegawai3 junlahnya harus 2 kolom
INSERT INTO pegawai3 
(SELECT nm_pegawai, alamat FROM pegawai WHERE salary < 6000000);

select * from pegawai3;



#Update Subquery -> update pegawai4 jika salary kurang dari 6000000 berdasarkan table pegawai
UPDATE pegawai4 
SET salary = 6000000
WHERE salary IN (SELECT salary FROM pegawai WHERE salary > 6000000 );

SELECT salary FROM pegawai WHERE salary > 6000000;

SELECT * FROM pegawai4;

#Delete Subquery
-- pemrogramanbasisdata.pegawai definition
DELETE FROM pegawai5 
WHERE salary NOT IN (SELECT salary FROM pegawai WHERE salary > 5000000 );

SELECT salary FROM pegawai WHERE salary > 5000000;

SELECT * FROM pegawai5;

