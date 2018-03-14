<?php
    //session_start();
    // include_once ("panda_inc_global.php");
    include_once ("panda_member_header.php");
    
    $tplFile = 'template/panda_member_index.tpl';                 //載入樣板
    $tplObj = new TemplatePower($tplFile);
    //var_dump($tplObj);
    //print_r($_POST);
    $tplObj->prepare();

    // print_r($_SESSION['user_level']);
    // print_r($_SESSION);
    if (isset($_SESSION['user_id']) != NULL) {
        $tplObj -> newBlock('member_control');
        $tplObj -> assign ( "user_name", $_SESSION['user_name']);
        $tplObj -> assign ( "user_level", $_SESSION['user_level']);
          
        if ($_SESSION['user_level']=='admin'|| $_SESSION['user_level']=='manager'){
            $tplObj -> newBlock('member_admin');
            

        }
    }else{
        echo '<script language="javascript">alert("Already log out!!\nPlease login again !!!"); location.href = "../exciser1/panda_member_loginandregister.php";</script>'; 
    }

    $tplObj -> printToScreen();