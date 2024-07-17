<?php
// session_start();
// include('includes/config.php');
// include('includes/checklogin.php');
// check_login();
//
// if(isset($_GET['del']))
// {
// 	$id=intval($_GET['del']);
// 	$adn="delete from registration where id=?";
// 		$stmt= $mysqli->prepare($adn);
// 		$stmt->bind_param('i',$id);
//         $stmt->execute();
//         $stmt->close();
//         echo "<script>alert('Data Deleted');</script>" ;
// }



session_start();
include('includes/config.php');
include('includes/checklogin.php');
check_login();

if (isset($_GET['del'])) {
    $id = intval($_GET['del']);
    $adn = "DELETE FROM registration WHERE id=?";
    $stmt = $mysqli->prepare($adn);
    $stmt->bind_param('i', $id);
    $stmt->execute();
    $stmt->close();
    echo "<script>alert('Data Deleted');</script>";
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
	<title>Manage entry-exit records</title>
	<link rel="stylesheet" href="css/font-awesome.min.css">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/dataTables.bootstrap.min.css">
	<link rel="stylesheet" href="css/bootstrap-social.css">
	<link rel="stylesheet" href="css/bootstrap-select.css">
	<link rel="stylesheet" href="css/fileinput.min.css">
	<link rel="stylesheet" href="css/awesome-bootstrap-checkbox.css">
	<link rel="stylesheet" href="css/style.css">
<script language="javascript" type="text/javascript">
var popUpWin=0;
function popUpWindow(URLStr, left, top, width, height)
{
 if(popUpWin)
{
if(!popUpWin.closed) popUpWin.close();
}
popUpWin = open(URLStr,'popUpWin', 'toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,copyhistory=yes,width='+510+',height='+430+',left='+left+', top='+top+',screenX='+left+',screenY='+top+'');
}
</script>

</head>

<body>
	<?php include('includes/header.php');?>

	<div class="ts-main-content">
			<?php include('guard-sidebar.php');?>
		<div class="content-wrapper">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-12">
					<p ></p>
						<h2 class="page-title">


						</h2>
						<h2 class="page-title">

				Entry & Exit Records
						</h2>
						<div class="panel panel-default">
							<div class="panel-heading">All en</div>
							<div class="panel-body">
								<table id="zctb" class="display table table-striped table-bordered table-hover" cellspacing="0" width="100%">
									<thead>
										<tr>
											<th>id</th>
											<th> Student Name</th>
										<!--	<th>Reg no</th>-->

											<th>roomno</th>
											<th>contactno</th>
											<th>entry </th>
											<th>timestamp</th>
										</tr>
									</thead>
									<tfoot>
										<tr>
											<th>Sno.</th>
											<th>Student Name</th>
										<!--	<th>Reg no</th>-->
											<th>Contact no </th>
											<th>Room no  </th>
											<th>Fees_Paid </th>
											<th>pending_fees</th>

											<th>Staying From </th>
											<th>Action</th>
										</tr>
									</tfoot>
									<tbody>
										<?php
	$id = $_SESSION['id'];
	$ret = "SELECT * FROM gate";
	$stmt = $mysqli->prepare($ret);
	$stmt->execute();
	$res = $stmt->get_result();
	$cnt = 1;
	while ($row = $res->fetch_object()) {
	    ?>
	    <tr>
	        <td><?php echo $id; ?></td>
	        <td><?php echo $row->firstName . ' ' . $row->middleName . ' ' . $row->lastName; ?></td>
          <td><?php echo $row->roomno; ?></td>
	        <td><?php echo $row->contactno; ?></td>

	        <td><?php echo $row->entry; ?></td>
	        <!-- Make sure "Remaining_Fees" is a valid column in your table -->
	        <td><?php echo $row->timestamp; ?></td>

	        <td>
	            <a href="javascript:void(0);" onClick="popUpWindow('http://localhost/hostel/admin/full-profile.php?id=<?php echo $row->id; ?>');" title="View Full Details"><i class="fa fa-desktop"></i></a>&nbsp;&nbsp;
	            <a href="manage-students.php?del=<?php echo $row->id; ?>" title="Delete Record" onclick="return confirm('Do you want to delete?');"><i class="fa fa-close"></i></a>
	        </td>
	    </tr>
	    <?php
	    //$id = $cnt + 1;
	}
	?>



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
	<script src="js/Remaining_Fees.js"></script>



</body>

</html>
