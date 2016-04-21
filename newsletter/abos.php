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
  include ("../connection.php");
  /* TODO: Variable $mail aus userdata.php an diese php Datei übergeben. Vermutlich mit $_SESSION oder nochmal irgendwie mit $_POST*/
print_r($_POST['mail']);
/*  $sqlIns = "INSERT INTO newsletter (mail,leaguenews) VALUES (?,?)";
$stmt = $mysqli->prepare($sqlIns);
$stmt->bind_param("ss",$mail,$league);
if($stmt->execute()){
  echo "DB wurde aktualisiert.";
}
else{
  echo "Error";
}
*/
?>
<p>
  Ihre Daten wurden aktualisiert.
</p>
</body>
</html>
