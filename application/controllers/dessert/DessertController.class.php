<?php

class DessertController
{
    public function httpGetMethod(Http $http, array $queryFields)
    {
    	
    }


public function httpPostMethod(Http $http, array $formFields)
    {
		$model = new IngredientModel (new Database());
        $user = $model -> addDessert ($formFields['name'], $formFields['prix'], $formFields['type']);

		$http->RedirectTo('/ingredient');
        
    }

}
