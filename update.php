<?php
	require_once "db.php";
	$isBtnSearchClicked = isset($_POST["btnSearch"]);
	$car = null;
	$statuses = [];
	if($isBtnSearchClicked == true) {
		$carID = $_POST["patrolCarID"];	
		//echo "You have search Car ID: " . $carID;
		$sql = "SELECT * FROM `patrolcar` WHERE `patrolcar_ID` = '" . $carID ."'";
		$conn = new mysqli(DB_SERVER,DB_USER,DB_PASSWORD,DB_DATABASE);
		$result = $conn->query($sql);
		if($row = $result->fetch_assoc()) {
			$carID = $row["patrolcar_ID"];
			$statusID = $row["patrolcar_status_ID"];
			$car = ["id"=>$carID,"statusID"=>$statusID];
		}
		
		$conn = new mysqli(DB_SERVER,DB_USER,DB_PASSWORD,DB_DATABASE);
		$sql = "SELECT * FROM patrolcar_status";
		$result = $conn->query($sql);
		while($row = $result->fetch_assoc()){
		$id = $row["patrolcar_status_ID"];
		$title = $row["patrolcar_status_desc"];
		$status = ["id"=>$id, "title"=>$title];
		array_push($statuses,$status);
		}
		
		$conn->close();
	}
	
?>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Update Dispatch Car</title>
<link rel="stylesheet" href="css/bootstrap-4.4.1.css" type="text/css">
</head>

<body>
<div class="container" style="width:900px">
		<?php
			include "header.php";
		?>
		<section class="mt-3">
		  <form>
		  <?php
			  if($car != null) {
				  echo "<div class=\"form-group row\">
							<label for=\"patrolCarID\" class=\"col-sm-4 col-form-label\">Patrol Car Number</label>
							  <div class=\"col-sm-8\">
								  " . $car["id"] . "
								<input type=\"hidden\" id=\"patrolCarID\" name=\"patrolCarID\" value=\"" . $car["id"] ."\">
							  </div>
						  </div>
						  <div class=\"form-group row\">
							<label for=\"patrolCarStatus\" class=\"col-sm-4 col-form-label\">Patrol Car Status</label>
							  <div class=\"col-sm-8\">
									<select name=\"patrolCarStatus\" id=\"patrolCarStatus\" class=\"form-control\">
										<option value=\"\">Select</option>
										";
				  						$selected = "";
				  						foreach($statuses as $status) {
											echo "<option value=\"" . $status["id"] . "\">".
											$status["title"] . "</option>";
										}
				  						echo
				  						"
									</select>
							  </div>
						  </div>
						  <div class=\"form-group row\">
							  <div class=\"offset-sm-4 col-sm-8\">
								<button type=\"submit\" class=\"btn btn-primary\" name=\"submit\" id=\"submit\">Update</button>
							  </div>
						  </div>";
			  }
			  else {
				  echo  "<div class=\"form-group row\">
							  <div class=\"col-sm-12\">
								No records found.
							  </div>
						  </div>";
			  }
		   ?>
			 
		  </form>
        </section>
		<?php
			include "footer.php";
		?>
	</div>
<script src="js/jquery-3.4.1.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap-4.4.1.js"></script>
</body>
</html>