<?php
final class FormuleModel {
    const QUERY_ALLFORMULE = "SELECT * FROM `formule` WHERE 1";

    private $db;

    function __construct (Database $database) {
        $this->db = $database;
    }

    public function findFormule(){
        $result = $this->db->query(self::QUERY_ALLFORMULE);
        return $result;
    }

}

