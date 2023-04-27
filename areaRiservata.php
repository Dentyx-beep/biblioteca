<!DOCTYPE html>
<html>
    <head>
        <title> Area Riservata Utente </title>
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    <body>
        <h1> benvenuto nell'area riservata </h1>
        <?php
            include "connessione.php";
            $indexLibri = "SELECT * FROM tblLibri WHERE preso = 0";
            $risultato = $db -> query($indexLibri);
            if (!$risultato) {
                echo "<h2>non ci sono libri presenti</h2>";
                return;
            } 
            $intestazioni = array( "TITOLO", "GENERE", "EDITORE", "NUMPAGINE","");
        ?>

        
        <table>
            <thead>
                <tr>
                    <?php
                    foreach($intestazioni as $int){
                        ?>
                            <th><?= $int ?></th>
                        <?php
                    }
                    ?>
                </tr>
            </thead>
            <tbody>
                <?php
                    while ($libro = $risultato -> fetch_assoc()){
                        echo "<tr'>";
                        echo "<td>".$libro['titolo']."</td>";
                        echo "<td>".$libro['genere']."</td>";
                        echo "<td>".$libro['editore']."</td>";
                        echo "<td>".$libro['numPagine']."</td>";
                        echo "<td>"; 
                        ?>
                        <form action="<?php echo $_SERVER['PHP_SELF']?>" method="POST"> 
                            <input type="hidden" name="ISBN" value="<?= $libro['ISBN'] ?>" >
                            <button type="submit" name="invia"> invia </button>
                        </form>
                        <?php
                        echo "</td>";
                        echo "</tr>";
                    }
                ?>
            </tbody>
        </table>


        <?php
            if(isset($_POST['invia'])){
                $isbn =  $_POST['ISBN'];
                
                $sql = "SELECT * FROM tblLibri WHERE ISBN= '".$isbn."'";
                $res = $db -> query($sql);
                $libro_scelto = $res -> fetch_assoc();
                echo $libro_scelto['titolo'];
            }
                
        ?>
    </body>
</html>