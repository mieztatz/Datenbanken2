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
        <li><a href='../index.html'>Willkommen</a><li>
        <li><a href='../vote/index.php'>Voting</a></li>
        <li><a href='../vote/result.php'>Results</a></li>
        <li class='active'><a href='newsletter.php'>Newsletter</a></li>
        <li><a href='../newsletter/sendNewsletter.php'>Newsletter verschicken(eingeschränkt)</a></li>
			</ul>
		</div>
<?php

  if(isset($_SESSION['mail'])){
    $mail = $_SESSION['mail'];
    session_destroy();
    include ("../connection.php");
    $sqlDel = "DELETE FROM newsletter WHERE mail = '$mail'";
    $success = TRUE;
    if(isset($_POST['leagueCheckBox'])){
      $leagues = $_POST['leagueCheckBox'];
    //  print_r($_SESSION['mail']);
    //  print_r($_POST['leagueCheckBox']);

      $sqlIns = "INSERT IGNORE INTO `newsletter` (`mail`, `leaguenews`) VALUES (?,?)";
      $stmt = $mysqli->prepare($sqlIns);
      $stmt->bind_param("ss",$mail,$league);

      foreach($leagues as $league){
        if($stmt->execute()){
          $sqlDel .= " AND leaguenews <> '".$league."'";
          $success &= TRUE;
        }
        else{
          $success &= FALSE;
        }
      }
      $stmt->close();
    }
    if($success){
      $stmt = $mysqli->prepare($sqlDel);
      if($stmt->execute()){
        $stmt->close();
        echo "<div id='text'>Ihre Daten wurden erfolgreich aktualisiert.</div>";
      }
      else{
          echo "<div id='text'>Fehler bei der Aktuallisierung der Daten.</div>";
      }
    }
    else{
      echo "<div id='text'>Fehler bei der Aktuallisierung der Daten.</div>";
    }
    $mysqli->close();
  }
?>

</body>
</html>
