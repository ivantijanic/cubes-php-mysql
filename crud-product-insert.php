<?php
session_start();

require_once __DIR__ . '/models/m_users.php';

if (!isUserLoggedIn()) {
	header('Location: /login.php');
	die();
}


require_once __DIR__ . '/models/m_products.php';
require_once __DIR__ . '/models/m_categories.php';
require_once __DIR__ . '/models/m_brands.php';

//ovde se prihvataju vrednosti polja, popisati sve kljuceve i pocetne vrednosti
$formData = array(
	'category_id' => '',
	'brand_id' => '',
	'title' => ''
);

//ovde se smestaju greske koje imaju polja u formi
$formErrors = array();


//uvek se prosledjuje jedno polje koje je indikator da su podaci poslati sa forme
//odnosno da je korisnik pokrenuo neku akciju
if (isset($_POST["task"]) && $_POST["task"] == "naziv Taska") {
	
	/*********** filtriranje i validacija polja ****************/
	
	/*********** filtriranje i validacija polja ****************/
	
	
	//Ukoliko nema gresaka 
	if (empty($formErrors)) {
		//Uradi akciju koju je korisnik trazio
	}
}



$brandList = brandsGetList();
$categoryList = categoriesGetListByGroup();

require_once __DIR__ . '/views/layout/header.php';
require_once __DIR__ . '/views/templates/t_crud-product-insert.php';
require_once __DIR__ . '/views/layout/footer.php';
