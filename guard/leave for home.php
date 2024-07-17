<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Admin login</title>

    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/dataTables.bootstrap.min.css">
    <link rel="stylesheet" href="css/bootstrap-social.css">
    <link rel="stylesheet" href="css/bootstrap-select.css">
    <link rel="stylesheet" href="css/fileinput.min.css">
    <link rel="stylesheet" href="css/awesome-bootstrap-checkbox.css">
    <link rel="stylesheet" href="css/style.css">

    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        .ts-main-content {
            display: flex;
            flex-direction: row;
            justify-content: flex-start;
            align-items: flex-start;
            width: 100%;
        }

        .content-wrapper {
            width: calc(100% - 250px); /* Adjust the width of the sidebar */
            padding-left: 20px;

        }

        h1 {
            text-align: center;
            color: #333;
            font-size: 36px; /* Increase the font size */
        }

        form {
            max-width: 400px;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 8px;
        }

        input {
            width: 100%;
            padding: 8px;
            margin-bottom: 16px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        button {
            background-color: #4caf50;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        button:hover {
            background-color: #45a049;
        }

        strong {
            color: #333;
        }
    </style>
</head>

<body>
    <?php
    session_start();
    include('includes/header.php');
    ?>
    <div class="ts-main-content">
        <?php include('guard-sidebar.php'); ?>
        <div class="content-wrapper">
            <div class="container-fluid">
                <div class="content-wrapper">
                    <div class="content-wrapper">
                        <div class="row">
                            <div class="col-md-6">

                                <h1>Gate Log System</h1>

                                <form action="" method="POST">
                                    <label for="student_id">Student ID:</label>
                                    <input type="text" id="student_id" name="student_id" required>
                                    <button type="submit" name="fetch_data">Fetch Data</button>
                                </form>

                                <div>

                                    <?php
                                    include('includes/config.php');

                                    if (isset($_POST['fetch_data'])) {
                                        $student_id = $_POST['student_id'];
                                        $sql = "SELECT * FROM registration WHERE id = $student_id";
                                        $result = $mysqli->query($sql);

                                        if ($result->num_rows > 0) {
                                            $row = $result->fetch_assoc();
                                            echo "<br><strong>Student Details:</strong><br>";
                                            echo "ID: " . $row["id"] . "<br>";
                                            echo "Room No: " . $row["roomno"] . "<br>";
                                            echo "First Name: " . $row["firstName"] . "<br>";
                                            echo "Middle Name: " . $row["middleName"] . "<br>";
                                            echo "Last Name: " . $row["lastName"] . "<br>";
                                            echo "Contact No: " . $row["contactno"] . "<br>";

                                            echo '<form action="" method="POST">
                                                    <input type="hidden" name="student_id" value="' . $row["id"] . '">
                                                    <button type="submit" name="log_in">IN</button>
                                                    <button type="submit" name="log_out">OUT</button>
                                                  </form>';
                                        } else {
                                            echo "Student not found!";
                                        }
                                    }

                                    if (isset($_POST['log_in']) || isset($_POST['log_out'])) {
                                        $student_id = $_POST['student_id'];
                                        date_default_timezone_set('Asia/Kolkata'); // Set timezone to India (IST)
                                        $timestamp = date('Y-m-d H:i:s'); // Current date and time in India timezone

                                        $entry_type = isset($_POST['log_in']) ? 'IN' : 'OUT';
                                        $timestamp = date('Y-m-d H:i:s'); // Current date and time

                                        $sql = "INSERT INTO home (id, firstName, middleName, lastName, roomno, contactno, entry, timestamp)
                                        SELECT id, firstName, middleName, lastName, roomno, contactno, '$entry_type', '$timestamp'
                                        FROM registration WHERE id = $student_id";

                                        if ($mysqli->query($sql) === TRUE) {
                                            echo "<br>Log entry created successfully.";
                                        } else {
                                            echo "<br>Error creating log entry: " . $mysqli->error;
                                        }
                                    }

                                    $mysqli->close();
                                    ?>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>

</html>
