<?php
    ########################
    # 記帳會員登出控制     #
    # author: Panda        #
    # date  : 20180308     #
    ######################## 
    session_start();
    include_once ("panda_inc_global.php");
                // $_SESSION['user_id'] = $selectArray['user_id'];
                // $_SESSION['user_name'] = $selectArray['user_name'];
                // $_SESSION['user_password'] = $selectArray['user_password'];
                // $_SESSION['user_level'] = $selectArray['user_level'];
    $_SESSION['user_id'] = isset($_SESSION['user_id'])?$_SESSION['user_id']:'';

    unset($_SESSION['user_id']);
    unset($_SESSION['user_name']);
    unset($_SESSION['user_password']);
    unset($_SESSION['user_level']);

    session_destroy();
    echo 'log out.....';
    // die('a');
    echo '<meta http-equiv=REFRESH CONTENT=1;url=panda_member_loginandregister.php>';
    exit();

    // session_destroy();
    // $url = "http://127.0.0.1/dashboard/webdevelopment/exciser1/panda_member_loginandregister.php";
    // echo "<script type='text/javascript'> window.location.href='".$url."';</script>";

