<!DOCTYPE html>
<html>

<head>
    <title>Login and Register</title>
    <meta charset="UTF-8">
    <meta http-equiv="cache-control" content="no-cache" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style type="text/css">
    body {
        padding-top: 90px;
    }

    .panel-login {
        border-color: #ccc;
        -webkit-box-shadow: 0px 2px 3px 0px rgba(0, 0, 0, 0.2);
        -moz-box-shadow: 0px 2px 3px 0px rgba(0, 0, 0, 0.2);
        box-shadow: 0px 2px 3px 0px rgba(0, 0, 0, 0.2);
    }

    .panel-login>.panel-heading {
        color: #00415d;
        background-color: #fff;
        border-color: #fff;
        text-align: center;
    }

    .panel-login>.panel-heading a {
        text-decoration: none;
        color: #666;
        font-weight: bold;
        font-size: 15px;
        -webkit-transition: all 0.1s linear;
        -moz-transition: all 0.1s linear;
        transition: all 0.1s linear;
    }

    .panel-login>.panel-heading a.active {
        color: #029f5b;
        font-size: 18px;
    }

    .panel-login>.panel-heading hr {
        margin-top: 10px;
        margin-bottom: 0px;
        clear: both;
        border: 0;
        height: 1px;
        background-image: -webkit-linear-gradient(left, rgba(0, 0, 0, 0), rgba(0, 0, 0, 0.15), rgba(0, 0, 0, 0));
        background-image: -moz-linear-gradient(left, rgba(0, 0, 0, 0), rgba(0, 0, 0, 0.15), rgba(0, 0, 0, 0));
        background-image: -ms-linear-gradient(left, rgba(0, 0, 0, 0), rgba(0, 0, 0, 0.15), rgba(0, 0, 0, 0));
        background-image: -o-linear-gradient(left, rgba(0, 0, 0, 0), rgba(0, 0, 0, 0.15), rgba(0, 0, 0, 0));
    }

    .panel-login input[type="text"],
    .panel-login input[type="email"],
    .panel-login input[type="password"] {
        height: 45px;
        border: 1px solid #ddd;
        font-size: 16px;
        -webkit-transition: all 0.1s linear;
        -moz-transition: all 0.1s linear;
        transition: all 0.1s linear;
    }

    .panel-login input:hover,
    .panel-login input:focus {
        outline: none;
        -webkit-box-shadow: none;
        -moz-box-shadow: none;
        box-shadow: none;
        border-color: #ccc;
    }

    .btn-login {
        background-color: #59B2E0;
        outline: none;
        color: #fff;
        font-size: 14px;
        height: auto;
        font-weight: normal;
        padding: 14px 0;
        text-transform: uppercase;
        border-color: #59B2E6;
    }

    .btn-login:hover,
    .btn-login:focus {
        color: #fff;
        background-color: #53A3CD;
        border-color: #53A3CD;
    }

    .btn-register {
        background-color: #1CB94E;
        outline: none;
        color: #fff;
        font-size: 14px;
        height: auto;
        font-weight: normal;
        padding: 14px 0;
        text-transform: uppercase;
        border-color: #1CB94A;
    }

    .btn-register:hover,
    .btn-register:focus {
        color: #fff;
        background-color: #1CA347;
        border-color: #1CA347;
    }
    </style>
</head>
<div class="container">
    <div class="row">
        <div class="col-md-6 col-md-offset-3">
            <div class="panel panel-login">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-xs-6">
                            <a href="#" class="active" id="loginFormLink">Login</a>
                        </div>
                        <div class="col-xs-6">
                            <a href="#" id="registerFormLink">Register</a>
                        </div>
                    </div>
                    <hr>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-lg-12">
                            <!-- login form -->
                            <form id="loginForm" action="panda_member_login.php" method="POST" role="form" style="display: block;">
                                <div class="form-group">
                                    <input type="text" name="loginUserName" id="loginUserName" tabindex="1" class="form-control" placeholder="Username" value="" required="required">
                                </div>
                                <div class="form-group">
                                    <input type="password" name="loginPassword" id="loginPassword" tabindex="2" class="form-control" placeholder="Password">
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-sm-6 col-sm-offset-3">
                                            <!-- <input type="submit" name="loginSubmit" id="loginSubmit" tabindex="4" class="form-control btn btn-login" value="Log In" onclick="login()"> -->
                                            <input type="submit" name="loginSubmit" id="loginSubmit" tabindex="4" class="form-control btn btn-login" value="Log In" required="required">
                                        </div>
                                    </div>
                                </div>
                            </form>
                            <!-- register form -->
                            <form id="registerForm" action="panda_member_signup1.php" method="POST" role="form" style="display: none;" >
                            <!-- <form id="registerForm" action="" method="POST" role="form" style="display: none;"> -->
                                <div class="form-group">
                                    <input type="text" name="userName" id="userName" tabindex="1" class="form-control" placeholder="Username" value="" >
                                </div>
                                <div class="form-group">
                                    <input type="email" name="userEmail" id="userEmail" tabindex="2" class="form-control" placeholder="Email Address" value="" required="required">
                                </div>
                                <div class="form-group">
                                    <input type="password" name="userPassword" id="userPassword" tabindex="3" class="form-control" placeholder="Password" required="required">
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-sm-6 col-sm-offset-3">
                                            <input type="button" name="registerSubmit" id="registerSubmit" tabindex="4" class="form-control btn btn-register" value="Register Now" onclick="register()">
                                            <!-- <input type="submit" name="registerSubmit" id="registerSubmit" tabindex="4" class="form-control btn btn-register" value="Register Now" > -->
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(function() {

    $('#loginFormLink').click(function(e) {
        $("#loginForm").delay(100).fadeIn(100);
        $("#registerForm").fadeOut(100);
        $('#registerFormLink').removeClass('active');
        $(this).addClass('active');
        e.preventDefault();
    });
    $('#registerFormLink').click(function(e) {
        $("#registerForm").delay(100).fadeIn(100);
        $("#loginForm").fadeOut(100);
        $('#loginFormLink').removeClass('active');
        $(this).addClass('active');
        e.preventDefault();
    });

});

// window.onload = function() {
//     if(!window.location.hash) {
//         window.location = window.location + '#loaded';
//         window.location.reload();
//     }
// }

// history.go(0);

function register() {

    if ($('#userName').val() == '') {
        alert('Please check column UserName!');
        return false;
    }

    var email =  $('#userEmail').val();
    if (email == '' || !validateEmail(email)) {
        alert('Please check column Email!');
        return false;    
    }


    if ($('#userPassword').val() == '') {
        alert('Please check column Password!');
        return false;
    }

    $.ajax({                                     
        url: "panda_member_signup1.php",
        data: $("#registerForm").serialize(),   
        type: "POST",
        dataType: 'json', 
        error: function(data) { 
            // console.log(data);
            alert("error");
        },
        success: function(data) {
            // console.log(data);
            if (data.error) {
                alert(data.msg);
                history.go(0); 
            } else {
                alert("success");
                history.go(0); 
            }                    
        }
    });
}

function validateEmail(email) {
    var re = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z]+$/;
    if(email.search(re)!= -1){
        return true;
    }
    else{
        return false;
    }
}


// function login() {

//     if ($('#loginUserName').val() == '') {
//         alert('Please check column UserName!');
//         return false;
//     }

//     if ($('#loginPassword').val() == '') {
//         alert('Please check column Password!');
//         return false;
//     }


//     $.ajax({
//         //告訴程式表單要傳送到哪裡                                      
//         url: "panda_member_login.php",
//         //需要傳送的資料
//         data: $("#loginForm").serialize(),
//         //使用POST方法     
//         type: "POST",
//         //接收回傳資料的格式，在這個例子中，只要是接收true就可以了
//         //dataType: 'text',
//         //傳送失敗則跳出失敗訊息  
//         error: function(data) {
//             //console.log('f' + data);
//             //資料傳送失敗後就會執行這個function內的程式，可以在這裡寫入要執行的程式  
//             alert("失敗");
//             //console.log($("#loginForm").serialize());
//         },
//         //傳送成功則跳出成功訊息
//         success: function(data) {
//             console.log(data);
//             if (data.error) {
//                 alert(data.msg);
//             } else {
//                 alert("成功");
//                 //alert("console.log(data)");  //console.log會自動重整

//                 //window.location.href='panda_member_login.php'
//                 //history.go(0); //location.reload();0→原頁重整；-1→:
//             }
//             //資料傳送成功後就會執行這個function內的程式，可以在這裡寫入要執行的程式                     
//         }
//     });
// }
</script>