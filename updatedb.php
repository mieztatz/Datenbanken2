<?php
	include ("connection.php");
	
	if(isset($_POST['eingabe'])){
		$newclub = $_POST['eingabe'];
		mysqli_query($mysqli, "INSERT INTO teams (teamname, vote) VALUES ('$newclub', '1')");
		echo "<p>Der Verein <b>$newclub</b> wurde in die DB mit aufgenommen</p>";
	}

	if(isset($_POST['verein'])){
		$selectedTeam = $_POST['verein'];
		if($selectedTeam != "on"){
			mysqli_query($mysqli, "UPDATE `teams` SET `vote` = `vote` + 1 WHERE `teams`.`teamname` = '$selectedTeam'");
		}
	}

	include ("result.php");
?>