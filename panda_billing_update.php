<?php
    ######################
    # 記帳更新資料控制   #
    # author: Panda      #
    # date  : 20180123   #
    ######################

    include_once ("panda_inc_global.php");
    //檢查modal的input
    //$id=$_POST['editID'];
    $id = isset($_POST['editID'])?$_POST['editID']:'';
    $subject = isset($_POST['subject'])?$_POST['subject']:'';       //variable subject
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
    $currentTime = isset($_POST['update_datetime']);
    // echo $currentTime;
    $currentTime = date ("Y-m-d H:i:s" , mktime(date('H')+7, date('i'), date('s'), date('m'), date('d'), date('Y')));
 
    $sql = "UPDATE `billing_2` SET `subject` =?, `balance` =?, `type` =?, `cash` =?, `update_datetime` = ? WHERE `billing_2`.`id` =?";
    
    $msg = array(
        'error' => false,
        'msg'   => 'success'
    );
    
    //## return error message ##//
    if ($DB->Execute($sql, array($subject, $balance, $type, $cash, $currentTime, $id)) === false) {
        $msg = array(
            'error' => true,
            'msg'   => $DB->ErrorMsg()
        );
    }

    echo json_encode($msg);