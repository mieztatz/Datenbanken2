<?php
	//Schritt 1: Datenbankverbindung herstellen
	$mysqli = new mysqli('localhost', 'footballplayer', 'player', 'football');
	mysqli_set_charset($mysqli, 'utf8mb4');
	if ($mysqli->connect_error) {
    		die('Connect Error (' . $mysqli->connect_errno . ') ' . $mysqli->connect_error);
	}

?>