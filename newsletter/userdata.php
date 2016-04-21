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

    <p>
    <h1>  Newsletter </h1>
    Hier können Sie die gewünschten Newsletter der einzelnen Fußballkategorien auswählen.
  </p>
<form name="newsabo" method="POST" action="abos.php">
<?php
  include ("../connection.php");

  $sqlIns = "INSERT INTO fans (firstname,lastname,mail,clubmember) VALUES (?,?,?,?)";
  $stmt = $mysqli->prepare($sqlIns);
  $stmt->bind_param("sssi",$lastname,$firstname,$mail,$member);

	$lastname = !empty($_POST['lastname']) ? $_POST['lastname'] : noinput();
	$firstname = !empty($_POST['firstname']) ? $_POST['firstname'] : noinput();
  $mail = !empty($_POST['mail']) ? $_POST['mail'] : noinput();
	$member = $_POST['member'] == "JA" ? (int)1 : (int)0;


  if(!$stmt->execute()){

    $sqlLeag = "SELECT * FROM league";
    $ersin = "SELECT leaguenews FROM newsletter WHERE mail = '$mail'";
  /*  $sqlReq = "SELECT * FROM league WHERE leaguename NOT IN ($ersin)";  wird nicht benötigt. */


    $stmt = $mysqli->prepare($sqlLeag);

    if($stmt){
      $stmt->execute();
      $stmtResult = $stmt->get_result();
      $resultLeag= $stmtResult->fetch_all(MYSQLI_ASSOC);
      $stmt->close();

      $stmt = $mysqli->prepare($ersin);
      $stmt->execute();
      $stmtResult =  $stmt->get_result();
      $resultNews = $stmtResult->fetch_all(MYSQLI_ASSOC);
      $stmt->close();

      echo "<table>";
      foreach($resultLeag as $leagues) {
        if(array_search($leagues['leaguename'],array_column($resultNews,'leaguenews')) !== false){
            echo "<tr><td><input type='checkbox' value='$leagues[leaguename]' checked> $leagues[leaguename]</td></tr>";
          }
          else{
            echo "<tr><td><input type='checkbox' value='$leagues[leaguename]'> $leagues[leaguename]</td></tr>";
          }
        }
      echo "</table>";
    }
  }
  else{

    $sqlReq = "SELECT * FROM league";
    $stmt = $mysqli->prepare($sqlReq);
    if($stmt){
      $stmt->execute();
      $stmt->bind_result($result);

      echo "<table>";
         while ($stmt->fetch()) {
             echo "<tr><td><input type='checkbox' value='$result'> $result</td></tr>";
         }
      echo "</table>";
    }
    $stmt->close();
  }
  $mysqli->close();

  function noinput() {
		echo "<p>Bitte alle mit * gekennzeichneten Felder ausfüllen.</p>";
    $mysqli->close();
    exit();
	}

  ?>
  <p> <input type='submit' name='abo' value='abonnieren'/> <p>
</form>

</body>
</html>
