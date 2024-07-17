<?php
// Replace these with your actual database credentials
$servername = "localhost";
$username = "username";
$password = "password";
$dbname = "your_database";

// Create connection
$con = mysqli_connect($servername, $username, $password, $dbname);

// Check connection
if (!$con) {
    die("Connection failed: " . mysqli_connect_error());
}

// Query to fetch parents' records and their contact lists
$query = "SELECT * FROM parents";
$result = mysqli_query($con, $query);

// Check if the query executed successfully
if ($result) {
    echo "<h2>Parents' Records and Contact Lists</h2>";
    echo "<table border='1'>
            <tr>

                <th>parent_name</th>
                <th>contact_number</th>
            </tr>";

    // Loop through the results and display each row in the table
    while ($row = mysqli_fetch_assoc($result)) {
        echo "<tr>";

        echo "<td>" . $row['parent_name' ] . "</td>";
        echo "<td>" . $row['contact_number'] . "</td>";
        echo "</tr>";
    }

    echo "</table>";
} else {
    echo "Error: " . mysqli_error($con);
}

// Close the connection
mysqli_close($con);
?>
