<?php
	//Stellt dir Verbindung zur Datenbank her
	$mysqli = new mysqli('localhost', 'Football', 'test', 'football');
	mysqli_set_charset($mysqli, 'utf8mb4');
	if ($mysqli->connect_error) {
    		die('Connect Error (' . $mysqli->connect_errno . ') ' . $mysqli->connect_error);
	}

?>