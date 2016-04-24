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
				<li class='active'><a href='sendNewsletter.php'>Newsletter verschicken(eingeschränkt)</a></li>
			</ul>
		</div>
		
		<div id='text'>
			<h1> NEWSLETTER ABSENDEN</h1>
			<p> Es gibt Neuigkeiten? </p>
			<p> Sende hier den Newsletter ab</p>
			
			<p> Einen Verein wählen:<select name="member">
										<option value="JA"> JA
										<option vale="NEIN"> NEIN
									</select>
			</p>
			Beliebige Fans auswählen:
		</div>
		
		<div id='text'>
			<h1> NEWSLETTER ABSENDEN</h1>
			<p> Es gibt Neuigkeiten? </p>
			<p> Sende hier den Newsletter ab</p>
			<form name="data" method="POST" action="userdata.php">
				<table>
					<tr>
						<td> BETREFF</td> <td> <input type='text' name='subject'/> </td>
					</tr>
					<tr>
						<td> NACHRICHT  </td> <td> <input style="height: 300px;"  type='text' name='message'/> </td>
					</tr>
					
		  		</table>
			</form>
		</div>
	</body>
</html>