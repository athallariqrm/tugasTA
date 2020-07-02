<?php
require 'auth.php';
class join extends auth
{
	private $datajoin;
	function select()
	{
		$sqltext = "SELECT A.ID_PEMESANAN, B.HARGA_SATUAN, C.NAMA
					FROM PEMESANAN A LEFT JOIN KATALOG B
					ON A.ID_KATALOG = B.ID_KATALOG
					JOIN PENDAFTARAN C
					ON A.ID_KATALOG = C.ID_USER";
		$statement = oci_parse($this->koneksi, $sqltext);
		oci_execute($statement);

		//mengisi variable datakasir dari database
		$temp;
		while ($row=oci_fetch_array($statement,OCI_BOTH)) {
			$temp[]=$row;
		}
		$this->datajoin=$temp;

		oci_free_statement($statement);
	}
