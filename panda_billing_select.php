<?php

    ##########################
    # 記帳修改畫面資料控制   #
    # author: Panda          #
    # date  : 20180123       #
    ##########################
    session_start();
    include_once ("panda_inc_global.php");      
    //print_r($_POST);                                     
    $id = isset($_POST['id'])?$_POST['id']:'';      
    //print_r($id);
    if(trim($id) == ''){
        $msg = array(
            'error' => true,                                    //如錯誤為error將傳送下一行的msg;
            'msg'   => 'Are you sure to select this item !!!!'       
        );        
        exit(json_encode($msg));                                //回傳ajax資料    
    }

    
    $sql = "SELECT * FROM billing_2 WHERE id= ?";
        $msg = array(
        'error' => false,
        'msg'   => 'success'
    );
    $rs = $DB->Execute($sql, array($id));
    if ($rs){
        $selectArray=array();

        while ($arr = $rs->FetchRow()) {    
           
            $selectArray['id']=$arr['id'];
            $selectArray['subject']=$arr['subject'];
            $selectArray['balance']=$arr['balance'];
            $selectArray['type']=$arr['type'];
            $selectArray['cash']=$arr['cash'];
            $selectArray['input_datetime']=$arr['input_datetime'];
            $selectArray['update_datetime']=$arr['update_datetime'];
        }

        echo json_encode($selectArray);
    }else{
        echo json_encode($msg);
        return false;
    }
    
    
