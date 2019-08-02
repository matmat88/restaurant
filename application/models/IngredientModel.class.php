<?php
final class IngredientModel {
    private $db;

    function __construct (Database $database) {
        $this->db = $database;
    }

    public function findByType(string $type){
        $queryByType = 
            "SELECT I.`id` AS id, I.`name` AS iName, I.`type` AS type, M.`name`AS mName
             FROM `ingredient` AS I
             INNER JOIN `media` AS M ON I.idMedia = M.`id`
             WHERE I.`type`= ? ";
        $result = $this->db->query($queryByType, [$type]);
        return $result;
    }



    function addIngredient (string $name, string $prix, string $type, int $idMedia) {
        $register =
        "INSERT INTO `ingredient`(`name`, `prix`,`type`, `idMedia`)  
        VALUES (:name, :prix, :type, :idMedia)";
        $parameters['name']=$name;
        $parameters['prix']=$prix;
        $parameters['type']= $type;
        $parameters['idMedia']= $idMedia;
        $key= $this->db->executeSql($register, $parameters);
        return $key;
    }

    function addDessert (string $name, string $prix, string $type) {
        $register =
        "INSERT INTO `element`(`name`, `prix`,`type`)  
        VALUES (:name, :prix, :type)";
        $parameters['name']=$name;
        $parameters['prix']=$prix;
        $parameters['type']= $type;
        $key= $this->db->executeSql($register, $parameters);
        return $key;
    }
}

