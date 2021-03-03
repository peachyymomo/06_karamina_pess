<?php
	require_once("db.php");
	$conn = new mysqli(DB_SERVER,DB_USER,DB_PASSWORD,DB_DATABASE);
?>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Dispatch Patrol Cars</title>
<link rel="stylesheet" href="css/bootstrap-4.4.1.css" type="text/css">
</head>

<body>
<div class="container" style="width:900px">
		<?php
			include "header.php";
		?>
		<section class="mt-3">
		  <form action="<?php echo htmlentities($_SERVER["PHP_SELF"]) ?>" method="post">
			  
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