<?php
	require_once "db.php";
	$isBtnSearchClicked = isset($_POST["btnSearch"]);
	$car = null;
	
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
			  if($car is != null) {
				  
			  }
			?>
			  <div class="form-group row">
			    <label for="patrolCarID" class="col-sm-4 col-form-label">Patrol Car Number</label>
				  <div class="col-sm-8">
				  <span>
					  <?php echo $carID; ?>
				  	<input type="hidden" id="patrolCarID" name="patrolCarID" value="<?php echo $carID ?>">
				  </span>
				  </div>
			  </div>
			  <div class="form-group row">
			    <label for="patrolCarStatus" class="col-sm-4 col-form-label">Patrol Car Status</label>
				  <div class="col-sm-8">
			    	<span>
				  		<select name="patrolCarStatus" id="patrolCarStatus" class="form-control">
							<option value="">Select</option>
							<option value=""></option>
						</select>
				    </span>
				  </div>
			  </div>
			  <div class="form-group row">
				  <div class="offset-sm-4 col-sm-8">
			  		<button type="submit" class="btn btn-primary" name="submit" id="submit">Update</button>
				  </div>
			  </div>
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