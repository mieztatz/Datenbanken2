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
			<h1> NEWSLETTER ABSENDEN</h1>
			<p> Es gibt Neuigkeiten? </p>
			<p> Sende hier den Newsletter ab.</p>
      <form name="newstext" method="POST" action="newsresult.php">
			<p> Wenn willst du den Newsletter senden? <select name="selection">
										<option value="member"> Vereinsmitglieder
										<option value="noMember"> keine Vereinsmitglieder
                    <option value="allMember"> Vereinsmitglieder (ja & nein)
									</select>
			</p>
      <?php
          echo "An welche Fußballkategorie soll der Newsletter verschickt werden?";
            include ("../connection.php");
            $sqlReq = "SELECT * FROM league";
            $stmt = $mysqli->prepare($sqlReq);
            if( $stmt->execute()){
              $stmt->bind_result($result);
              echo "<table>";
                 while ($stmt->fetch()) {
                     echo "<tr><td><input type='checkbox' name='leagueCheckBox[]' value='$result'> $result</td></tr>";
                 }
              echo "</table>";
              $stmt->close();
            }
            $mysqli->close();
       ?>
    </div>
		<div id='text'>
				<table>
					<tr>
						<td> BETREFF</td> <td> <input type='text' name='subject'/> </td>
					</tr>
					<tr>
						<td style="padding-right:15px">NACHRICHT</td> <td> <input style="height: 30px;"  type='text' name='message'/> </td>
					</tr>
		  		</table>
          <input type='submit' name='send' value='Absenden'>
			</form>
		</div>
	</body>
</html>
