<!DOCTYPE html>
<html>
    <head>
        <title>Registrazione Biblioteca</title>
        <link rel="stylesheet" type="text/css" href="logstyle.css">
    </head>
    <body>
        <div class="center">
            <h1> Registrazione </h1>
            <form action="<?php echo $_SERVER['PHP_SELF']?>" method="POST">
                <label for="email">Email:</label><br>
                <input type="email"  name="email" required><br>
                <label for="password">Password:</label><br>
                <input type="password"  name="password" required><br>
                <label for="confirm-password"> Confirm Password: </label><br>
                <input type="password" name="confirm-password" required><br><br>
                <input type="submit" name="invia"> <br>
                <label class="center"> Utente già registrato? </label> <br>
                <a class="center" href="login.php"> vai al login </a>
            </form>
        </div>

            <?php
                include "connessione.php";

                if (isset($_POST['invia'])) {
                    $email = $_POST['email'];
                    
                    $domain = explode('@', $email)[1];
                    if ($domain != 'daronco.edu.it') {
                        echo "<h2> questo domain non è accettabile, riprova con '@daronco.edu.it' </h2>";
                        return;
                    }
                    
                    $check = "SELECT * FROM tblUtenti WHERE eMail = '$email'";
                    if ((($db -> query($check)) -> num_rows) > 0) {
                        echo "<h2> email già registrata, passa al login! </h2>";
                        return;
                    }

                    $autenticazione = md5($_POST['password']);
                    $conferma_autenticazione = md5($_POST['confirm-password']);
                    if ($autenticazione != $conferma_autenticazione) {
                        echo "<h2>le due password non corrispondono!</h2>";
                        return;
                    }

                    $registra = "INSERT INTO tblUtenti(eMail, pass) VALUES('$email', '$autenticazione')";
                    $risultato = $db -> query($registra);
                    if (!$risultato) {
                        echo "<h2>UTENTE NON REGISTRATO</h2>";
                        return;
                    }

                    echo "<h1>UTENTE REGISTRATO</h1>";
                    header("url=login.php");
                } 
            ?>
    </body>
</html>