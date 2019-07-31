<?php
final class IngredientModel {
    const QUERY_ALLFORMULE = "SELECT `name` FROM `formule` WHERE 1";

    private $db;

    function __construct (Database $database) {
        $this->db = $database;
    }

    public function findByType(string $type){
        $queryByType = "SELECT `name`FROM `ingredient` WHERE `type`= ? ";
        $result = $this->db->query($queryByType, [$type]);
        return $result;
    }

    public function findFormule(){
        $result = $this->db->query(self::QUERY_ALLFORMULE);
        return $result;
    }

}