<!DOCTYPE html>
<html>

<head>
    <title>PANDA BILLING EXCIRSE</title>
    <meta charset="UTF-8">
    <meta http-equiv="cache-control" content="no-cache" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style type="text/css">
    .header {
        width: 100%;
        height: 40px;
        background: white;
        display: block;
    }

    tfoot {
        color: blue;
    }

    .m-r-10 {
        margin-right: 10px;
    }

    .m-b-10 {
        margin-bottom: 10px;
    }
    </style>
</head>
<div class="container">
    <div class="header">
        <div class="row">
            <div class="col-md-12 col-xs-12 m-b-10">
                <!-- START BLOCK : member_admin -->
                <select class="pull-left m-r-10" id="typeSelect">
                    <option value="1">insert type</option>
                    <option value="2">delete type</option>
                    <option value="3">adjust type</option>
                </select>
                <button class="btn btn-warning pull-left m-r-10" id="typeApply" data-toggle="modal">typeApply</button>
                <!-- Button trigger modal call insert type Modal -->
                <!-- <button type="button" class="btn btn-warning pull-left m-r-10" data-toggle="modal" data-target="#exampleModal_5">
                    insert type
                </button> -->
                <!-- Button trigger modal call Delete type Modal -->
                <!-- <button type="button" class="btn btn-warning pull-left m-r-10" data-toggle="modal" data-target="#exampleModal_4">
                    delete type
                </button> -->
                <!-- Button trigger modal call adjust type Modal -->
                <!-- <button type="button" class="btn btn-warning pull-left m-r-10" data-toggle="modal" data-target="#exampleModal_3">
                    adjust type
                </button> -->
                <!-- END BLOCK : member_admin -->
                <!-- Button trigger modal call Insert Modal -->
                <button type="button" class="btn btn-primary pull-left m-r-10" data-toggle="modal" data-target="#exampleModal_1">
                    insert
                </button>
                <!-- filiter dropdown -->
                <div class="dropdown pull-left">
                    <button class="btn btn-success dropdown-toggle" type="button" data-toggle="dropdown">filiter</button>
                    <ul class="dropdown-menu">
                        <!-- START BLOCK : type_select -->
                        <li><a value="{row}" onclick="location='http://localhost/exciser12/panda_billing_index.php?type={row}'">{row}</a></li>
                        <!-- END BLOCK : type_select -->
                        <li><a value="all" onclick="location='http://localhost/exciser12/panda_billing_index.php'">all data</a></li>
                    </ul>
                </div>
                <!-- search item -->
                <div class="input-group pull-right">
                    <form action="panda_billing_index.php" method="post" name="main_form">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="Search for..." name="searchTerm" id="searchTerm">
                            <span class="input-group-btn">
                                <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search" onclick="seachItem()"></i></button>
                            </span>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <!-- all data display  -->
        <div class="col-md-12" name="allData">
            <h2>All date</h2>
            <!--<table class="table table-hover" id="allData">-->
            <table class="table table-hover" id="allData">
                <thead>
                    <tr>
                        <th>id</th>
                        <th>date</th>
                        <th>subject</th>
                        <th>income/expence</th>
                        <th>type</th>
                        <th>cash</th>
                        <th> </th>
                    </tr>
                </thead>
                <tbody>
                    <!-- START BLOCK : list -->
                    <tr>
                        <td> {id} </td>
                        <td> {input_datetime} </td>
                        <td> {subject} </td>
                        <td> {balance} </td>
                        <td> {type} </td>
                        <td> {cash} </td>
                        <td>
                            <input class="btn btn-warning" type="button" value="edit" data-toggle="modal" onclick="edit({id});">
                            <input class="btn btn-danger" type="button" name="delete" value="delele" onclick="deletes({id});">
                        </td>
                    </tr>
                    <!--END BLOCK : list -->
                </tbody>
                <tfoot>
                    <!-- START BLOCK : count -->
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td>all income</td>
                        <td>{income_sum}</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td>all expence</td>
                        <td>{expence_sum}</td>
                        </td>
                        <td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td>cash summary</td>
                        <td>{sum}</td>
                        <td></td>
                    </tr>
                    <!--END BLOCK : count -->
                </tfoot>
            </table>
        </div>
    </div>
</div>
<!-- Insert Modal -->
<div class="modal fade" id="exampleModal_1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Insert date</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" id="insertModal">
                <form action="" method="post" name="insert" id="insertForm" >
                    <input type="hidden" name="ins_fg" value="">
                    <p>
                        <label for="subject">subject:</label>
                        <input type="text" name="subject" id="subject">
                    </p>
                    <p>
                        <label for="balance">balance:</label>
                        <input type="radio" name="balance" value="income"> income
                        <input type="radio" name="balance" value="expence"> expence
                    </p>
                    <p>
                        <label for="type">type:</label>
                        <select name="type" id="type" size="1">
                            <!-- START BLOCK : type_select_2 -->
                            <option value="{row}">{row}</option>
                            <!-- END BLOCK : type_select_2 -->
                        </select>
                    </p>
                    <p>
                        <label for="cash">cash:</label>
                        <input type="text" name="cash" id="cash" onkeyup="this.value=this.value.replace(/[^\d]/,'')" valus="{cash}">
                    </p>
                    <!-- <p>
                        <label for="photo">photo:</label>
                        <input type="file" name="photo" id="photo" size="10">
                    </p>
                    <div>
                        <img class="preview" style="max-width: 150px; max-height: 150px;">
                        <div class="size"></div>
                    </div> -->
                    <input type="button" class="btn btn-primary" value="Add Records" onclick="insertData()">
                    <input type="button" class="btn btn-secondary" data-dismiss="modal" value="Close">
                    <!--<input type="button" value="Add Records" onclick="check()">-->
                </form>
            </div>
        </div>
    </div>
</div>
<!-- Edit Modal -->
<div class="modal fade" id="exampleModal_2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabe2" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabe2">Edit date</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" id="editModal">
                <form action="" method="post" name="update" id="editForm">
                    <input type="hidden" name="editID" value="">
                    <p>
                        <label for="id">id:</label>
                        <span name="id" id="editIdentfication"></span>
                    </p>
                    <p>
                        <label for="subject">subject:</label>
                        <input type="text" name="subject" id="editSubject" placeholder="">
                    </p>
                    <p>
                        <label for="balance">balance:</label>
                        <input type="radio" id="income" name="balance" value="income"> income
                        <input type="radio" id="expence" name="balance" value="expence"> expence
                    </p>
                    <p>
                        <label for="type">type:</label>
                        <select name="type" id="editType" size="1">
                            <!-- START BLOCK : type_select_3 -->
                            <option value="{row}">{row}</option>
                            <!-- <option value="clothes">clothes</option>
                            <option value="housing">housing</option>
                            <option value="transportation">transportation</option>
                            <option value="education">education</option>
                            <option value="entertainment">entertainment</option> -->
                            <!-- END BLOCK : type_select_3 -->
                        </select>
                    </p>
                    <p>
                        <label for="cash">cash:</label>
                        <input type="text" name="cash" id="editCash" placeholder="" onkeyup="this.value=this.value.replace(/[^\d]/,'')" valus="{cash}">
                    </p>
                    <input type="button" class="btn btn-primary" value="Edit Records" onclick="updatedata()">
                    <input type="button" class="btn btn-secondary" data-dismiss="modal" value="Close">
                </form>
            </div>
        </div>
    </div>
</div>
<!-- insert type Modal -->
<div class="modal fade" id="exampleModal_5" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">insert type</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" id="inserttypetModal">
                <form action="" method="post" name="insertType" id="insertType">
                    <input type="hidden" name="ins_fg" value="">
                    <p>
                        <label for="type">type:</label>
                        <input type="text" name="type" id="newType">
                    </p>
                    <input type="button" class="btn btn-primary" value="insert type" onclick="addType()">
                    <input type="button" class="btn btn-secondary" data-dismiss="modal" value="Close">
                    <!--<input type="button" value="Add Records" onclick="check()">-->
                </form>
            </div>
        </div>
    </div>
</div>
<!-- delete type Modal -->
<div class="modal fade" id="exampleModal_4" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">delete type</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" id="deleteTypetModal">
                <form action="" method="post" name="deleteType" id="deleteType">
                    <input type="hidden" name="ins_fg" value="">
                    <p>
                        <label for="type">type:</label>
                        <select name="type" id="deleteType" size="1">
                            <!-- START BLOCK : type_select_4 -->
                            <option value="{row}">{row}</option>
                            <!-- END BLOCK : type_select_4 -->
                        </select>
                    </p>
                    <input type="button" class="btn btn-primary" value="delete type" onclick="cleanType()">
                    <input type="button" class="btn btn-secondary" data-dismiss="modal" value="Close">
                    <!--<input type="button" value="Add Records" onclick="check()">-->
                </form>
            </div>
        </div>
    </div>
</div>
<!-- adjust type Modal -->
<div class="modal fade" id="exampleModal_3" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">adjust type</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" id="deleteTypetModal">
                <form action="" method="post" name="adjustType" id="adjustType">
                    <p>
                        <!-- filiter dropdown -->
                        <div class="dropdown pull-left">
                            <button class="btn btn-success btn-sm dropdown-toggle" type="button" data-toggle="dropdown">type</button>
                            <ul class="dropdown-menu">
                                <!-- START BLOCK : type_select_5 -->
                                <li><a value="{row}" onclick="selectType('{row}')">{row}</a></li>
                                <!-- END BLOCK : type_select_5 -->
                            </ul>
                        </div>
                        <input type="hidden" name="typeID" value="">
                        <input type="text" name="selectType" id="selectType">
                    </p>
                    <input type="button" class="btn btn-primary" value="adjust type" onclick="editType()">
                    <input type="button" class="btn btn-secondary" data-dismiss="modal" value="Close">
                    <!--<input type="button" value="Add Records" onclick="check()">-->
                </form>
            </div>
        </div>
    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- Insert Modal -->
<script type="text/javascript">
$(document).ready(function() {

    //type managerment
    $("#typeApply").click(function() {
        var action = $("#typeSelect").val();
        var $t = $(this);
        switch (parseInt(action)) {
            case 1:
                $("#exampleModal_5").modal('show');
                break;
            case 2:
                $("#exampleModal_4").modal('show');
                break;
            case 3:
                $("#exampleModal_3").modal('show');
                break;
        }
    });

    // //檔案上傳與瀏覽
    // $("#photo").change(function() { //當檔案改變後，做一些事 
    //     readURL(this);

    //     function readURL(input) {
    //         if (input.files && input.files[0]) {
    //             var reader = new FileReader();
    //             var sizeLimit = 1024;
    //             reader.onload = function(e) {
    //                 $("#photo").attr('src', e.target.result);
    //                 $('.preview').attr('src', e.target.result);
    //                 var KB = format_float(e.total / 1024, 2);
    //                 $('.size').text("file size：" + KB + " KB");
    //                 // console.log(KB);
    //                     if (KB > sizeLimit) {
    //                         var msg ="Your file size ("+KB+"KB) is larger than limit size ("+sizeLimit+"KB)";
    //                         alert(msg);
    //                     }                   
    //             }
    //             reader.readAsDataURL(input.files[0]);
    //         }
    //         // console.log(input.files[0]);
            
            
    //     }

    //     function format_float(num, pos)  {
    //         var size = Math.pow(10, pos);
    //         return Math.round(num * size) / size;

    //     }
        
    // });


});


//## start checking insert colum ##//
function insertData() {
    if ($('#subject').val() == '') {
        alert('Please check column Subject!');
        return false;
    }
    if ($('input[name="balance"]').val() == '') {
        alert('Please check option Balance!');
        return false;
    }
    if ($('#cash').val() == '') {
        alert('Please check column cash!');
        return false;
    }

    // if ($('#photo').val() == '') {
    //     alert('Please check column photo!');
    //     return false;
    // }

    // if ($('#photo').val() != '') {
    //     var extension = $('#photo').val().split('.').pop().toLowerCase();
    //     if (jQuery.inArray(extension, ['gif', 'png', 'jpg', 'jepg']) == -1) {
    //         alert('Invaild Picture File');
    //         $('#photo').val('');
    //         return false;
    //     }
    // }

    $.ajax({
        //告訴程式表單要傳送到哪裡                                      
        url: "panda_billing_insert.php",
        //需要傳送的資料
        data: $("#insertForm").serialize(),
        //使用POST方法     
        type: "POST",
        //接收回傳資料的格式，在這個例子中，只要是接收true就可以了
        dataType: 'json ',
        //傳送失敗則跳出失敗訊息
        // cache: false,
        // processData: false,
        // contentType: false,   
        error: function(data) {
            // console.log($("#insertForm"));
            console.log(data);
            //資料傳送失敗後就會執行這個function內的程式，可以在這裡寫入要執行的程式  
            alert("error");
        },
        //傳送成功則跳出成功訊息
        success: function(data) {
            // console.log ($("#insertForm"));
            // console.log(data);
            if (data.error) {
                alert(data.msg);
            } else {
                alert("success");
                history.go(0); //location.reload();0→原頁重整；-1→:
            }
            //資料傳送成功後就會執行這個function內的程式，可以在這裡寫入要執行的程式                     
        }
    });
    // document.insert,submit();
}

//## delete function ##//
function deletes(id) {
    //console.log('key_1', $('#delete').val());     //檢查id=delete的值→delete (因為value="delele")
    //console.log('key_2', id);                     //檢查onclick="deletes({id});"的值→該欄位的值
    if (confirm('Are you sure to delete it!') == true) {
        $.ajax({
            url: "panda_billing_delete.php",
            //data: '{'id='+$('#delete').val()}',       //文字的傳遞方式            
            data: { id: id },
            type: "POST",
            dataType: 'json',
            error: function(data) {

                console.log(data);
                alert("error!");
            },
            //傳送成功則跳出成功訊息
            success: function(data) {
                // console.log(data);
                if (data.error) {
                    alert(data.msg);
                } else {
                    history.go(0);
                }
            }
        });

    }
}

// 跳出 edit modul
function edit(id) {
    //console.log(id);
    $.ajax({
        url: "panda_billing_select.php",
        data: { id: id },
        type: "POST",
        dataType: 'text',
        error: function(data) {
            //console.log('error' + data);
            alert("失敗");
        },
        success: function(data) {
            var obj = jQuery.parseJSON(data);
            // console.log(obj);
            //console.log($("input[name=editID]").val(obj.id))
            $("input[name=editID]").val(obj.id);
            $("#editIdentfication")[0].innerHTML = obj.id;
            $("#editSubject")[0].value = obj.subject;
            $("#editCash")[0].value = obj.cash;
            // radio
            if (obj.balance == 'expence') { //1.名稱定義要正確
                $("#expence")[0].checked = true
            } else {
                $("#income")[0].checked = true
            }
            // selected
            for (var i = 0; i < $("#editType option").length; i++) {
                if (obj.type == $("#editType option")[i].value) {
                    $("#editType option")[i].selected = true;
                }
            }
        }
    });
    $("#exampleModal_2").modal('show');
}

function updatedata() {

    //alert("修改中");     //確認updatedata有功能
    if ($('#editSubject').val() == '') {
        alert('Please check column Subject!');
        return false;
    }
    if ($('input[name="balance"]').val() == '') {
        alert('Please check option Balance!');
        return false;
    }
    if ($('#editCash').val() == '') {
        alert('Please check column cash!');
        return false;
    }

    //console.log($("#editForm").serialize());

    $.ajax({
        url: "panda_billing_update.php",
        data: $("#editForm").serialize(),
        type: "POST",
        dataType: 'json',
        error: function(data) {
            //console.log(data);
        },
        success: function(data) {
            //console.log(data);
            if (data.error) {
                alert(data.msg);
            } else {
                alert("success");
                history.go(0); //location.reload();0→原頁重整；-1→上一頁
            }
        }
    });
}

function searchItem(sqlInjection) {

    return sqlInjection.replace(/[\n\r"'\\\%]/g, function(char) {
        switch (char) {
            case "\n":
                return "\\n";
            case "\r":
                return "\\r";
            case "\"":
            case "'":
            case "\\":
            case "%":
                return "\\" + char; // prepends a backslash to backslash, percent,
                // and double/single quotes
        }
    });
}

function cleanType() {
    // alert('hu');

    if (confirm('Are you sure to delete it!') == true) {
        $.ajax({
            url: "panda_billing_delete_type.php",
            data: $("#deleteType").serialize(),
            type: "POST",
            dataType: 'text',
            error: function(data) {
                //console.log('f' + data); 
                alert("error");
            },
            success: function(data) {
                // console.log($("#deleteType"));
                console.log(data);
                if (data.error) {
                    alert(data.msg);
                } else {
                    alert("success");
                    history.go(0);
                }
            }
        });
    }
}

function addType() {

    if ($('#newType').val() == '') {
        alert('Please check column type!');
        return false;
    }
    $.ajax({
        url: "panda_billing_insert_type.php",
        data: $("#insertType").serialize(),
        type: "POST",
        dataType: 'text',
        error: function(data) {
            //console.log('f' + data); 
            alert("error");
        },
        success: function(data) {
            // console.log($("#deleteType"));
            console.log(data);
            if (data.error) {
                alert(data.msg);
            } else {
                alert("success");
                history.go(0);
            }
        }
    });
}

function selectType(e) {
    // console.log(e);
    // alert("edit now");
    $.ajax({
        url: "panda_billing_select_type.php",
        data: { type: e },
        type: "POST",
        dataType: 'text',
        error: function(data) {
            console.log(data);
            alert("error");
        },
        success: function(data) {
            // console.log(data);
            var obj = jQuery.parseJSON(data);
            // console.log(obj);
            $("input[name=typeID]").val(obj.id);
            $("#selectType")[0].value = obj.type;
        }
    });

}

function editType() {

    if ($('#selectType').val() == '') {
        alert('Please check column type!');
        return false;
    }
    $.ajax({
        url: "panda_billing_edit_type.php",
        data: $("#adjustType").serialize(),
        type: "POST",
        dataType: 'text',
        error: function(data) {
            //console.log('f' + data);
            console.log($("#adjustType"));
            alert("error");
        },
        success: function(data) {
            // console.log($("#deleteType"));
            // console.log(data);
            if (data.error) {
                alert(data.msg);
            } else {
                // console.log(data);
                alert("success");
                history.go(0);
            }
        }
    });
}
</script>