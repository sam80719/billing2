<section class="main-container">
    <div class="main-wrapper">
        <div class="row">
            <div class="col-md-12" name="allData">
                <h2>All Member</h2>
                <!-- Button trigger modal call Insert Modal -->
                <button type="button" class="btn btn-primary pull-left m-r-10" data-toggle="modal" data-target="#exampleModal_1">
                    Add member
                </button>
                <table class="table table-hover" id="allData">
                    <thead>
                        <tr>
                            <th>id</th>
                            <th>name</th>
                            <th>email</th>                           
                            <th>password</th>
                            <th>level</th>
                            <th></th>
                        </tr>
                    </thead>                    
                    <!-- START BLOCK : list_all -->
                    <tbody>
                        <tr>
                            <td> {user_id} </td>
                            <td> {user_name} </td>
                            <td> {user_email} </td>
                            <th> {user_password}</th>
                            <td> {user_level} </td>
                            <td>
                                <input class="btn btn-warning" type="button" value="edit" data-toggle="modal" onclick="edit({user_id});">
                                <input class="btn btn-danger" type="button" name="delete" value="delele" onclick="deletes({user_id})">
                            </td>

                        </tr>
                    </tbody>
                    <!--END BLOCK : list_all -->
                </table>
            </div>
        </div>
    </div>
<!-- Insert Modal -->
<div class="modal fade" id="exampleModal_1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Add member</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" id="insertModal">
                <form action="" method="post" name="insert" id="insertForm">
                    <!-- <input type="hidden" name="id" value=""> -->
                    <p>
                        <label for="user_name">name:</label>
                        <input type="text" name="user_name" id="user_name">
                    </p>
                    <p>
                        <label for="user_email">email:</label>
                        <input type="email" name="user_email" id="user_email">
                    </p>
                    <p>
                        <label for="user_password">password:</label>
                        <input type="text" name="user_password" id="user_password">
                    </p>                                    
                    <p>
                        <label for="level">level:</label>
                        <input type="radio" name="level" value="manager"> manager
                        <input type="radio" name="level" value="normal"> normal
                    </p>
                    
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
                <h5 class="modal-title" id="exampleModalLabe2">Edit member</h5>
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
                        <label for="editName">name:</label>
                        <input type="text" name="editName" id="editName" placeholder="">
                    </p>
                    <p>
                        <label for="editMail">mail:</label>
                        <input type="email" name="editMail" id="editMail" placeholder="">
                    </p>
                    <p>
                        <label for="editPassword">password:</label>
                        <input type="text" name="editPassword" id="editPassword" placeholder="">
                    </p>                    
                    <p>
                        <label for="level">level:</label>
                        <input type="radio" id="normal" name="level" value="normal"> normal
                        <input type="radio" id="manager" name="level" value="manager"> manager
                    </p>
                    <input type="button" class="btn btn-primary" value="Edit Records" onclick="updatedata()">
                    <input type="button" class="btn btn-secondary" data-dismiss="modal" value="Close">
                </form>
            </div>
        </div>
    </div>
</div>
</section>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript">

function insertData() {
    if ($('#user_name').val() == '') {
        alert('Please check column name!');
        return false;
    }
    if ($('#user_email').val() == '') {
        alert('Please check column email!');
        return false;
    }
    if ($('#user_password').val() == '') {
        alert('Please check column password');
        return false;
    }    
    if ($('input[name="level"]').val() == '') {
        alert('Please check option level!');
        return false;
    }

    $.ajax({
                                     
        url: "panda_member_insert.php",
        data: $("#insertForm").serialize(),    
        type: "POST",
        dataType: 'text',
        error: function(data) {
            //console.log('f' + data);
            alert("error");
        },
        success: function(data) {
            if (data.error) {
                alert(data.msg);
            } else {
                alert("success");
                history.go(0);
            }                    
        }
    });

}


//## delete function ##//
function deletes(id) {

    // console.log(id);
    if (confirm('Are you sure to delete it!') == true) {
        $.ajax({
            url: "panda_member_delete.php",         
            data: { id: id },
            type: "POST",
            dataType: 'text',
            error: function(data) {
                //console.log('error' + data); 
                alert("error");
            },
            success: function(data) {
                //console.log('success' + data);
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


// 跳出 edit modul
function edit(id) {
    // alert ("motify");
    // console.log(id);
    $.ajax({
        url: "panda_member_select.php",
        data: { id: id },
        type: "POST",
        dataType: 'text',
        error: function(data) {
            // console.log('error' + data);
            alert("error");
        },
        success: function(data) {

            // console.log(data);
            //{"user_id":"1","user_name":"sam80719","user_email":"sam80719@gmail.com","user_password":"123456"}
            var obj = jQuery.parseJSON(data);
            // console.log(obj);
            // //console.log($("input[name=editID]").val(obj.id))
            $("input[name=editID]").val(obj.user_id);
            $("#editIdentfication")[0].innerHTML = obj.user_id;
            $("#editName")[0].value = obj.user_name;
            $("#editMail")[0].value = obj.user_email;
            $("#editPassword")[0].value = obj.user_password;
            // radio 
            if (obj.user_level == 'normal') { 
                $("#normal")[0].checked = true
            } else {
                $("#manager")[0].checked = true
            }            
        }
    });
    $("#exampleModal_2").modal('show');
}


function updatedata() {

    //alert("修改中");    

    if ($('#editName').val() == '') {
        alert('Please check column name!');
        return false;
    }
    if ($('#editMail').val() == '') {
        alert('Please check column email!');
        return false;
    }
    if ($('#editPassword').val() == '') {
        alert('Please check column password');
        return false;
    }    

    //console.log($("#editForm").serialize());

    $.ajax({
        url: "panda_member_update.php",
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
                history.go(0); 
            }
        }
    });

}
</script>

</html>