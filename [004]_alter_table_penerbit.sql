-- Ubah tipe data pada kolom “no_telepon” di tabel “penerbit”
-- menjadi VARCHAR(20).

ALTER TABLE penerbit
    ALTER COLUMN no_telepon TYPE VARCHAR(20);
