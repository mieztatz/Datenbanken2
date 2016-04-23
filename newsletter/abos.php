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
  				<li><a href='../index.php'>Voting</a></li>
   				<li><a href='../result.php'>Results</a></li>
				<li class='active'><a href='newsletter.php'>Newsletter</a></li>
			</ul>
		</div>


<?php

  if(isset($_SESSION['mail'])){
    $mail = $_SESSION['mail'];
    include ("../connection.php");
    print_r($_SESSION['mail']);
    print_r($_POST['leagueCheckBox']);
  //  $sqlIns = "INSERT INTO newsletter (mail,leaguenews) VALUES ($mail,?)";
  //  $stmt = $mysqli->prepare($sqlIns);
  //  $stmt->bind_param("s",$league);
  //  if($stmt->execute()){
  //    echo "DB wurde aktualisiert.";
  //  }
  //  else{
      echo "Error";
  //  }
  }
  session_destroy();
  $mysqli->close();
?>
<p>
  Ihre Daten wurden aktualisiert.
</p>
</body>
</html>
