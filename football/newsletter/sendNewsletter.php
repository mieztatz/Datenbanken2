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
			<p> Sende hier den Newsletter ab</p>
      <form name="selectionSend" method="POST">
			<p> Wenn willst du den Newsletter senden? <select name="selection">
										<option value="member"> Vereinsmitglieder
										<option value="noMember"> keine Vereinsmitglieder
                    <option value="allMember"> alle Abonnenten
                    <option value="leagues"> Fußballligen
									</select>
			</p>
      <input type='submit' name='selected' value='auswählen'>
      </form>

      <form name="newstext" method="POST" action="newsresult.php">

        <?php
          if(isset($_POST['selected'])){
            if(isset($_POST['selection']) && $_POST['selection'] == "leagues"){
            echo "	An welche Fußballkatagorie soll der Newsletter verschickt werden?";
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
            }
            $stmt->close();
            $mysqli->close();
          }
          else if(isset($_POST['selection']) && $_POST['selection'] == "allMember"){
            echo "News an registrierte Abonnenten senden:";
            include ("../connection.php");
            $sqlReq = "SELECT mail FROM fans";
            $stmt = $mysqli->prepare($sqlReq);
            if(  $stmt->execute()){
              $stmt->bind_result($result);

              echo "<table>";
                 while ($stmt->fetch()) {
                     echo "<tr><td><input type='checkbox' name='memberCheckBox[]' value='$result'> $result</td></tr>";
                 }
              echo "</table>";
            }
            $stmt->close();
            $mysqli->close();
          }
          else if(isset($_POST['selection']) && $_POST['selection'] == "member"){
            echo "News an Vereinsmitglieder:";
            include ("../connection.php");
            $sqlReq = "SELECT mail FROM fans WHERE clubmember = 1";
            $stmt = $mysqli->prepare($sqlReq);
            if( $stmt->execute()){
              $stmt->bind_result($result);

              echo "<table>";
                 while ($stmt->fetch()) {
                     echo "<tr><td><input type='checkbox' name='memberCheckBox[]' value='$result'> $result</td></tr>";
                 }
              echo "</table>";
            }
            $stmt->close();
            $mysqli->close();
          }
          else if(isset($_POST['selection']) && $_POST['selection'] == "noMember"){
            echo "News an registrierte Abonnenten senden:";
            include ("../connection.php");
            $sqlReq = "SELECT mail FROM fans WHERE clubmember = 0";
            $stmt = $mysqli->prepare($sqlReq);
            if(  $stmt->execute()){
              $stmt->bind_result($result);

              echo "<table>";
                 while ($stmt->fetch()) {
                     echo "<tr><td><input type='checkbox' name='memberCheckBox[]' value='$result'> $result</td></tr>";
                 }
              echo "</table>";
            }
            $stmt->close();
            $mysqli->close();
          }
        }
       ?>
    </div>
		<div id='text'>
				<table>
					<tr>
						<td> BETREFF</td> <td> <input type='text' name='subject'/> </td>
					</tr>
					<tr>
						<td> NACHRICHT  </td> <td> <input style="height: 300px;"  type='text' name='message'/> </td>
					</tr>
		  		</table>
          <input type='submit' name='send' value='Absenden'>
			</form>
		</div>
	</body>
</html>
