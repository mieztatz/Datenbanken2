ls /<!doctype html>
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
				<li class='active'><a href='sendNewsletter.php'>Newsletter verschicken</a></li>
			</ul>
		</div>

		<div id='text'>
      <h1> NEWSLETTER ABGESENDET</h1>
      <?php
        if(isset($_POST['leagueCheckBox']) && $_POST['leagueCheckBox'] != NULL){
          echo 	"<p>Der Newsletter wurde an folgende Benutzer geschickt.</p>";
          $leagues = $_POST['leagueCheckBox'];

          if($_POST['selection'] == "allMember"){
              $sqlReq = "SELECT mail FROM newsletter WHERE leaguenews = ?";
              sqlrequest($sqlReq,$leagues);
          }
          else if($_POST['selection'] == "member"){
            $sqlReq = "SELECT newsletter.mail FROM newsletter, fans WHERE newsletter.mail = fans.mail AND fans.clubmember = 1 AND newsletter.leaguenews = ?";
            sqlrequest($sqlReq,$leagues);
          }
          else if($_POST['selection'] == "noMember"){
            $sqlReq = "SELECT newsletter.mail FROM newsletter, fans WHERE newsletter.mail = fans.mail AND fans.clubmember = 0 AND newsletter.leaguenews = ?";
            sqlrequest($sqlReq,$leagues);
          }
        }
        else{
          echo "<p>Es wurden keine Newsletter versandt, da keine Fußballkatagorie ausgewählt wurde.</p>";
        }

        function sqlrequest($sqlReq,$leagues){
          include ("../connection.php");
          $stmt = $mysqli->prepare($sqlReq);
          $stmt->bind_param("s",$league);
          echo "<table>";
          foreach($leagues as $league){
            echo "<tr><td style='padding-right:5px'>Newsletter <b>".$league." </b>an:</td>";
            if($stmt->execute()){
              $stmtResult = $stmt->get_result();
              $resultLeag= $stmtResult->fetch_all(MYSQLI_ASSOC);
              if(!empty($resultLeag)){
                $tmp = array_column($resultLeag,'mail');
                foreach($tmp as $value){
                  if($value != array_slice($tmp, -1)[0]){
                    echo "<td style='padding-right:5px'>".$value.",</td>";
                  }
                  else {
                      echo "<td style='padding-right:5px'>".$value."</td>";
                  }
                }
                echo "</tr>";
              }
              else{
                echo "<td> zur Zeit abonniert keiner diesen Newsletter.</td></tr>";
              }
            }
            else{
              echo "<td>Niemanden</td></tr>";
            }

          }
          echo "</table>";

          $stmt->close();
          $mysqli->close();
        }
      ?>
    </div>
	</body>
</html>
