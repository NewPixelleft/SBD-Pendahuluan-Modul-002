UPDATE denda
SET
    status_bayar = 'Lunas'
WHERE id_denda = 'DN0003';

SELECT * FROM denda
	WHERE id_denda = 'DN0003';
    