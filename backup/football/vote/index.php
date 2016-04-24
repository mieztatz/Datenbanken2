<!doctype html>
<html lang="de">
    <head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8">
		<title> FUSSBALLVEREINE </title>
 		<meta name="viewport" content="width=device-width, initial-scale=1">
  		<link rel="stylesheet" href="../styles.css">
   		
  
		
	</head>
	<body>
		<div id='cssmenu'>
			<ul>
				<li><a href='../index.html'>Willkommen</a><li>
  				<li class='active'><a href='index.php'>Voting</a></li>
   				<li><a href='result.php'>Results</a></li>
				<li><a href='../newsletter/newsletter.php'>Newsletter</a></li>
				<li><a href='../newsletter/sendNewsletter.php'>Newsletter verschicken(eingeschränkt)</a></li>
			</ul>
		</div>
		<div id='text'>
			<h1> VEREINSVOTING </h1>
			<p> Hier kannst du f&uuml;r einen Fu&szlig;ballverein voten oder einen neuen zur Auswahlliste hinzuf&uuml;gen. </p>

			<form name="teams" method="POST">
				<?php include ("teamlist.php"); ?>
			</form>
			<form name="selection" method="POST">
				<?php include ("selectedteam.php"); ?>
			</form>
			<?php include("updatedb.php"); ?>
		</div>
	</body>
</html>