<?php
    ######################
    # 記帳選擇類別控制   #
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

    // SELECT * FROM `billing_type` WHERE `type`= 'food' 
    $sql = "SELECT * FROM `billing_type` WHERE `type`= ?";   
    $msg = array(
        'error' => false,
        'msg'   => 'success'
    );
    $rs = $DB->Execute($sql, array($type));
    if ($rs){
     	$selectArray=array();
    	while ($arr = $rs->FetchRow()) {
    		$selectArray['id']=$arr['id'];
			$selectArray['type']=$arr['type'];
    	}    
        echo json_encode($selectArray);
    }else{
        return false;
    }




   