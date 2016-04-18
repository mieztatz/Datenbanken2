<!doctype html>
<html lang="de">
    <head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8">
		<title> NEWSLETTER </title>
	</head>
<?php

	$lastname = $_POST['lastname'] == "" ? $_POST['lastname'] : noinput();
	$firstname = $_POST['firstname'] == "" ? $_POST['firstname'] : noinput();
	$firstname = $_POST['firstname'] == "" ? $_POST['firstname'] : noinput();
	$birth = $_POST['birth'];
	$mail = $_POST['mail'] == "" ? $_POST['mail'] : noinput();
	$member = $_POST['member'] == "" ? $_POST['member'] : noinput();

	function noinput() {
		echo "Bitte alle mit * gekennzeichneten Felder ausfüllen.";
	}

?>
</html>