<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Panel</title>
<!-- Poppins font for consistency -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;800&display=swap" rel="stylesheet">

<style>
/* Paste your web.jsp CSS here so styling matches exactly */
* {
	background-color: white;
}

body {
	margin: 0;
	font-family: 'Poppins', sans-serif;
	background-color: white;
}

.navbar {
	display: flex;
	justify-content: space-between;
	align-items: center;
	background-color: #2e7d32;
	padding: 15px 50px;
	color: #2e7d32;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.nav-name p {
	font-size: 32px;
	font-weight: 800;
	margin: 0;
	letter-spacing: 1.5px;
	color: #ffffff;
	font-family: 'Segoe UI', 'Roboto', sans-serif;
	text-transform: uppercase;
	text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.3);
	cursor: default;
	transition: transform 0.3s ease;
	background-color: #2e7d32;
}

.nav-name p:hover {
	transform: scale(1.05);
}

.nav-middel {
	display: flex;
	gap: 30px;
	background-color: #2e7d32;
	padding: 10px 20px;
}

.nav-middel div a {
	margin: 0;
	font-size: 18px;
	font-weight: 500;
	cursor: pointer;
	color: #ffffff;
	padding: 8px 16px;
	transition: all 0.3s ease;
	font-family: 'Segoe UI', 'Roboto', sans-serif;
	text-transform: capitalize;
	user-select: none;
	text-decoration: none;
	display: inline-block;
	background-color: #2e7d32;
}

.nav-middel div a:hover {
	background-color: #c8e6c9;
	color: #1b5e20;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
	transform: translateY(-2px);
}

h1 {
	color: #2e7d32;
	text-align: center;
	margin-top: 40px;
}

.container {
	padding: 30px;
	max-width: 900px;
	margin: auto;
	background-color: white;
	box-shadow: 0 6px 20px rgba(0,0,0,0.1);
	border-radius: 16px;
}

p {
    text-align: center; /* Instead of justify-content */
    font-size: 16px;
    color: #333;
}

</style>
</head>
<body>

<!-- Navbar -->
<div class="navbar">
	<div class="nav-name">
		<p>Admin Panel</p>
	</div>
	<div class="nav-middel">
		<div><a href="dashboard.jsp">Dashboard</a></div>
		<div><a href="users.jsp">Users</a></div>
		<div><a href="settings.jsp">Settings</a></div>
	</div>
</div>

<!-- Main content -->
<div class="container">
	<h1>Welcome, Admin!</h1>
	<p>Here you can manage your application’s settings, users, and data.</p>
</div>

</body>
</html>
