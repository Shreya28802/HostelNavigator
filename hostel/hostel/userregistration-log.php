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
						<h2 class="page-title">user Registration Log</h2>
						<div class="panel panel-default">
							<div class="panel-heading">All User  Details</div>
							<div class="panel-body">
								<table id="zctb" class="display table table-striped table-bordered table-hover" cellspacing="0" width="100%">
    <thead>
        <tr>
            <th>ID</th>
            <th>First Name</th>
            <th>Middle Name</th>
            <th>Last Name</th>
            <th>Contact No</th>
            <th>Gender</th>
            <th>Email</th> <!-- Added column for email -->
            <th>Password</th> <!-- Added column for password -->
        </tr>
    </thead>
    <tfoot>
        <tr>
            <th>ID</th>
            <th>First Name</th>
            <th>Middle Name</th>
            <th>Last Name</th>
            <th>Contact No</th>
            <th>Gender</th>
            <th>Email</th>
            <th>Password</th>
        </tr>
    </tfoot>
    <tbody>
        <?php
        $ret = "SELECT * FROM userlog";
        $stmt = $mysqli->prepare($ret);
        $stmt->execute();
        $res = $stmt->get_result();
        $cnt = 1;
        while ($row = $res->fetch_object()) {
        ?>
            <tr>
                <td><?php echo $cnt; ?></td>
                <td><?php echo $row->fname; ?></td>
                <td><?php echo $row->mname; ?></td>
                <td><?php echo $row->lname; ?></td>
                <td><?php echo $row->contactno; ?></td>
                <td><?php echo $row->gender; ?></td>
                <td><?php echo $row->email; ?></td> <!-- Display email field -->
                <td><?php echo $row->password; ?></td> <!-- Display password field -->
            </tr>
        <?php
            $cnt = $cnt + 1;
        } ?>
    </tbody>
</table>

		        <?php
		            $cnt = $cnt + 1;
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
