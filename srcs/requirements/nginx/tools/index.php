<?php
# Credentials
$database = 'wordpress';
$username = 'ayoub';
$password = 'ayoub0330';
$host = 'maria';  // Use the service name from docker-compose.yml

# Establish connection
try {
    $conn = new PDO('mysql:host='.$host.';dbname='.$database, $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    echo 'Connected successfully<br>';
} catch(PDOException $e) {
    echo 'Connection failed: ' . $e->getMessage();
}

# Test retrieving data
$sql = 'SELECT * FROM users';
$statement = $conn->query($sql);
$data = $statement->fetchAll();
foreach($data as $row) {
    echo 'id: ' . $row['id'] . ', name: ' . $row['name'].'<br>';
}
?>
