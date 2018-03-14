<?php
    ########################
    # 記帳會員更新控制     #
    # author: Panda        #
    # date  : 20180308     #
    ######################## 
    include_once ("panda_inc_global.php");
    // print_r($_POST);
    $user_id = isset($_POST['editID'])?$_POST['editID']:'';
    $user_name = isset($_POST['editName'])?$_POST['editName']:'';       
    if(trim($user_name ) == ''){
        $msg = array(
            'error' => true,
            'msg'   => 'Please check column Name!!!!'
        );
        exit(json_encode($msg));
    }

    $user_email = isset($_POST['editMail'])?$_POST['editMail']:'';
    if(trim($user_email ) == ''){
        $msg = array(
            'error' => true,
            'msg'   => 'Please check column mail!!!!'
        );
        exit(json_encode($msg));
    }

    $user_password = isset($_POST['editPassword'])?$_POST['editPassword']:'';
    if(trim($user_password ) == ''){
        $msg = array(
            'error' => true,
            'msg'   => 'Please check selection password!!!!'
        );
        exit(json_encode($msg));
    }

    $user_level = isset($_POST['level'])?$_POST['level']:'';
    if(trim($user_level ) == ''){
        $msg = array(
            'error' => true,
            'msg'   => 'Please check column level!!!!'
        );
        exit(json_encode($msg));
    }


    $sql = "UPDATE `billing_member_4` SET `user_name` =?, `user_email` =?, `user_password` =?, `user_level` =? WHERE `billing_member_4`.`user_id` =?";
    //UPDATE `billing` SET `subject` = 'panda test1', `balance` = 'expence', `type` = 'food', `update_datetime` = CURRENT_TIMESTAMP WHERE `billing`.`id` = 12;   //SQL更新語法

    // UPDATE `billing_member_4` SET `user_name` = 'panda006', `user_email` = 'panda006@gmail.com', `user_password` = 'panda006', `user_level` = 'admin' WHERE `billing_member_4`.`user_id` = 13; 
    $msg = array(
        'error' => false,
        'msg'   => 'success'
    );
    
    //## return error message ##//
    if ($DB->Execute($sql, array($user_name, $user_email, $user_password, $user_level, $user_id)) === false) {
        $msg = array(
            'error' => true,
            'msg'   => $DB->ErrorMsg()
        );
    }

    echo json_encode($msg);