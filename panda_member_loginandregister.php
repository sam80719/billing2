<?php
    ########################
    # 記帳會員登入與註冊   #
    # author: Panda        #
    # date  : 20180308     #
    ######################## 

    include_once ("panda_inc_global.php");
    // print_r($_POST);
    // print_r($_SESSION);
    $tplFile = 'template/panda_member_loginandregister.tpl';                 //載入樣板
    $tplObj = new TemplatePower($tplFile);
    // var_dump($tplObj);

    $tplObj->prepare();
    
    $tplObj -> printToScreen();
    