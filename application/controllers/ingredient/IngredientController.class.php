<?php

class IngredientController
{
    public function httpGetMethod(Http $http, array $queryFields)
    {
    	
    }

    public function httpPostMethod(Http $http, array $formFields)
    {
    	$model = new IngredientModel(new Database());

		$ingredient = $model->addIngredient($formFields['name'], $formFields['prix'], $formFields['type']);
    }
}