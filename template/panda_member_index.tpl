<section class="main-container">
    <!-- START BLOCK : member_control -->
    <div class="main-wrapper">
        <h2>Member Action</h2>
        <div style="text-align: center;">
            

            <p>
                <a href="panda_member_list.php">All Member</a>
                <!-- START BLOCK : member_admin -->    
                <a href="panda_member_info.php">Member info</a>                    
                <!-- <a href="panda_billing_check.php">Check List</a>  -->
                <!-- END BLOCK : member_admin -->    
                <!-- <a href="panda_member_logout.php">Log Out</a> -->
                <form action="panda_member_logout.php" method="post">
                    <button type="submit" name="logout">Log Out</button>
                </form>
            </p>
               <!--  <form action="panda_member_logout.php" method="post">
                    <button type="submit" name="logout">Log Out</button>
                </form> -->
   
                <p><font size="4">Welcome to member system！！！</font></p>
                <p>User: <font color="blue"><b><u>{user_name}</u></b></font>; User level: <font color="blue"><b><u>{user_level}</u></b></font></p>
                


        </div>
    </div>
    <!-- END BLOCK : member_control --> 
</section>
</body>

</html>