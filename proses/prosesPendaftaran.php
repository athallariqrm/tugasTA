<?php
require '../models/modelPendaftaran.php';

class prosesPendaftaran
{
	private $action;

	function __construct($act)
	{
		$this->action=$act;
	}

	function proses()
	{
		$objmodel=new modelPendaftaran();
		if ($this->action=="tambah")
		{
			$iduser=$_POST['inputIdUser'];
			$nm=$_POST['inputNama'];
			$pass=$_POST['inputPassword'];
			$alamat=$_POST['inputAlamat'];
			$email=$_POST['inputEmail'];
			$objmodel->insert($iduser,$nm,$pass,$alamat,$email);
			header("location:../views/datapendaftaran.php");
		}
		else if ($this->action=="hapus")
		{
		 	$iduser=$_GET['ID_USER'];
			$objmodel->delete($iduser);
			header("location:../views/datapendaftaran.php");
		}
		else if ($this->action=="edit") 
		{
			$iduser=$_POST['ID_USER'];
			$nm=$_POST['NAMA'];
			$pass=$_POST['PASSWORD'];
			$alamat=$_POST['ALAMAT'];
			$email=$_POST['EMAIL'];
			$objmodel->insert($iduser,$nm,$pass,$alamat,$email);
		header ("location:../views/datapendaftaran.php");
			
		}
	}
}

$objprosesPendaftaran=new prosesPendaftaran($_GET['aksi']);
$objprosesPendaftaran->proses();
?>