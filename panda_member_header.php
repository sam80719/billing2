<?php
    ######################
    # 記帳標題選擇列     #
    # author: Panda      #
    # date  : 20180308   #
    ######################

    session_start();
    include_once ("panda_inc_global.php");   
    $tplFile = 'template/panda_member_header.tpl';                 //載入樣板
    $tplObj = new TemplatePower($tplFile);
    //var_dump($tplObj);

    $tplObj->prepare();


    $tplObj -> printToScreen();
    