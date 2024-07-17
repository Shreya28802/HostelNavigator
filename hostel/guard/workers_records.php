<?php
session_start();
include('includes/config.php');
include('includes/checklogin.php');

// Check login status
check_login();

// Initialize a variable to track the success status
$successMessage = '';

// Code for registration
if (isset($_POST['submit'])) {
    // Check if the required fields are set in $_POST
    if (isset($_POST['Name'], $_POST['Contact'], $_POST['purpose'])) {
        $Name = $_POST['Name'];
        $Contact = $_POST['Contact'];
        $purpose = $_POST['purpose'];

        // Check if any of the required fields are empty
        if (!empty($Name) && !empty($Contact) && !empty($purpose)) {

            $query = "INSERT INTO workers_records (Name,Contact, purpose) VALUES (?, ?, ?)";
            $stmt = $mysqli->prepare($query);

            if (!$stmt) {
                die('Error in prepare statement: ' . $mysqli->error);
            }

            // Binding parameters
            $rc = $stmt->bind_param('sss', $Name, $Contact, $purpose);

            if (!$rc) {
                die('Error in bind_param: ' . $stmt->error);
            }

            // Execute the statement
            $stmt->execute();

            // Check for errors during execution
            if (!$stmt->error) {
                $successMessage = 'Data inserted successfully!';
            } else {
                die('Error in execution: ' . $stmt->error);
            }

            // Close the statement
            $stmt->close();
        } else {
            // Handle the case when any of the required fields is empty
            die('Error: All fields are required.');
        }
    } else {
        // Handle the case when any of the required fields is not set in $_POST
        die('Error: Required fields not set.');
    }
}
?>

<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
    <!-- Add your meta tags and title here -->
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="theme-color" content="#3e454c">
    <title>Student Hostel Registration</title>

    <!-- Include CSS files -->
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/dataTables.bootstrap.min.css">
    <link rel="stylesheet" href="css/bootstrap-social.css">
    <link rel="stylesheet" href="css/bootstrap-select.css">
    <link rel="stylesheet" href="css/fileinput.min.css">
    <link rel="stylesheet" href="css/awesome-bootstrap-checkbox.css">
    <link rel="stylesheet" href="css/style.css">

    <!-- Include JavaScript files -->
    <script src="js/jquery-1.11.3-jquery.min.js"></script>
    <script src="js/validation.min.js"></script>
    <script src="js/jquery.min.js"></script>
</head>
<body>
    <?php include('includes/header.php'); ?>
    <div class="ts-main-content">
        <?php include('includes/guard-sidebar.php'); ?>
        <div class="content-wrapper">
            <div class="container-fluid">
                <!-- Your HTML content goes here -->
                <!-- Display success message if set -->
                <?php if (!empty($successMessage)) : ?>
                    <div class="alert alert-success" role="alert">
                        <?php echo $successMessage; ?>
                    </div>
                <?php endif; ?>
                <!-- Your HTML content goes here -->
                <form method="post" action="">
                    <div class="form-group" style="margin-top: 90px;">
                        <label class="col-sm-2 control-label">Name:</label>
                        <div class="col-sm-18">
                            <input type="text" name="Name" id="fname" class="form-control" required="required">
                        </div>
                    </div>

                    <div class="form-group" style="margin-top: 20px;">
                        <label class="col-sm-2 control-label">Contact:</label>
                        <div class="col-sm-18">
                            <input type="text" name="Contact" id="mname" class="form-control" required="required">
                        </div>
                    </div>

                    <div class="form-group" style="margin-top: 20px;">
        <label class="col-sm-2 control-label">Purpose:</label>
        <div class="col-sm-18" style="margin-left: 10px;">
            <select name="purpose" class="form-control" required="required">
                <option value="Water">Water</option>
                <option value="Cleaning">Cleaning</option>
                <option value="Other">Other</option>
                <!-- Add more options as needed -->
            </select>
        </div>
    </div>

                    <div class="form-group" style="margin-top: 20px;">
                        <div class="col-sm-offset-2 col-sm-8">
                            <button type="submit" name="submit" class="btn btn-primary">Submit</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Include JS files -->
    <script src="js/bootstrap-select.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.dataTables.min.js"></script>
    <script src="js/dataTables.bootstrap.min.js"></script>
    <script src="js/Chart.min.js"></script>
    <script src="js/fileinput.js"></script>
    <script src="js/chartData.js"></script>
    <script src="js/main.js"></script>

    <!-- Include any other JS files you may have -->

    <!-- Your additional JavaScript code goes here -->
    <script type="text/javascript">
        $(document).ready(function(){
            // Your existing JavaScript code
        });
    </script>
</body>
</html>
