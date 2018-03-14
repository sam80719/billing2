<?php
    ######################
    # 會員刪除控制       #
    # author: Panda      #
    # date  : 20180308   #
    ######################
    include_once ("panda_inc_global.php");
    $user_id = isset($_POST['id'])?$_POST['id']:'';                  
    if(trim($user_id ) == ''){
        $msg = array(
            'error' => true,                                    //如錯誤為error將傳送下一行的msg;
            'msg'   => 'Are you sure to delete this member !!!!'       
        );        
        exit(json_encode($msg));                                //回傳ajax資料
    }
    
    // DELETE FROM `billing_member_4` WHERE `billing_member_4`.`user_id` = 4 
    // print_r($user_id);
    $sql = "DELETE FROM `billing_member_4` where `billing_member_4`.`user_id`=?";

    $msg = array(
        'error' => false,
        'msg'   => 'success'
    );

    if ($DB->Execute($sql, array($user_id)) === false){
        $msg = array(
            'error' => true,
            'msg'   => $DB->ErrorMsg()
        );
        exit(json_encode($msg));
    }
