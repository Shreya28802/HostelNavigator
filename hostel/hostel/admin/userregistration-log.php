<?php
session_start();
include('includes/config.php');
include('includes/checklogin.php');
check_login();
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
	<title>Access Log</title>
	<link rel="stylesheet" href="css/font-awesome.min.css">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/dataTables.bootstrap.min.css">
	<link rel="stylesheet" href="css/bootstrap-social.css">
	<link rel="stylesheet" href="css/bootstrap-select.css">
	<link rel="stylesheet" href="css/fileinput.min.css">
	<link rel="stylesheet" href="css/awesome-bootstrap-checkbox.css">
	<link rel="stylesheet" href="css/style.css">
</head>

<body>
	<?php include('includes/header.php');?>

	<div class="ts-main-content">
			<?php include('includes/sidebar.php');?>
		<div class="content-wrapper">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-12">
					<h2 class="page-title">    </h2>
						<h2 class="page-title">User Registration Log</h2>
						<div class="panel panel-default">
							<div class="panel-heading">All User  Details</div>
							<div class="panel-body">
								<table id="zctb" class="display table table-striped table-bordered table-hover" cellspacing="0" width="100%">
									<thead>
										<tr>
											<th>id</th>
											<th>firstName</th>
											<th>middleName</th>
											<th>lastName</th>
										
											<th>gender</th>
											<th>contactNo </th>
											<th>email</th>
											<th>password</th>
											<th>regDate</th>
											<th> updationDate</th>
											
											<th>passUdateDate</th>
										</tr>
									</thead>
									<tfoot>
										<tr>
											
											
										</tr>
									</tfoot>
									<tbody>
<?php	
$aid=$_SESSION['id'];
$ret="select * from userregistration";
$stmt= $mysqli->prepare($ret) ;
//$stmt->bind_param('i',$aid);
$stmt->execute() ;
$res=$stmt->get_result();
$cnt=1;
while($row=$res->fetch_object())
	  {
	  	?>

<td><?php echo $row->id;?></td>
<td><?php echo $row->firstName;?></td>
<td><?php echo $row->middleName;?></td>

<td><?php echo $row->lastName;?></td>
<td><?php echo $row->gender;?></td>
<td><?php echo $row->contactNo;?></td>
<td><?php echo $row->email;?></td>
<td><?php echo $row->password;?></td>
<td><?php echo $row->regDate;?></td>
<td><?php echo $row->updationDate;?></td>
<td><?php echo $row->passUdateDate;?></td>
	  
										</tr>
									<?php
$cnt=$cnt+1;
	   } ?>
											
										
									</tbody>
								</table>

								
							</div>
						</div>

					
					</div>
				</div>

			

			</div>
		</div>
	</div>
	  

	<!-- Loading Scripts -->
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

</html>
	  