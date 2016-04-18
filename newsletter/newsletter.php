<!doctype html>
<html lang="de">
    <head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8">
		<title> NEWSLETTER </title>
 		<meta name="viewport" content="width=device-width, initial-scale=1">
  		<link rel="stylesheet" href="styles.css">
   		
  
		
	</head>
	<body>
		<div id='cssmenu'>
			<ul>
  				<li class='active'><a href='../index.php'>Voting</a></li>
   				<li><a href='../result.php'>Results</a></li>
				<li><a href='newsletter.php'>Newsletter</a></li>
			</ul>
		</div>
		<h1> Newsletter/Mailinglisten abnonieren </h1>
		<p> Hier kannst du für einen Fußballverein den Newsletter abonnieren. </p>
		
		<form name="data" method="POST" action="userdata.php">
			<table>
				<tr>
					<td> NACHNAME* </td> <td> <input type='text' name='lastname'/> </td>
				</tr>
				<tr>
					<td> VORNAME*  </td> <td> <input type='text' name='firstname' /> </td>
				</tr>
				<tr>
					<td> GEBURTSTAG</td> <td> <input type='text' name='birth' /> </td>
				</tr>
				<tr>
					<td> E-MAIL*   </td> <td> <input type='text' name='mail' /> </td>
				</tr>
				<tr>
					<td> VEREINSMITGLIED*   </td>
					<td> <select name="member">
							<option value="Ja"> JA
							<option vale="NEIN"> NEIN
						</select>
					</td>
				</tr>
			</table>
			<p> <input type='submit' value='Abonnieren'/> <p>	
		</form>
		
		
	</body>
</html>