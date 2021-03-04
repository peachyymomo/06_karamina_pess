<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Log-in</title>
<link rel="stylesheet" href="style.css" type="text/css">
</head>

<body>
	<form action="logcall.php" method="post">
		<?php if(isset($_GET['error'])) { ?>
			<p class="error"><?php echo $_GET['error']; ?></p>
		<?php } ?>
		<label>User ID</label>
		<input type="text" name="userID" id="userID" placeholder="Enter your User ID">
		<label>Password</label>
		<input type="password" name="password" id="password" placeholder="Enter your password">
		<button type="submit">Login</button>
	</form>
</body>
</html>