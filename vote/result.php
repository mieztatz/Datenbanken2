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
  				<li><a href='index.php'>Voting</a></li>
   				<li class='active'><a href='result.php'>Results</a></li>
				<li><a href='../newsletter/newsletter.php'>Newsletter</a></li>
				<li><a href='../newsletter/sendNewsletter.php'>Newsletter verschicken(eingeschränkt)</a></li>
			</ul>
		</div>

		<div id='text'>
		<h1> VOTING-ERGEBNISSE </h1>
			<?php 
				include ("connection.php");
				//Schritt 2: Statement vorbereiten
				$stmt = $mysqli->prepare("SELECT * FROM teams");
				$sumVots = $mysqli->prepare("SELECT SUM(vote) AS summe FROM teams ");

				//Variablen müssen hier nicht eingebunden werden

				// Schritt 5: Query ausführen
				if($stmt->execute()){
					$result = $stmt->get_result();
					$array = $result->fetch_all(MYSQLI_ASSOC);

				} else {
					error_log("Anfrage nicht erfolgreich.");
				}
				if($sumVots->execute()){
					$voteResults = $sumVots->get_result();
					$vots = $voteResults->fetch_all(MYSQLI_ASSOC);

				} else {
					error_log("Anfrage nicht erfolgreich.");
				}

				echo "<p><table>
					<tr>
						<td align=left><b>VEREIN</b></td>
						<td align=center><b>VOTES</b></td>
					</tr>";
						//print_r($vots[0]['summe']);
						echo "<br />";
						//print_r($array);
						foreach($array as $value) {

								echo "<tr><td style='padding-right:15px' align=left>". $value['teamname']. "</td>";
								$tmp = number_format($value['vote']/$vots[0]['summe']*100,2);
								echo "<td align=right>". $tmp. "%</td></tr>";
							}
						echo "</tr>";


				echo "</table></p>";

				$stmt->close();

				$mysqli->close();

			?>
		</div>
	</body>
</html>