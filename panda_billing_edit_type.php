<?php

    ######################
    # 記帳修改類別控制   #
    # author: Panda      #
    # date  : 20180308   #
    ######################

    //version 1
    include_once ("panda_inc_global.php");
    $id = isset($_POST['typeID'])?$_POST['typeID']:'';
    $type = isset($_POST['selectType'])?$_POST['selectType']:'';
    if(trim($type) == ''){
        $msg = array(
            'error' => true,
            'msg'   => 'Please check column Type!!!!'
        );
        exit(json_encode($msg));
    }

    // 用id找舊的type，將舊type設定$a
    $sql = "SELECT * FROM billing_type WHERE id=?";
    $msg = array(
        'error' => false,
        'msg'   => 'success'
    );        
    $rs = $DB->Execute($sql, array($id));
    if ($rs){
        $selectArray=array();
        while ($arr = $rs->FetchRow()) {
            $selectArray['id']=$arr['id'];
            $selectArray['type']=$arr['type'];
        }    
        echo json_encode($msg);
    }else{
        return false;
    } 
    $a=isset($selectArray['type'])?$selectArray['type']:'';
    // print_r($a);


    //接收post的id, type更新billing_type的資料
    $sql = "UPDATE `billing_type` SET `type` =?WHERE `billing_type`.`id` =?";    
    $msg = array(
        'error' => false,
        'msg'   => 'success'
    );    
    if ($DB->Execute($sql, array($type, $id)) === false) {
        $msg = array(
            'error' => true,
            'msg'   => $DB->ErrorMsg()
        );
        exit(json_encode($msg));
    }
 
    //更新billing_1的type，where=$a
    $sql = "UPDATE `billing_2` SET `type` =? WHERE `billing_2`.`type` =?";
        $msg = array(
            'error' => false,
            'msg'   => 'success!!'
        );
    if ($DB->Execute($sql, array($type, $a)) === false){
        $msg = array(
            'error' => true,
            'msg'   => $DB->ErrorMsg()
        );            
        exit(json_encode($msg));
    }


    // // //id 批次修改
    // // // 先撈取billing_1的最終id
    // // $sql = "SELECT *FROM billing_1 WHERE type=?";
    // // $msg = array(
    // //     'error' => false,
    // //     'msg'   => 'success'
    // // );
    // // $rs = $DB->Execute($sql, array($type));
    // // if ($rs){
    // //     $selectArray=array();       
    // //     while ($arr = $rs->FetchRow()) {
    // //         $selectArray['id']=$arr['id'];
    // //         $selectArray['type']=$arr['type'];
    // //     }
    // //     $b=isset($selectArray['id'])?$selectArray['id']:'';
    // //     // print_r($b);
    // //     $c=0;
    // //     while ($c<$b) {
    // //         $sql = "UPDATE `billing_1` SET `type` =? WHERE `billing_1`.`type` =?AND`billing_1`.`id` =?";
    // //             $msg = array(
    // //                 'error' => false,
    // //                 'msg'   => 'success!!'
    // //             );
    // //             if ($DB->Execute($sql, array($type, $a ,$c)) === false){
    // //                 $msg = array(
    // //                     'error' => true,
    // //                     'msg'   => $DB->ErrorMsg()
    // //                 );            
    // //                 exit(json_encode($msg));
    // //             }
    // //         $b++;

    // //     }            
    // //     echo json_encode($msg);
    // // }else{
    // //     return false;
    // // }



 
    // // //version 2
    // include_once ("panda_inc_global.php");
    // $id = isset($_POST['typeID'])?$_POST['typeID']:'';
    // $type = isset($_POST['selectType'])?$_POST['selectType']:'';
    // if(trim($type) == ''){
    //     $msg = array(
    //         'error' => true,
    //         'msg'   => 'Please check column Type!!!!'
    //     );
    //     exit(json_encode($msg));
    // }
    // // UPDATE `billing_type` t1, `billing_1` t2 SET t1.type = 'entertainment', t2.type = 'entertainment' WHERE t1.type = t2.type AND t1.id = 3 
    // $sql = "UPDATE `billing_type` t1, `billing_1` t2 SET t1.type =?, t2.type=?  WHERE t1.type = t2.type AND t1.id =?";
    // if ($DB->Execute($sql, array($type, $type, $id)) === false){
    //     $msg= array(
    //         'error' => true,
    //         'msg'   => $DB->ErrorMsg()
    //     );
    //     exit(json_encode($msg));
    // }



    

