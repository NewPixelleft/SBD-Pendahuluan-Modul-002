-- Hapus kolom "negara asal" dari tabel "penulis"

ALTER TABLE penulis
    DROP COLUMN negara_asal;