<?php
$mysqli = new mysqli("localhost", "root", "", "csv_to_sql");

$csvFilePath = "brand_list.csv";
$file = fopen($csvFilePath, "r");
while (($row = fgetcsv($file)) !== FALSE) {
    $stmt = $mysqli->prepare("INSERT INTO brand(name) VALUES (?)");
    if (is_numeric($row[1])) {
        $stmt->bind_param("s", $row[0]);
        $stmt->execute();
    }
}

$csvFilePath = "product_list.csv";
$file = fopen($csvFilePath, "r");
while (($row = fgetcsv($file)) !== FALSE) {
    $stmt = $mysqli->prepare("INSERT INTO product(product, id_brand) VALUES (?, ?)");
    if (is_numeric($row[2])) {
        $stmt->bind_param("si", $row[0], $row[2]);
        $stmt->execute();
    }
}


$stmt = $mysqli->prepare("INSERT INTO quality(quality) VALUES ('Fonctionnel – Parfait état')");
$stmt->execute();
$stmt = $mysqli->prepare("INSERT INTO quality(quality) VALUES ('Fonctionnel – Très bon état')");
$stmt->execute();
$stmt = $mysqli->prepare("INSERT INTO quality(quality) VALUES ('Fonctionnel – État correct')");
$stmt->execute();
$stmt = $mysqli->prepare("INSERT INTO quality(quality) VALUES ('Fonctionnel – Cassé')");
$stmt->execute();
$stmt = $mysqli->prepare("INSERT INTO quality(quality) VALUES ('Non fonctionnel – État correct')");
$stmt->execute();
$stmt = $mysqli->prepare("INSERT INTO quality(quality) VALUES ('Non fonctionnel – Cassé')");
$stmt->execute();



$csvFilePath = "price_list.csv";
$file = fopen($csvFilePath, "r");
while (($row = fgetcsv($file)) !== FALSE) {
    $stmt = $mysqli->prepare("INSERT INTO tarif(id_brand, id_quality,price) VALUES (?, ?, ?)");
    if (is_numeric($row[3])) {
        for ($i = 1; $i < 7; $i++) {
            $stmt->bind_param("iii", $row[3], $i, $row[2]);
            $stmt->execute();
        }
    }
}
