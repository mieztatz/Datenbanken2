<?php
	echo "<H1> VEREINE </H1>";
		
	include ("connection.php");

	//Schritt 2: Statement vorbereiten
	$stmt = $mysqli->prepare("SELECT teamname FROM teams");
		
	//Variablen müssen hier nicht eingebunden werden

	// Schritt 5: Query ausführen
	if($stmt->execute()){
		$result = $stmt->get_result();
		$array = $result->fetch_all(MYSQLI_ASSOC);
			
	} else {
		error_log("Anfrage nicht erfolgreich.");
	}

	echo "<table>
		<tr>
			<td> VOTE </td>
			<td> VEREIN </td>
		</tr>
			
		<tr>";
			foreach($array as $value) {
				foreach($value as $tmp) {
					echo "<td> <input type='radio' name='verein' value='$tmp' /> </td> ";
					echo "<td> $tmp </td></tr>";
				}
			}
			echo "<td> <input type='radio' name='verein' /> </td> ";
			echo "<td> anderer Verein </td></tr>";
	echo "</table>";
	echo "<input type='submit' value='auswählen'/>";
	
	$stmt->close();
	$mysqli->close();	
?>