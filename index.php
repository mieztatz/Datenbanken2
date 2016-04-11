<!doctype html>
<html lang="de">
    <head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8">
		<title> FUSSBALLVEREINE </title>
		<style> table, td, th { border: 1px solid black; } </style>
	</head>
	<body>
		<p> Hallo. </p>
		<p> Hier kannst du f&uuml;r einen Fu&szlig;ballverein voten oder einen neuen zur Auswahlliste hinzuf&uuml;gen. </p>
		
		<form name="teams" method="POST">
		<?php include ("teamlist.php"); ?>
		</form>
		<form name="selection" method="POST">
		<?php include ("selectedteam.php"); ?>
		</form>
		<?php include ("updatedb.php"); ?>
		
	</body>
</html>