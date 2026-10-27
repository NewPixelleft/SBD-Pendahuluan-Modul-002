ALTER TABLE denda
    ADD CONSTRAINT uq_peminjaman_id_in_denda 
    UNIQUE(peminjaman_id_peminjaman);