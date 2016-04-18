<?php
		
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
			<td> VEREIN </td>
			<td> VOTE </td>";
			
		
			//print_r($array);
			foreach($array as $value) {
				//print_r($value);
				
				echo "<tr><td>". $value['teamname']. "</td>";
				echo "<td> <input type='radio' name='verein' value='$value[teamname]'/> </td></tr> ";
				
			}
			
			echo "<tr><td> anderer Verein </td>";
			echo "<td> <input type='radio' name='verein' /> </td></tr>";
	echo "</table>";
	echo "<input type='submit' value='auswählen'/>";
	
	$stmt->close();
	$mysqli->close();	
?>