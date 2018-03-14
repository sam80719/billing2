<?php
    ########################
    # 記帳會員新增控制     #
    # author: Panda        #
    # date  : 20180308     #
    ######################## 
    include_once ("panda_inc_global.php");     
    $user_name = isset($_POST['user_name'])?$_POST['user_name']:'';
    if(trim($user_name ) == ''){
        $msg = array(
            'error' => true,
            'msg'   => 'Please check column name!!!!'
        );
        exit(json_encode($msg));
    }

    $user_email = isset($_POST['user_email'])?$_POST['user_email']:'';
    if(trim($user_email ) == ''){
        $msg = array(
            'error' => true,
            'msg'   => 'Please check option email!!!!'
        );
        exit(json_encode($msg));
    }

    $user_password = isset($_POST['user_password'])?$_POST['user_password']:'';
    if(trim($user_password ) == ''){
        $msg = array(
            'error' => true,
            'msg'   => 'Please check selection password!!!!'
        );
        exit(json_encode($msg));
    }

    $level = isset($_POST['level'])?$_POST['level']:'';
    if(trim($level ) == ''){
        $msg = array(
            'error' => true,
            'msg'   => 'Please check column level!!!!'
        );
        exit(json_encode($msg));
    }

    // INSERT INTO `billing_member_4` (`user_id`, `user_name`, `user_email`, `user_password`, `user_level`, `del_check`) VALUES (NULL, 'panda004', 'panda004@gmail.com', 'panda004', 'admin', ''); 
    $sql = "INSERT INTO `billing_member_4` ( `user_name`, `user_email`, `user_password`, `user_level`) VALUES (?, ?, ?, ?)"; //插入資料
    $msg = array(
        'error' => false,
        'msg'   => 'success'
    );
    //## return error message ##//
    if ($DB->Execute($sql, array($user_name, $user_email, $user_password, $level)) === false) {
        $msg = array(
            'error' => true,
            'msg'   => $DB->ErrorMsg()
        );

    //json_encode($msg);
    }
    echo json_encode($msg);
