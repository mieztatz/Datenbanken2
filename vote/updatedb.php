<?php
	include ("connection.php");
	
	if(isset($_POST['eingabe'])){
		$newclub = $_POST['eingabe'];
		if(mysqli_query($mysqli, "INSERT INTO teams (teamname, vote) VALUES ('$newclub', '1')")){
			echo "<p>Der Verein <b>$newclub</b> wurde in die DB mit aufgenommen. Danke für Ihre Abstimmung.</p>";
		}
		else{
			echo "<p>Der Verein <b>$newclub</b> existiert bereits.<p>";
		}
		header("Refresh:5");
	}

	if(isset($_POST['verein'])){
		$selectedTeam = $_POST['verein'];
		if($selectedTeam != "on"){
			mysqli_query($mysqli, "UPDATE `teams` SET `vote` = `vote` + 1 WHERE `teams`.`teamname` = '$selectedTeam'");
		
			echo "<p>Sie haben für den Verein <b>$selectedTeam</b> abgestimmt. Danke für Ihre Abstimmung.</p>";
			header("Refresh:3");
		}
	}

			
	$mysqli->close();

	
?>
		
