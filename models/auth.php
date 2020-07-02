<?php
class auth
{
	private $uname='Athallariqr_06851';
	private $pass='Athal';
	private $host='localhost/XE';
	protected $koneksi;

	function __construct()
	{
		$konek=oci_connect($this->uname, $this->pass, $this->host);
		if($konek)
		{
			echo "Berhasil Konek";
			$this->koneksi=$konek;
		}
		else
		{
			echo "gagal";
		}
	}
}
?>