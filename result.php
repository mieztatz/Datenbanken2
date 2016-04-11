<?php 
	//Schritt 2: Statement vorbereiten
	$stmt = $mysqli->prepare("SELECT * FROM teams");
		
	//Variablen müssen hier nicht eingebunden werden

	// Schritt 5: Query ausführen
	if($stmt->execute()){
		$result = $stmt->get_result();
		$array = $result->fetch_all(MYSQLI_ASSOC);
			
	} else {
		error_log("Anfrage nicht erfolgreich.");
	}
	
	echo "<p><table>
		<tr>
			<td> VEREIN </td>
			<td> VOTES </td>
		</tr>
			
		<tr>";
			foreach($array as $value) {
				foreach($value as $tmp) {
					echo "<td> $tmp </td>";
				}
			echo "</tr>";
			}
			
	echo "</table></p>";

	$stmt->close();

	$mysqli->close();

?>