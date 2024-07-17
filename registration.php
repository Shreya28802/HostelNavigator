<?php
session_start();
include('includes/config.php');

if (isset($_POST['submit'])) {
    $fname = $_POST['fname'];
    $mname = $_POST['mname'];
    $lname = $_POST['lname'];
    $gender = $_POST['gender'];
	//$cast = isset($_POST['cast']) ? $_POST['cast'] : ''; 
	$cast = $_POST['cast'];
	//$Engineering = isset($_POST['Engineering']) ? $_POST['Engineering'] : ''; 
	$Engineering = $_POST['Engineering'];
    $contactno = $_POST['contactno'];
    // $emailid = $_POST['emailid'];
		$emailid = isset($_POST['emailid']) ? $_POST['emailid'] : '';

    $password = $_POST['password'];
	$query = "INSERT INTO userRegistration (firstName, middleName, lastName, gender, cast,Engineering, contactno, email, password) VALUES (?, ?, ?, ?, ?,?, ?, ?, ?)";
    $stmt = $mysqli->prepare($query);
   // $query = "INSERT INTO userRegistration (firstName, middleName, lastName, gender,cast,contactno, email, password) VALUES (?, ?, ?, ?, ?, ?, ?,?)";
   // $stmt = $mysqli->prepare($query);

    // Assuming 'contactno' is an integer, adjust the 'i' in the bind_param accordingly
    $rc = $stmt->bind_param('ssssssiss', $fname, $mname, $lname, $gender,$cast,$Engineering, $contactno, $emailid, $password);

		if ($rc && $stmt->execute()) {
    echo "<script>alert('Student Successfully registered');</script>";
} else {
    echo "<script>alert('Error during registration: " . $stmt->error . "');</script>";
}
}
?>



<!doctype html>
<html lang="en" class="no-js">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
	<meta name="description" content="">
	<meta name="author" content="">
	<meta name="theme-color" content="#3e454c">
	<title>User Registration</title>
	<link rel="stylesheet" href="css/font-awesome.min.css">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/dataTables.bootstrap.min.css">>
	<link rel="stylesheet" href="css/bootstrap-social.css">
	<link rel="stylesheet" href="css/bootstrap-select.css">
	<link rel="stylesheet" href="css/fileinput.min.css">
	<link rel="stylesheet" href="css/awesome-bootstrap-checkbox.css">
	<link rel="stylesheet" href="css/style.css">
<script type="text/javascript" src="js/jquery-1.11.3-jquery.min.js"></script>
<script type="text/javascript" src="js/validation.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
function valid()
{
if(document.registration.password.value!= document.registration.cpassword.value)
{
alert("Password and Re-Type Password Field do not match  !!");
document.registration.cpassword.focus();
return false;
}
return true;
}
</script>
</head>
<body>
	<?php include('includes/header.php');?>
	<div class="ts-main-content">
		<?php include('includes/sidebar.php');?>
		<div class="content-wrapper">
			<div class="container-fluid">

				<div class="row">
					<div class="col-md-12">

						<h2 class="page-title">Student Registration </h2>

						<div class="row">
							<div class="col-md-12">
								<div class="panel panel-primary">
									<div class="panel-heading">Fill all Info</div>
									<div class="panel-body">
			<form method="post" action="" name="registration" class="form-horizontal" onSubmit="return valid();">



<!-- <div class="form-group">
<label class="col-sm-2 control-label"> Registration No : </label>
<div class="col-sm-8">
<input type="text" name="regno" id="regno"  class="form-control" required="required" >
</div>
</div> -->


<div class="form-group">
<label class="col-sm-2 control-label">First Name : </label>
<div class="col-sm-8">
<input type="text" name="fname" id="fname"  class="form-control" required="required" >
</div>
</div>

<div class="form-group">
<label class="col-sm-2 control-label">Middle Name : </label>
<div class="col-sm-8">
<input type="text" name="mname" id="mname"  class="form-control">
</div>
</div>

<div class="form-group">
<label class="col-sm-2 control-label">Last Name : </label>
<div class="col-sm-8">
<input type="text" name="lname" id="lname"  class="form-control" required="required">
</div>
</div>

<div class="form-group">
<label class="col-sm-2 control-label">Gender : </label>
<div class="col-sm-8">
<select name="gender" class="form-control" required="required">
<option value="">Select Gender</option>
<option value="male">Male</option>
<option value="female">Female</option>
<option value="others">Others</option>
</select>
</div>
</div>

<div class="form-group">
<label class="col-sm-2 control-label">cast : </label>
<div class="col-sm-8">
<select name="cast" class="form-control" required="required">
<option value="">Select cast</option>
<option value="Open">Open</option>
<option value="OBC">OBC</option>
<option value="SC">SC</option>
<option value="SBC">SBC</option>
<option value="NT">NT</option>
</select>
</div>
</div>

<div class="form-group">
<label class="col-sm-2 control-label">Engineering : </label>
<div class="col-sm-8">
<select name="Engineering" class="form-control" required="required">
<option value="">Select Department</option>
<option value="computer Science Engineering">computer Science Engineering</option>
<option value="eletrical">eletrical</option>
<option value="Aronautical">Aronautical</option>
<option value="food Technology">food Technology</option>
<option value="Civil Engineering">Civil Engineering</option>
<option value="Artificial Intelligence">Artificial Intelligence</option>
<option value="Mechanical Engineering">Mechanical Engineering</option>
<option value="IOT">IOT</option>
</select>
</div>
</div>





<div class="form-group">
<label class="col-sm-2 control-label">Email id: </label>
<div class="col-sm-8">
<!-- <input type="email" name="emailid" id="emailid"  class="form-control" onBlur="checkAvailability()" required="required"> -->
<input type="email" name="emailid" id="emailid" class="form-control" onBlur="checkAvailability()" required="required">

<!-- <span id="user-availability-status" style="font-size:12px;"></span> -->
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label">Contact No : </label>
<div class="col-sm-8">
<input type="text" name="contactno" id="contactno"  class="form-control" required="required">
</div>
</div>

<!-- <div class="form-group">
<label class="col-sm-2 control-label">Mark: </label>
<div class="col-sm-8">
<input type="Number" name="Mark" id="Mark"  class="form-control" onBlur="checkAvailability()" required="required">
<span id="user-availability-status" style="font-size:12px;"></span>
</div>
</div> -->

<div class="form-group">
<label class="col-sm-2 control-label">Password: </label>
<div class="col-sm-8">
<input type="password" name="password" id="password"  class="form-control" required="required">
</div>
</div>


<div class="form-group">
<label class="col-sm-2 control-label">Confirm Password : </label>
<div class="col-sm-8">
<input type="password" name="cpassword" id="cpassword"  class="form-control" required="required">
</div>
</div>




<div class="col-sm-6 col-sm-offset-4">
<button class="btn btn-default" type="submit">Cancel</button>
<input type="submit" name="submit" Value="Register" class="btn btn-primary">
</div>
</form>

									</div>
									</div>
								</div>
							</div>
						</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap-select.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.dataTables.min.js"></script>
	<script src="js/dataTables.bootstrap.min.js"></script>
	<script src="js/Chart.min.js"></script>
	<script src="js/fileinput.js"></script>
	<script src="js/chartData.js"></script>
	<script src="js/main.js"></script>
</body>
	<script>
function checkAvailability() {

$("#loaderIcon").show();
jQuery.ajax({
url: "check_availability.php",
data:'emailid='+$("#email").val(),
type: "POST",
success:function(data){
$("#user-availability-status").html(data);
$("#loaderIcon").hide();
},
error:function ()
{
event.preventDefault();
alert('error');
}
});
}
</script>

</html>
