<?php 
final class UtilisateurModel {
 const UTILISATEUR = 
    "SELECT `login`,`motDePasse` 
    FROM `utilisateur` 
    WHERE `login` = :login AND `motDePasse` = :password";

    private $db;

    function __construct (Database $database) {
        $this->db = $database;
    }


    function findUserByLogin (string $login, string $password)
    {
        $query= $this->db->prepare(self::UTILISATEUR);
        $error = $query->execute(['login' => $login, 'password' => $password]);
        $result = $query -> fetch();

        return $user;
    }


    function addUser (string $firstName, string $lastName, string $login, string $motDePasse, string $mail) {
        $register =
            "INSERT INTO `utilisateur`(`firstName`, `lastName`,`login`, `motDePasse`, `mail`)  
             VALUES (:firstName, :lastName, :login, :motDePasse,  :mail)";
        $parameters['firstName']=$firstName;
        $parameters['lastName']=$lastName;
        $parameters['login']= $login;
        $parameters['motDePasse']=password_hash($motDePasse, PASSWORD_DEFAULT);
        $parameters['mail']= $mail;
        $key= $this->db->executeSql($register, $parameters);
        return $key;
    }




}





?>