<?php
    ######################
    # 記帳首頁           #
    # author: Panda      #
    # date  : 20180123   #
    ######################

    include_once ("panda_inc_global.php");
    include_once ("panda_member_header.php");
    $tplFile = 'template/panda_billing.tpl';                 //載入樣板
    $tplObj = new TemplatePower($tplFile);
    //var_dump($tplObj);
    $tplObj->prepare();                             //分析樣板
    
    // Array ( [user_id] => 9 [user_name] => panda001 [user_password] => panda001 [user_level] => normal )
    // print_r($_SESSION);

    $searchTerm = isset($_POST['searchTerm'])?$_POST['searchTerm']:'';    
    if(trim($searchTerm ) == ''){
        $msg = array(
            'error' => true,                                    //如錯誤為error將傳送下一行的msg;
            'msg'   => 'Are you sure to search this item !!!!'       
        );        
        //exit(json_encode($msg));                                //回傳ajax資料
    }
    // $type = isset($_POST['type']);
    $user_level = isset($_SESSION['user_level']);


    $ADODB_FETCH_MODE = ADODB_FETCH_NUM;
    $type_sql = "SELECT `type` FROM `billing_type` GROUP BY `type` ORDER BY `billing_type`.`type` ASC ";
    $rs_type_sql = $DB->Execute($type_sql);
    $datas = $rs_type_sql->getArray();
    $type_count = count($datas); // 計算type陣列長度 
    $row=array();
    if ($rs_type_sql) {
        foreach($datas as $row){
            $tplObj -> newBlock('type_select');
            $tplObj -> assign ("row", htmlspecialchars($row[0]));
            $tplObj -> newBlock('type_select_2');
            $tplObj -> assign ("row", htmlspecialchars($row[0]));
            $tplObj -> newBlock('type_select_3');
            $tplObj -> assign ("row", htmlspecialchars($row[0]));
            $tplObj -> newBlock('type_select_4');
            $tplObj -> assign ("row", htmlspecialchars($row[0]));
            $tplObj -> newBlock('type_select_5');
            $tplObj -> assign ("row", htmlspecialchars($row[0]));                    
        }  
    }
    // print_r($datas);
    $allow_arr = call_user_func_array('array_merge',$datas); // 二維轉一維陣列
    // print_r($allow_arr);
    // $allow_arr = array('food', 'clothes', 'housing', 'transportation', 'education', 'entertainment');   //filiter丟的資料
    
    // $type = isset($_GET['type']) && in_array($_GET['type'],$allow_arr)?$_GET['type']:'all';
    //檢查filiter是否有丟出值，否則all data顯示全資料    
    $ADODB_FETCH_MODE = ADODB_FETCH_ASSOC;          //宣告選取模式



    
    if ($_SESSION['user_level'] == 'normal') {  

        $subsql="";
        $arr = Array();
        if(isset($_GET['type']) && in_array($_GET['type'], $allow_arr)){
            $subsql=" and type = ?";
            $arr[] = $_GET['type'];
        }

        if(isset($_POST['searchTerm'])) {
            $subsql=" and subject = ? ";
            $arr[] = $_POST['searchTerm'];
        }

        if(isset($_SESSION['user_name'])) {
            $subsql_1=" and creat_user = ? ";
            $arr[] = $_SESSION['user_name'];
        }

        $sql ="select * from  billing_2 where 1=1 ";
        // $sql ="select * from  billing_1";

        $sql.=$subsql.$subsql_1;
        $rs = $DB->Execute($sql , $arr);


        //$rs = $DB->Execute('select * from billing '.$where, $where_val);        //選擇表單 (filiter)
        //echo 'select * from billing '.$where ;                                //測試filiter篩選的位置 
        if($rs){
            $sum=$income_sum=$expence_sum=0;
            $datas = $rs->getArray();                                           //取得$rs裡的陣列
            foreach($datas as $row){                                            //列印出陣列
                
                $tplObj -> newBlock('list');                                    //載入區塊list

                $tplObj -> assign ("id", htmlspecialchars($row['id']));                         //宣告變數{id| = $row['id']
                $tplObj -> assign ("input_datetime", htmlspecialchars($row['input_datetime'])); //宣告變數{input_datetime} = $row['input_datetime']
                $tplObj -> assign ("subject", htmlspecialchars($row['subject']));               //宣告變數{subject} = $row['subject']
                $tplObj -> assign ("balance", htmlspecialchars($row['balance']));
                //宣告變數{balance} = $row['balance']
                $tplObj -> assign ("type", htmlspecialchars($row['type']));
                //宣告變數{type} = $row['type']
                $tplObj -> assign ("cash", htmlspecialchars($row['cash']));                     //宣告變數{cash} = $row['cash']
                
            /*
            //print_r($datas);
            //Array (
                [0] => Array ( [id] => 1 [input_datetime] => 2018-01-18 01:40:11 [subject] => raman [balance] => expence [type] => food [cash] => 180 [update_datetime] => 2018-01-18 01:40:11 ) 
                [1] => Array ( [id] => 2 [input_datetime] => 2018-01-18 09:32:42 [subject] => soda [balance] => expense [type] => food [cash] => 35 [update_datetime] => 2018-01-18 09:32:42 )
            */
                
                if($row['balance']=='expence'){
                    $expence_sum+=$row['cash'];
                }else{
                    $income_sum+=$row['cash'];
                }
                $sum=$income_sum-$expence_sum;
                //$sum+=$row['cash'];
            }
            $tplObj -> newBlock('count');

            $tplObj -> assign ("sum",$sum);
            $tplObj -> assign ("expence_sum",$expence_sum);
            $tplObj -> assign ("income_sum",$income_sum);
        }
  
    }else if ($_SESSION['user_level']=='admin' OR $_SESSION['user_level']=='manager'){

        $tplObj -> newBlock('member_admin');
        $subsql="";
        $arr = Array();
        if(isset($_GET['type']) && in_array($_GET['type'], $allow_arr)){
            $subsql=" and type = ?";
            $arr[] = $_GET['type'];
        }

        if(isset($_POST['searchTerm'])) {
            $subsql=" and subject = ? ";
            $arr[] = $_POST['searchTerm'];
        }


        $sql ="select * from  billing_2 where 1=1 ";
        // echo $sql;
        $sql.=$subsql;
        $rs = $DB->Execute($sql , $arr);

        if($rs){
            $sum=$income_sum=$expence_sum=0;
            $datas = $rs->getArray();
            foreach($datas as $row){
                
                $tplObj -> newBlock('list'); 
                $tplObj -> assign ("id", htmlspecialchars($row['id'])); 
                $tplObj -> assign ("input_datetime", htmlspecialchars($row['input_datetime'])); 
                $tplObj -> assign ("subject", htmlspecialchars($row['subject']));
                $tplObj -> assign ("balance", htmlspecialchars($row['balance']));
                $tplObj -> assign ("type", htmlspecialchars($row['type']));
                $tplObj -> assign ("cash", htmlspecialchars($row['cash'])); 
                
                if($row['balance']=='expence'){
                    $expence_sum+=$row['cash'];
                }else{
                    $income_sum+=$row['cash'];
                }
                $sum=$income_sum-$expence_sum;

            }
            $tplObj -> newBlock('count');

            $tplObj -> assign ("sum",$sum);
            $tplObj -> assign ("expence_sum",$expence_sum);
            $tplObj -> assign ("income_sum",$income_sum);
        }


    }else{
        echo '<script language="javascript">alert("Already log out!!\nPlease login again !!!"); location.href = "../exciser1/panda_member_loginandregister.php";</script>';

    }

    $tplObj -> printToScreen();



    

    
