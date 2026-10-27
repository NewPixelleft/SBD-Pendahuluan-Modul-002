
--CC Creating table 'penerbit'
CREATE TABLE penerbit(
	id_penerbit INT NOT NULL PRIMARY KEY,
	nama		VARCHAR(100) NOT NULL,
	kota		VARCHAR(100) NOT NULL,
	no_telepon	VARCHAR(13) NOT NULL
);

--CC Creating table 'buku'
CREATE TABLE buku(
	id_buku		CHAR(6) NOT NULL PRIMARY KEY,
	isbn		CHAR(13) NOT NULL,
	judul		VARCHAR(100) NOT NULL,
	tahun_terbit	CHAR(4) NOT NULL,
	jumlah_halaman	INT NOT NULL,
	stok			INT NOT NULL,
	penerbit_id_penerbit INT NOT NULL
);

	--RR Initiating relation 'buku' with 'penerbit'
	ALTER TABLE buku
		ADD CONSTRAINT fk_buku_penerbit
		FOREIGN KEY (penerbit_id_penerbit)
		REFERENCES	penerbit(id_penerbit)
		ON UPDATE CASCADE
		ON DELETE CASCADE;

--CC Create table 'penulis'
CREATE TABLE penulis(
	id_penulis	INT NOT NULL PRIMARY KEY,
	nama		VARCHAR(100) NOT NULL,
	negara_asal	VARCHAR(100) NOT NULL
);

--CCC Create Connector Table 'buku_penulis'
CREATE TABLE buku_penulis(
	buku_id_buku		CHAR(6) NOT NULL,
	penulis_id_penulis	INT NOT NULL
);

	--RR Initiating Connector Table 'buku_penulis' Relations
	ALTER TABLE buku_penulis
		ADD CONSTRAINT pk_buku_penulis PRIMARY KEY (buku_id_buku, penulis_id_penulis);

	ALTER TABLE buku_penulis
		ADD CONSTRAINT fk_connector_buku
			FOREIGN KEY(buku_id_buku) REFERENCES buku(id_buku)
			ON UPDATE CASCADE
			ON DELETE CASCADE;
	
	ALTER TABLE buku_penulis
		ADD CONSTRAINT fk_connector_penulis
			FOREIGN KEY(penulis_id_penulis) 
			REFERENCES penulis(id_penulis)
			ON UPDATE CASCADE
			ON DELETE CASCADE;

--CC Create Table 'anggota'
CREATE TABLE anggota(
	no_anggota		CHAR(10) NOT NULL PRIMARY KEY,
	nama			VARCHAR(100) NOT NULL,
	tanggal_lahir	DATE NOT NULL,
	alamat			VARCHAR(100) NOT NULL,
	no_telepon		VARCHAR(13) NOT NULL,
	jenis_kelamin	CHAR(1) NOT NULL,
	status_anggota	VARCHAR(50) NOT NULL
);

--CC Create Table 'petugas'
CREATE TABLE petugas(
	id_petugas 		INT NOT NULL PRIMARY KEY,
	nama			VARCHAR(100) NOT NULL,
	jabatan			VARCHAR(100) NOT NULL,
	no_telepon		VARCHAR(13)
);

--CC Create Table 'peminjaman'
CREATE TABLE peminjaman(
	id_peminjaman		CHAR(6) NOT NULL PRIMARY KEY,
	waktu_pinjam		VARCHAR(100) NOT NULL,
	tanggal_jatuh_tempo	DATE NOT NULL,
	tanggal_kembali		DATE,
	status_peminjaman	VARCHAR(50) NOT NULL,
	anggota_no_anggota	CHAR(10) NOT NULL,
	petugas_id_petugas	INT NOT NULL,
	buku_id_buku		CHAR(6) NOT NULL
);

	--	XXXX RR Initiating 'peminjaman' Relations
	--	|- 'peminjaman' - 'buku'
		ALTER TABLE peminjaman	
			ADD CONSTRAINT fk_peminjaman_buku 
			FOREIGN KEY (buku_id_buku)
			REFERENCES buku(id_buku)
			ON UPDATE CASCADE
			ON DELETE CASCADE;
	--	|
	--	|- 'peminjaman' - 'anggota'
		ALTER TABLE peminjaman
			ADD CONSTRAINT fk_peminjaman_anggota
			FOREIGN KEY (anggota_no_anggota)
			REFERENCES anggota(no_anggota)
			ON UPDATE CASCADE
			ON DELETE CASCADE;
	-- 	|
	--	|- 'peminjaman' - 'petugas'
		ALTER TABLE peminjaman
			ADD CONSTRAINT fk_peminjaman_petugas
			FOREIGN KEY (petugas_id_petugas)
			REFERENCES petugas(id_petugas)
			ON UPDATE CASCADE
			ON DELETE CASCADE;

--CC Create Table 'denda'
CREATE TABLE denda(
	id_denda		CHAR(6) NOT NULL PRIMARY KEY,
	jumlah 			INT NOT NULL,
	jenis_denda		VARCHAR(50) NOT NULL,
	status_bayar	VARCHAR(50) NOT NULL,
	peminjaman_id_peminjaman	CHAR(6) NOT NULL
);
	-- Lupa unique wkwk
	ALTER TABLE denda
		ADD CONSTRAINT uq_peminjaman_id_in_denda 
		UNIQUE(peminjaman_id_peminjaman);

	--RR Initiating Relation 'denda' - 'peminjaman'
	ALTER TABLE denda
		ADD CONSTRAINT fk_denda_peminjaman
		FOREIGN KEY (peminjaman_id_peminjaman)
		REFERENCES peminjaman(id_peminjaman)
		ON UPDATE CASCADE
		ON DELETE CASCADE;



