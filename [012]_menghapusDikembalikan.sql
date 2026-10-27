    -- yh
    DELETE FROM peminjaman WHERE status_peminjaman = 'Dikembalikan';

    -- kita coba liat
    SELECT * FROM peminjaman WHERE status_peminjaman = 'Dikembalikan';
    SELECT * FROM peminjaman;