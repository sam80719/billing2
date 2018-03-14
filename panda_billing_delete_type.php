<?php
    ######################
    # 記帳刪除類別控制   #
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

    // DELETE FROM `billing_1` WHERE `billing_1`.`type` = 'entertainment' 
    // $sql = "DELETE FROM `billing_1` WHERE `billing_1`.`type` =?";

    // DELETE X.*, Y.* FROM `billing_type` X, `billing_1` Y WHERE X.type = Y.type AND X.type = 'clothes' 
    $sql = "DELETE X.*, Y.* FROM `billing_type` X, `billing_2` Y WHERE X.type = Y.type AND X.type =?";
    $msg = array(
        'error' => false,
        'msg'   => 'success'
    );
    if ($DB->Execute($sql, array($type)) === false){
        $msg = array(
            'error' => true,
            'msg'   => $DB->ErrorMsg()
        );
        exit( json_encode($msg));
    }

    // DELETE FROM `billing_type` WHERE `billing_type`.`type` = 'dsd' 
    $sql = "DELETE FROM `billing_type` WHERE `billing_type`.`type` =?";
    $msg = array(
        'error' => false,
        'msg'   => 'success'
    );
    if ($DB->Execute($sql, array($type)) === false){
        $msg = array(
            'error' => true,
            'msg'   => $DB->ErrorMsg()
        );
        exit( json_encode($msg));
    }




