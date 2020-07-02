<?php
require '../models/modelKatalog.php';

class prosesKatalog
{
	private $action;

	function __construct($act)
	{
		$this->action=$act;
	}

	function proses()
	{
		$objmodel=new modelKatalog();
		if ($this->action=="tambah")
		{
			$idkatalog=$_POST['inputIdKatalog'];
			$jenis_seragam=$_POST['inputJenisSeragam'];
			$bahan=$_POST['inputBahan'];
			$ukuran_lengan=$_POST['inputUkuranLengan'];
			$model_jilbab=$_POST['inputModelJilbab'];
			$harga_satuan=$_POST['inputHargaSatuan'];
			$objmodel->insert($idkatalog,$jenis_seragam,$bahan,$ukuran_lengan,$model_jilbab,$harga_satuan);
			header("location:../views/datakatalog.php");
		}
		elseif ($this->action=="hapus")
		{
			$idkatalog=$_GET['ID_KATALOG'];
			$objmodel->delete($idkatalog);
			header("location:../views/datakatalog.php");
		}
		elseif ($this->action=="edit") 
		{
			$idkatalog=$_POST['IdKatalog'];
			$jenis_seragam=$_POST['JenisSeragam'];
			$bahan=$_POST['Bahan'];
			$ulengan=$_POST['UkuranLengan'];
			$m_jilbab=$_POST['ModelJilbab'];
			$harga_satuan=$_POST['HargaSatuan'];
			$objmodel->insert($idkatalog,$jenis_seragam,$bahan,$ukuran_lengan,$model_jilbab,$harga_satuan);
			header("location:../views/datakatalog.php");
			
		}
	}
}

$objprosesKatalog=new prosesKatalog($_GET['aksi']);
$objprosesKatalog->proses();
?>