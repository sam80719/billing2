<?php
    ########################
    # 記帳會員註冊控制     #
    # author: Panda        #
    # date  : 20180308     #
    ######################## 
    include_once ("panda_inc_global.php");
    // print_r($_POST);
   //Array ( [username] => asdsad [email] => sadsad@fsd.com [password] => sadsa [registerSubmit] => Register Now )
    $user_name = isset($_POST['userName'])?$_POST['userName']:'';        
    if(trim($user_name ) == ''){

        echo '<script language="javascript">alert("Please check column UserName!!!"); location.href = "../exciser12/panda_member_loginandregister.php";</script>';    

        $msg = array(
            'error' => true,
            'msg'   => 'Please check column UserName!!!!'
        );
        exit(json_encode($msg));
    }


    $user_email = isset($_POST['userEmail'])?$_POST['userEmail']:''; 

    if(trim($user_email ) == ""){

        echo '<script language="javascript">alert("Please check column Email!!!!"); location.href = "../exciser12/panda_member_loginandregister.php";</script>'; 

        $msg = array(
            'error' => true,
            'msg'   => 'Please check column Email!!!!'
        );
        // exit();

        exit(json_encode($msg));
    }

    $user_password = isset($_POST['userPassword'])?$_POST['userPassword']:'';        
    if(trim($user_password ) == ''){

        echo '<script language="javascript">alert("Please check column Password!!!!"); location.href = "../exciser12/panda_member_loginandregister.php";</script>'; 
        
        $msg = array(
            'error' => true,
            'msg'   => 'Please check column Password!!!!'
        );
        exit(json_encode($msg));
    }
    
    $user_level='normal';  
    // exit();
    $sql= "INSERT INTO `billing_member_4`( `user_name`, `user_email`, `user_password`, `user_level` ) VALUES( ?, ?, ?, ?)"; 
        $msg = array(
            'error' => false,
            'msg'   => 'success'
        );

    if ($DB->Execute($sql, array($user_name, $user_email,  $user_password, $user_level)) === false) {
        $msg = array(
            'error' => true,
            'msg'   => $DB->ErrorMsg()
        );
        echo json_encode(array('error' => true, 'msg' => "Duplicate account!! Please reg again!!"));
        header("Refresh:0; url=panda_member_loginandregister.php");
    
        // echo '<script language="javascript">alert("Duplicate account!!\nPlease reg again!!"); location.href = "../exciser12/panda_member_loginandregister.php";</script>';
        // exit(header("Location: panda_member_loginandregister.php"));
    }else{
        echo json_encode(array('msg' => "reg success!! "));

        // echo '<script language="javascript">alert("reg success!!"); location.href = "../exciser12/panda_member_loginandregister.php";</script>';

    }



       



 