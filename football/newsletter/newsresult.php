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
  				<li><a href='../vote/index.php'>Voting</a></li>
   				<li><a href='../vote/result.php'>Results</a></li>
				<li><a href='newsletter.php'>Newsletter</a></li>
				<li class='active'><a href='sendNewsletter.php'>Newsletter verschicken</a></li>
			</ul>
		</div>

		<div id='text'>
			<h1> NEWSLETTER ABGESENDET</h1>
			<p> Der Newsletter wurde an folgende Benutzer geschickt: </p>

      <?php
      if(isset($_POST['selection'])){
		  include ("../connection.php");
		  if($_POST['selection'] == "allMember"){
			  if(isset($_POST['leagueCheckBox'])){
				$sqlReq = "SELECT mail FROM newsletter WHERE leaguenews = ?";
				$leagues = $_POST['leagueCheckBox'];
				$stmt = $mysqli->prepare($sqlReq);
				$stmt->bind_param("s",$league);
				echo "<table>";
				foreach($leagues as $league){
				  if($stmt->execute()){
					$stmtResult = $stmt->get_result();
					$resultLeag= $stmtResult->fetch_all(MYSQLI_ASSOC);
					$tmp = array_column($resultLeag,'mail');
					foreach($tmp as $value){
					  echo "<tr><td>$value</td></tr>";
					}
				  }
				}
				echo "</table>";

				$stmt->close();
				$mysqli->close();
			  }
		   }
		  else if($_POST['selection'] == 'member'){
        }
		else if($_POST['selection'] == 'noMember') {
		}
	  }

       ?>
    </div>
	</body>
</html>
