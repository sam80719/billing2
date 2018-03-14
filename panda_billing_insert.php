<?php

    ######################
    # 記帳抽入頁面       #
    # author: Panda      #
    # date  : 20180123   #
    ######################
    session_start();
    include_once ("panda_inc_global.php");

    //print_r(($_POST['photo']);

    $subject = isset($_POST['subject'])?$_POST['subject']:'';        //variable subject
    if(trim($subject ) == ''){
        $msg = array(
            'error' => true,
            'msg'   => 'Please check column Subject!!!!'
        );
        exit(json_encode($msg));
    }

    $balance = isset($_POST['balance'])?$_POST['balance']:'';
    if(trim($balance ) == ''){
        $msg = array(
            'error' => true,
            'msg'   => 'Please check option Balance!!!!'
        );
        exit(json_encode($msg));
    }

    $type = isset($_POST['type'])?$_POST['type']:'';
    if(trim($type ) == ''){
        $msg = array(
            'error' => true,
            'msg'   => 'Please check selection Type!!!!'
        );
        exit(json_encode($msg));
    }

    $cash = isset($_POST['cash'])?$_POST['cash']:'';
    if(trim($cash ) == ''){
        $msg = array(
            'error' => true,
            'msg'   => 'Please check column Cash!!!!'
        );
        exit(json_encode($msg));
    }

    $creat_user = $_SESSION['user_name'];

    // $photo = isset($_POST['photo'])?$_POST['photo']:'';
    // $photo = iconv("utf-8", "gb2312", $photo);
    // $fp = fopen($photo, "rb");
    // $image = addslashes(fread($fp, filesize($photo)));

    // exit();
    $sql = "INSERT INTO `billing_2` ( `subject`, `balance`, `type`, `cash`, `creat_user`) VALUES (?, ?, ?, ?, ?)"; //插入資料
    $msg = array(
        'error' => false,
        'msg'   => 'success!!!!!'
    );
    //## return error message ##//
    if ($DB->Execute($sql, array($subject, $balance, $type, $cash, $creat_user)) === false) {
    // if ($DB->Execute($sql, array($subject, $balance, $type, $cash, $creat_user, $image)) === false) {    
        $msg = array(
            'error' => true,
            'msg'   => $DB->ErrorMsg()
        );

    exit(json_encode($msg));
    }
    echo json_encode($msg);

        
