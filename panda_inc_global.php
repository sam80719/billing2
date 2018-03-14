<?php
include_once 'panda_inc_config.php';
include("ADOdb.inc.php"); 
include_once 'lib/TemplatePower3.0.2.1/class.TemplatePower.inc.php';
// DATABASES:
// NOTE: All settings are defined as constants in inc.config.php
// 1: Create a link to the MySQL server and store the MySQL link identifier in a variable named $DB

/*$DB = mysqli_connect(DB_HOST, DB_USER, DB_PASS) or die("Unable to connect to DB");
// 2: Select the MySQL database to use as defined by DB_NAME
mysqli_select_db( $DB, DB_NAME) or die("Unable to select Database : ".DB_NAME);
*/
    $DB = ADONewConnection('mysqli');						//creat a connect with mysql	
    $DB -> Pconnect(DB_HOST, DB_USER, DB_PASS, DB_NAME);	//acess mysql db

   