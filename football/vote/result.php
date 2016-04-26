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
				<li><a href='../newsletter/sendNewsletter.php'>Newsletter verschicken</a></li>
			</ul>
		</div>

		<div id='text'>
		<h1> VOTING-ERGEBNISSE </h1>
			<?php
				include ("../connection.php");
				$stmtCalc = $mysqli->prepare("SELECT teamname, ROUND(vote/(SELECT SUM(vote) AS summe FROM teams)*100,2) AS percentage FROM teams");
				
				if($stmtCalc->execute()){
					$result = $stmtCalc->get_result();
					$array = $result->fetch_all(MYSQLI_ASSOC);

				} else {
					error_log("Anfrage nicht erfolgreich.");
				}
				echo "<p><table>
					<tr>
						<td align=left><b>VEREIN</b></td>
						<td align=center><b>VOTES</b></td>
					</tr>";
						echo "<br />";
						foreach($array as $value) {
							echo "<tr><td style='padding-right:15px' align=left>";
							echo $value['teamname'];
							echo "</td><td align=right>";
							echo $value['percentage'];
							echo "%</td></tr>";
						}
						echo "</tr>";


				echo "</table></p>";
				$stmtCalc->close();
				$mysqli->close();
			?>
		</div>
	</body>
</html>
