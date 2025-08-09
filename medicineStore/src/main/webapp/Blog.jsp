<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f9f9f9;
	color: #333;
}

.blog-container {
	max-width: 800px;
	margin: 40px auto;
	background-color: #fff;
	padding: 30px 40px;
	border-radius: 10px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}

.blog-container h1 {
	font-size: 28px;
	color: #2e7d32;
	margin-bottom: 20px;
}

.blog-container h2 {
	font-size: 22px;
	margin-top: 30px;
	color: #444;
}

.blog-container p {
	line-height: 1.7;
	margin: 15px 0;
}

.blog-container ul {
	padding-left: 20px;
	margin: 15px 0;
}

.blog-container ul li {
	margin-bottom: 8px;
}

.highlight {
	color: #2e7d32;
	font-weight: bold;
}

.cta {
	margin-top: 30px;
	padding: 15px;
	background-color: #e8f5e9;
	border-left: 6px solid #2e7d32;
	border-radius: 5px;
	font-size: 16px;
}
/* Navbar container */
.navbar {
	display: flex;
	justify-content: space-between;
	align-items: center;
	background-color: #2e7d32; /* Dark Green */
	padding: 15px 50px;
	color: #2e7d32;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

/* Brand name */
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

/* Middle nav items */
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
</style>

</head>
<body>
	<header>
		<div class="navbar">
			<div class="nav-name">
				<p>MEDISPHERE</p>
			</div>
			<div class="nav-middel">
				<div class="home">
					<a href="web.jsp">Home</a>
				</div>
				<div class="blog">
					<a href="Blog.jsp">Blog</a>
				</div>
				<div class="contact">
					<a href="ContactUs.jsp">Contact Us</a>
				</div>
			</div>
		</div>
	</header>
	<div class="blog-container">
		<h1>Smart Medicine Billing Made Simple</h1>

		<p>
			In today’s fast-moving digital world, pharmacies and clinics are
			shifting to smarter, more efficient systems. Our <span
				class="highlight">online medicine billing platform</span> is built
			to simplify the way you manage prescriptions, patients, and payments
			— all in one place.
		</p>

		<h2>Why Go Digital?</h2>
		<ul>
			<li><strong>Generate digital bills</strong> instantly</li>
			<li><strong>Track medicine units</strong> and pricing with ease</li>
			<li><strong>Store patient details</strong> securely</li>
			<li><strong>Download PDF bills</strong> with one click</li>
			<li><strong>Access anywhere</strong> mobile friendly</li>
		</ul>

		<h2>Easy for Pharmacies and Clinics</h2>
		<p>
			Log in securely, select medicines, enter quantities, and let the
			system calculate totals. Hit <strong>PRINT</strong> to generate a
			detailed PDF no extra tools required.
		</p>

		<h2>Secure and Personalized</h2>
		<p>
			Each user sees a friendly <span class="highlight">welcome
				message</span>, with one-click login/logout. Patient info like name,
			address, and phone can be entered, saved, and printed in seconds.
		</p>

		<h2>What’s Inside a Bill?</h2>
		<ul>
			<li>Patient name, address, and contact</li>
			<li>Medicine list with units and amount</li>
			<li>Auto-calculated total</li>
			<li>PDF layout ready for printing</li>
		</ul>

		<div class="cta">
			<strong>Ready to go digital?</strong> Try our online billing system
			today and simplify your medical workflow.
		</div>
	</div>
</body>
</html>