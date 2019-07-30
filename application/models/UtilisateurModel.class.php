<?php 
class UtilisateurModel {
 const UTILISATEUR = 
    "SELECT `login`,`motDePasse` 
    FROM `utilisateur` 
    WHERE `login` = :login AND `motDePasse` = :password";



    function findUserByLogin (string $login, string $password)
    {
        $query= $dataBase->prepare(self::UTILISATEUR);
        $error = $query->execute(['login' => $login, 'password' => $password]);
        $result = $query -> fetch();

        return $user;
    }


const REGISTER = 




}





?>