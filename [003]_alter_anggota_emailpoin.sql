-- Pak Agus ingin memperluas sarana komunikasi digital dengan para anggota perpustakaan
-- sekaligus mencatat tingkat keaktifan peminjaman mereka. Tambahkan dua kolom baru pada tabel
-- “anggota”, kolom “email” dengan tipe data VARCHAR(100), dan kolom “poin_keaktifan”
-- dengan tipe data INT yang memiliki nilai default 0.

ALTER TABLE anggota
    ADD COLUMN email VARCHAR(100),
    ADD COLUMN poin_keaktifan INT NOT NULL DEFAULT 0;