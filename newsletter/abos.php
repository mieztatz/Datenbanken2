<?php session_start(); ?>
<!doctype html>
<html lang="de">
    <head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8">
		<title> NEWSLETTER </title>
 		<meta name="viewport" content="width=device-width, initial-scale=1">
  		<link rel="stylesheet" href="../styles.css">
	</head>
  <body>
		<div id='cssmenu'>
			<ul>
  				<li><a href='../vote/index.php'>Voting</a></li>
   				<li><a href='../vote/result.php'>Results</a></li>
				<li class='active'><a href='newsletter.php'>Newsletter</a></li>
				<li><a href='sendNewsletter.php'>Newsletter verschicken(eingeschränkt)</a></li>
			</ul>
		</div>
	  
	  <div id='text'>
		<?php

		  if(isset($_SESSION['mail']) && isset($_POST['leagueCheckBox'])){
			$mail = $_SESSION['mail'];
			$leagues = $_POST['leagueCheckBox'];
			include ("../vote/connection.php");
		  //  print_r($_SESSION['mail']);
		  //  print_r($_POST['leagueCheckBox']);
			$sqlIns = "INSERT IGNORE INTO `newsletter` (`mail`, `leaguenews`) VALUES (?,?)";
			$stmt = $mysqli->prepare($sqlIns);
			$stmt->bind_param("ss",$mail,$league);
		/*fügt neue Newsletter-Abos ein. TODO: nicht mehr gewollte Newsletter-Abos aus DB löschen. z. B. mit "DELETE FROM ... WHERE ... like ..." */
			foreach($leagues as $league){
			  if($stmt->execute()){
				$success = true;
			  }
			  else{
				$success = false;
			  }
			}
			if($success){
			  echo "Ihre Daten wurden aktualisiert.";
			}
			else{
			  echo "Fehler bei der Aktuallisierung der Daten";
			}
		  }
		  session_destroy();

		?>
	  </div>

</body>
</html>
