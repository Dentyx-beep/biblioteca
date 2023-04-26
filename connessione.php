<?php
	$host='localhost';
	$user='root';
	$password='';
	$database='dbBiblioteca';
	$db= new mysqli($host,$user,$password,$database);
	if($db->connect_error)
	{
		die('Errore di connessione ('.$db->connect_errorno .') '.$db->connect_error);
	} else {
		//echo 'Connesso. '.$db->host_info."\n";
	}
?>