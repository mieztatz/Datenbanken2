<?php

if(isset($_POST['verein'])) {
	$selected_radio = $_POST['verein'];
	$eingabeFeld = "<input type='text' name='eingabe' /> ";
	if($selected_radio == "on"){
		echo "<p>Bitte tragen Sie hier Ihren gewünschten Verein ein: $eingabeFeld <input type='submit' value='hinzufügen'/> </p>";
	}
	
}

?>