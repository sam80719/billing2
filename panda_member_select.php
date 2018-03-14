<?php
    ########################
    # 記帳會員選擇控制     #
    # author: Panda        #
    # date  : 20180308     #
    ######################## 
    include_once ("panda_inc_global.php");      
    $id = isset($_POST['id'])?$_POST['id']:'';      
    //print_r($id);
    if(trim($id) == ''){
        $msg = array(
            'error' => true,        
            'msg'   => 'Are you sure to select this item !!!!'       
        );        
        exit(json_encode($msg));                        
    }

    $sql = "SELECT * FROM billing_member_4 WHERE user_id= ?";
        $msg = array(
        'error' => false,
        'msg'   => 'success'
    );
    $rs = $DB->Execute($sql, array($id));
    // print_r($rs);

    if ($rs){
        $selectArray=array();
        // print_r($selectArray);
        while ($arr = $rs->FetchRow()) {    
           
            $selectArray['user_id']=$arr['user_id'];
            $selectArray['user_name']=$arr['user_name'];
            $selectArray['user_email']=$arr['user_email'];
            $selectArray['user_password']=$arr['user_password'];
            $selectArray['user_level']=$arr['user_level'];

        }
        // print_r($selectArray);

        echo json_encode($selectArray);
    }else{
        return false;
    }