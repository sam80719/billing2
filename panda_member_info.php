<?php
    ########################
    # 記帳會員資料控制頁面 #
    # author: Panda        #
    # date  : 20180308     #
    ########################    

    include_once ("panda_member_header.php");    
    $tplFile = 'template/panda_member_info.tpl';                 //載入樣板
    $tplObj = new TemplatePower($tplFile);
    //var_dump($tplObj);
    //print_r($_POST);
    $tplObj->prepare();
    $ADODB_FETCH_MODE = ADODB_FETCH_ASSOC;
    // print_r($_SESSION);
    if ($_SESSION['user_level'] == 'admin') {
        $sql ="select * from  billing_member_4 ";
        $rs = $DB->Execute($sql);
        if ($rs){
            $dates=$rs->getArray();
            foreach ($dates as $row){
                $tplObj -> newBlock('list_all');
                $tplObj -> assign ("user_id", htmlspecialchars($row['user_id']));
                $tplObj -> assign ("user_name", htmlspecialchars($row['user_name']));
                $tplObj -> assign ("user_email", htmlspecialchars($row['user_email']));
                $tplObj -> assign ("user_password", htmlspecialchars($row['user_password']));        
                $tplObj -> assign ("user_level", htmlspecialchars($row['user_level']));
            }
        }
    }else{
        // SELECT * FROM `billing_member_4` WHERE `user_level`='manager' OR `user_level`='normal' 
        $sql ="SELECT *FROM `billing_member_4` WHERE `user_level`='manager' OR `user_level`='normal' ";
        $rs = $DB->Execute($sql);
        if ($rs){
            $dates=$rs->getArray();           
            foreach ($dates as $row){
                $tplObj -> newBlock('list_all');
                $tplObj -> assign ("user_id", htmlspecialchars($row['user_id']));
                $tplObj -> assign ("user_name", htmlspecialchars($row['user_name']));
                $tplObj -> assign ("user_email", htmlspecialchars($row['user_email']));
                $tplObj -> assign ("user_password", htmlspecialchars($row['user_password']));        
                $tplObj -> assign ("user_level", htmlspecialchars($row['user_level']));
            }
        }
    }

    $tplObj -> printToScreen();