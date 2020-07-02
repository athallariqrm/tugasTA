<?php 
require 'auth.php';

class modelPendaftaran extends auth
{
	private $datapendaftaran;

	function select()
	{
		$sqltext="SELECT * FROM PENDAFTARAN";
		$statement=oci_parse($this->koneksi,$sqltext);
		oci_execute($statement);


		while ($row=oci_fetch_array($statement,OCI_BOTH))
			{
				$temp[]=$row;	
			}
			$this->datapendaftaran=$temp;

			oci_free_statement($statement);
	}

	function insert($iduser,$nm,$pass,$alamat,$email)
	{
		$sqltext ="INSERT INTO PENDAFTARAN VALUES('$iduser','$nm','$pass','$alamat','$email')";
		$statement=oci_parse($this->koneksi,$sqltext);
		oci_execute($statement);

		oci_free_statement($statement);
	}

	function getData()
	{
		return $this->datapendaftaran; 
	}
	function viewData()
	{
		foreach ($this->datapendaftaran as $key) 
		{
			echo $key['ID_USER'];
			echo " -> ";
			echo $key['NAMA'];
			echo " -> ";
			echo $key['PASSWORD'];
			echo " -> ";
			echo $key['ALAMAT'];
			echo " -> ";
			echo $key['EMAIL'];
			echo "<br>";

		}
	}
	function delete($iduser)
	{
		$sqltext ="DELETE FROM PENDAFTARAN WHERE ID_USER='$iduser'";
		$statement=oci_parse($this->koneksi,$sqltext);
		oci_execute($statement);
		oci_free_statement($statement);		
	}
	function update($iduser,$nm,$pass,$alamat,$email)
	{
		$sqltext ="UPDATE PENDAFTARAN SET NAMA='$nm', PASSWORD='$pass', ALAMAT='$alamat', EMAIL='$email' WHERE ID_USER='$iduser";
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