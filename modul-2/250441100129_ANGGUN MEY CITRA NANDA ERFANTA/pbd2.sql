USE db_klinik;
1.
CREATE TABLE dokter (
    id_dokter INT PRIMARY KEY,
    nama_dokter VARCHAR(100),
    spesialisasi VARCHAR(100)
);
DESCRIBE dokter

CREATE TABLE pasien (
    id_pasien INT PRIMARY KEY,
    nama_pasien VARCHAR(100),
    tanggal_lahir DATE,
    no_telepon VARCHAR(15)
);
DESCRIBE pasien

CREATE TABLE rekam_medis (
    id_rekam INT PRIMARY KEY,
    id_pasien INT,
    id_dokter INT,
    tanggal_periksa DATE,
    diagnosis VARCHAR(255),
    FOREIGN KEY (id_pasien)
        REFERENCES pasien(id_pasien)
        ON DELETE RESTRICT,
    FOREIGN KEY (id_dokter)
        REFERENCES dokter(id_dokter)
        ON DELETE RESTRICT
);
DESCRIBE rekam_medis

2.
INSERT INTO dokter VALUES
(1,'Dr. Andi','Umum'),
(2,'Dr. Sinta','Gigi');

SELECT * FROM dokter;

INSERT INTO pasien VALUES
(1,'Budi','2000-05-10','081234567890'),
(2,'Ani','1998-09-21','082345678901');

SELECT * FROM pasien;

INSERT INTO rekam_medis VALUES
(1,1,1,'2026-04-01','Demam'),
(2,2,2,'2026-04-02','Sakit Gigi');

SELECT * FROM rekam_medis;

INSERT INTO rekam_medis VALUES
(3,1,99,'2026-04-03','Flu');

3.
UPDATE pasien
SET no_telepon='089876543210'
WHERE id_pasien=1;

SELECT * FROM pasien;

UPDATE dokter
SET spesialisasi='Penyakit Dalam'
WHERE id_dokter=1;

SELECT * FROM dokter;

SELECT * FROM rekam_medis;

DELETE FROM rekam_medis
WHERE id_rekam=2;

4.
DROP TABLE rekam_medis;

CREATE TABLE rekam_medis (
    id_rekam INT PRIMARY KEY,
    id_pasien INT,
    id_dokter INT,
    tanggal_periksa DATE,
    diagnosis VARCHAR(255),
    FOREIGN KEY (id_pasien)
        REFERENCES pasien(id_pasien)
        ON DELETE RESTRICT,
    FOREIGN KEY (id_dokter)
        REFERENCES dokter(id_dokter)
        ON DELETE CASCADE
);
DESCRIBE rekam_medis;

INSERT INTO rekam_medis VALUES
(1,1,1,'2026-04-01','Demam'),
(2,2,1,'2026-04-02','Batuk');

SELECT * FROM rekam_medis;

DELETE FROM dokter
WHERE id_dokter=1;

SELECT * FROM dokter;

SELECT * FROM rekam_medis;

5.
DROP TABLE rekam_medis;

DESCRIBE rekam_medis;

CREATE TABLE rekam_medis (
    id_rekam INT PRIMARY KEY,
    id_pasien INT,
    id_dokter INT,
    tanggal_periksa DATE,
    diagnosis VARCHAR(255),
    FOREIGN KEY (id_pasien)
        REFERENCES pasien(id_pasien)
        ON DELETE RESTRICT,
    FOREIGN KEY (id_dokter)
        REFERENCES dokter(id_dokter)
        ON DELETE RESTRICT
);


INSERT INTO rekam_medis
(id_rekam,id_pasien,id_dokter,tanggal_periksa,diagnosis)
VALUES
(1,1,2,'2026-04-01','Demam'),
(2,2,2,'2026-04-02','Flu');

SELECT * FROM rekam_medis;

TRUNCATE TABLE rekam_medis;

DESCRIBE rekam_medis;

TRUNCATE TABLE pasien;