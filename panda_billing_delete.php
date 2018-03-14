<?php

    ######################
    # 記帳刪除資料控制   #
    # author: Panda      #
    # date  : 20180123   #
    ######################

    session_start();
    include_once ("panda_inc_global.php");  

    $id = isset($_POST['id'])?$_POST['id']:'';                  
    if(trim($id ) == ''){
        $msg = array(
            'error' => true,                                    //如錯誤為error將傳送下一行的msg;
            'msg'   => 'Are you sure to delete this item !!!!'       
        );        
        exit(json_encode($msg));                                //回傳ajax資料
    }
    $action_check='deleteItem'; 
 
     // UPDATE `billing_1` SET `action_check` = 'deleteItem' WHERE `billing_1`.`id` = 12; //sql 
    $sql = "DELETE FROM `billing_2` where `id`=?";
    $msg = array(
        'error' => false,
        'msg'   => 'success!!'
    );
    if ($DB->Execute($sql, array($id)) === false){
        $msg = array(
            'error' => true,
            'msg'   => $DB->ErrorMsg()
        );            
        exit(json_encode($msg));
    }
    echo json_encode($msg);
        

    

         

    
