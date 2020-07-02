<?php 
require 'auth.php';

class modelKatalog extends auth 
{
	private $datakatalog;

	function select()
	{
		$sqltext="SELECT * FROM KATALOG";
		$statement=oci_parse($this->koneksi,$sqltext);
		oci_execute($statement);


		while ($row=oci_fetch_array($statement,OCI_BOTH))
			{
				$temp[]=$row;	
			}
			$this->datakatalog=$temp;

			oci_free_statement($statement);
	}

	function insert($idkatalog,$jenis_seragam,$bahan,$ukuran_lengan,$model_jilbab,$harga_satuan)
	{
		$sqltext ="INSERT INTO KATALOG VALUES('$idkatalog','$jenis_seragam','$bahan','$ukuran_lengan','$model_jilbab','$harga_satuan')";
		$statement=oci_parse($this->koneksi,$sqltext);
		oci_execute($statement);

		oci_free_statement($statement);
	}

	function getData()
	{
		return $this->datakatalog; 
	}
	function viewData()
	{
		foreach ($this->datakatalog as $key) 
		{
			echo $key['ID_KATALOG'];
			echo " -> ";
			echo $key['JENIS_SERAGAM'];
			echo " -> ";
			echo $key['BAHAN'];
			echo " -> ";
			echo $key['UKURAN_LENGAN'];
			echo " -> ";
			echo $key['MODEL_JILBAB'];
			echo " -> ";
			echo $key['HARGA_SATUAN'];
			echo "<br>";

		}
	}
	function delete($idkatalog)
	{
		$sqltext ="DELETE FROM KATALOG WHERE ID_KATALOG='$idkatalog'";
		$statement=oci_parse($this->koneksi,$sqltext);
		oci_execute($statement);
		oci_free_statement($statement);		
	}
	function update($idkatalog,$jenis_seragam,$bahan,$ulengan,$m_jilbab,$harga_satuan)
	{
		$sqltext ="UPDATE KATALOG SET JENIS_SERAGAM='$jenis_seragam', BAHAN='$bahan', UKURAN_LENGAN='$ukuran_lengan', MODEL_JILBAB='$model_jilbab', HARGA_SATUAN='$harga_satuan' WHERE ID_KATALOG='$idkatalog'";
		$statement=oci_parse($this->koneksi,$sqltext);
		oci_execute($statement);
		oci_free_statement($statement);	
	}
}


//$objModelAdmin=new modelAdmin();
//$objModelAdmin->insert('1','tes11','lul');
//$objModelAdmin->delete('9');
//$objModelAdmin->edit('1','dindin','coba');
//$objModelAdmin->select();
//$objModelAdmin->viewData();
?>