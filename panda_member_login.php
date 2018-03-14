<?php
    ########################
    # 記帳會員登入控制     #
    # author: Panda        #
    # date  : 20180308     #
    ######################## 
    session_start();  
    include_once ("panda_inc_global.php");

    // print_r($_POST);
    // Array ( [loginUserName] => sam80719 [loginPassword] => 123456 [loginSubmit] => Log In )

    if (isset($_POST['loginSubmit'])) {

    $user_name = isset($_POST['loginUserName'])?$_POST['loginUserName']:'';       
    if(trim($user_name ) == ''){

        echo '<script language="javascript">alert("Please check column UserName!!!"); location.href = "../exciser1/panda_member_loginandregister.php";</script>';
        $msg = array(
            'error' => true,
            'msg'   => 'Please check column UserName!!!!!!!'
        );                
    }

    $user_password = isset($_POST['loginPassword'])?$_POST['loginPassword']:'';        
    if(trim($user_password ) == ''){

        echo '<script language="javascript">alert("Please check column Password!!!"); location.href = "../exciser1/panda_member_loginandregister.php";</script>';        
        $msg = array(
            'error' => true,
            'msg'   => 'Please check column Password!!!!!!!'
        );
    }
   
    $sql ="SELECT * FROM billing_member_4 WHERE user_name= ?";
   
    $rs = $DB->Execute($sql, array($user_name));
    $selectArray=array();

    if ($arr = $rs->FetchRow()){
            $selectArray['user_id']         =$arr['user_id'];
            $selectArray['user_name']       =$arr['user_name'];
            $selectArray['user_email']      =$arr['user_email'];
            $selectArray['user_password']   =$arr['user_password'];
            $selectArray['user_level']      =$arr['user_level'];         
    }else{

            $selectArray['user_name']       =$arr['user_name'];
        
    }
    // print_r($selectArray);
            if ($selectArray['user_name']==$user_name && $selectArray['user_password']==$_POST['loginPassword']) {    
                $_SESSION['user_id'] = $selectArray['user_id'];
                $_SESSION['user_name'] = $selectArray['user_name'];
                $_SESSION['user_password'] = $selectArray['user_password'];
                $_SESSION['user_level'] = $selectArray['user_level'];
                // exit();
                echo '<meta http-equiv=REFRESH CONTENT=0.01;url=panda_member_index.php>';
            }else{
                echo '<script language="javascript">alert("Duplicate account!!\nPlease reg again!!");</script>';
                // exit();
                echo '<meta http-equiv=REFRESH CONTENT=0.01;url=panda_member_loginandregister.php>';                
            }
    }
