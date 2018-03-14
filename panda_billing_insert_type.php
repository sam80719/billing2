<?php
    ######################
    # 記帳新增類別控制   #
    # author: Panda      #
    # date  : 20180308   #
    ######################    

    include_once ("panda_inc_global.php");
    $type = isset($_POST['type'])?$_POST['type']:'';
    if(trim($type ) == ''){
        $msg = array(
            'error' => true,
            'msg'   => 'Please check selection Type!!!!'
        );
        exit(json_encode($msg));
    }

// INSERT INTO `billing_type` (`id`, `type`) VALUES (NULL, 'clothes'); 
    $sql = "INSERT INTO `billing_type` (`type`) VALUES (?)";
    // $sql = "DELETE FROM `billing_type` WHERE `billing_type`.`type` =?";

    
    $msg = array(
        'error' => false,
        'msg'   => 'success'
    );
    if ($DB->Execute($sql, array($type)) === false){
        $msg = array(
            'error' => true,
            'msg'   => $DB->ErrorMsg()
        );
        exit(json_encode($msg));
    }