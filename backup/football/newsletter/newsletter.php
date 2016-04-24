<!doctype html>
<html lang="de">
    <head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8">
		<title> NEWSLETTER </title>
 		<meta name="viewport" content="width=device-width, initial-scale=1">
  		<link rel="stylesheet" href="../styles.css">
	</head>
	<body>
		<div id='cssmenu'>
			<ul>
        	<li><a href='../index.html'>Willkommen</a><li>
  				<li><a href='../vote/index.php'>Voting</a></li>
   				<li><a href='../vote/result.php'>Results</a></li>
				  <li class='active'><a href='newsletter.php'>Newsletter</a></li>
          <li><a href='../newsletter/sendNewsletter.php'>Newsletter verschicken(eingeschränkt)</a></li>
			</ul>
		</div>
		<h1> Newsletter/Mailinglisten abnonieren </h1>
		<p> Nach der Registration bzw. Login können Sie verschiedenen Fußballigen den Newsletter abonnieren. </p>
    <div id='text'>
      <b>ERSTANMELDUNG</b>
      <br />Falls Sie noch nicht registriert sind, geben Sie bitte hier Ihre Daten für die Registration an.
  		<form name="data" method="POST" action="userdata.php">
  			<table>
  				<tr>
  					<td> VORNAME* </td> <td> <input type='text' name='firstname'/> </td>
  				</tr>
  				<tr>
  					<td> NACHNAME*  </td> <td> <input type='text' name='lastname' /> </td>
  				</tr>
  				<tr>
  					<td> E-MAIL*   </td> <td> <input type='text' name='mail' /> </td>
  				</tr>
  				<tr>
  					<td> VEREINSMITGLIED*   </td>
  					<td> <select name="member">
  							<option value="JA"> JA
  							<option vale="NEIN"> NEIN
  						</select>
  					</td>
  				</tr>
        </table>
  			<p> <input type='submit' name='registration' value='registrate'/> <p>
  		</form>
    </div>
    <div id='text'>
      <b>EINLOGGEN</b>
      <br />Bitte geben Sie hier Ihre registrierte EMail Adresse ein.
      <form name="datalogin" method="POST" action="userdata.php">
        <table>
          <tr>
            <td> E-MAIL*   </td> <td> <input type='text' name='mail' /> </td>
          </tr>
        </table>
        <p> <input type='submit' name='login' value='login'/> <p>
      </form>
    </div>
	</body>
</html>
