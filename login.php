<!DOCTYPE html>
<html>
    <head>
        <title> Login Biblioteca </title>
        <link rel="stylesheet" type="text/css" href="logstyle.css">
    </head>
    <body>
        <div class="center">
            <h1> Login </h1>
            <form action="<?php echo $_SERVER['PHP_SELF']?>" method="POST">
                <label for="email">Email:</label><br>
                <input type="email"  name="email" required><br>
                <label for="password">Password:</label><br>
                <input type="password"  name="password" required><br><br>
                <input type="submit" name="invia"> <br>
                <label class="center"> Utente non registrato? </label> <br>
                <a class="center" href="registration.php"> vai alla registrazione </a>
            </form>
        </div>

            <?php
                include "connessione.php";

                if(isset($_POST['invia'])){
                    include "connessione.php";
                    $email= $_POST['email'];
                    $pass=md5($_POST['password']);
                    $comandoSQL= "SELECT * FROM tblUtenti WHERE email='$email' AND pass='$pass'";
                    $risultato = $db -> query($comandoSQL);
                    $numRighe= $risultato -> num_rows;
                    if($numRighe == 1)
                    {
                        session_start();
                        $riga = $risultato -> fetch_assoc();
                        $_SESSION['email'] = $email;

                        echo $_SESSION['email'];
                        
                        $comandoSQL2 = "SELECT * FROM tblUtenti WHERE eMail ='".$_SESSION['email']."' AND ifadmin = 1"; 
                        $risultato2 = $db -> query($comandoSQL2);
                        $numRighe2 = $risultato2 -> num_rows;
                        if($numRighe2 == 1)
                            header('Location: gestione.php');
                        else
                            header('Location:areaRiservata.php');
                        
                    } else{
                        echo "<h2> Hai inserito dati errati </h2>";
                        echo "<h2> Stai per essere reindirizzato </h2>";
                        header("refresh:3;url=Login.php");
                    }
                }
    
                
            ?>
    </body>
</html>