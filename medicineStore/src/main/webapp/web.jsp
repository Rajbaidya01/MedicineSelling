<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
/* Base styling */
* {
	background-color: white;
}

body {
	margin: 0;
	font-family: 'Poppins', sans-serif;
	background-color: white;
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

.login p {
	display: flex;
	justify-content: space-between;
	align-items: center;
	background-color: #2e7d32;
	padding: 12px 20px;
	border-radius: 8px;
	font-family: 'Segoe UI', Tahoma, sans-serif;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
}

.login {
	display: flex;
	justify-content: space-between;
	align-items: center;
	background-color: #2e7d32;
}

/* Login button styling */
.nav-login input[type="submit"] {
	background-color: #ffffff;
	color: #2e7d32;
	border: none;
	padding: 10px 22px;
	border-radius: 30px;
	font-size: 16px;
	font-weight: 600;
	cursor: pointer;
	transition: all 0.3s ease;
}

.nav-login input[type="submit"]:hover {
	background-color: #c8e6c9;
	color: #1b5e20;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
}
/* Logout button styling */
.nav-logout input[type="submit"] {
	background-color: #ffffff;
	color: #2e7d32;
	border: none;
	padding: 10px 22px;
	border-radius: 30px;
	font-size: 16px;
	font-weight: 600;
	cursor: pointer;
	transition: all 0.3s ease;
}

.nav-logout input[type="submit"]:hover {
	background-color: #c8e6c9;
	color: #1b5e20;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
}

.login p {
	margin: 0 0 10px 0;
	font-size: 18px;
	color: #ffffff;
}

.login p strong {
	background-color: #2e7d32;
	color: #ffffff;
	font-weight: 700;
}

.hero {
	display: flex;
	height: 600px;
}

.hero-right {
	flex: 1;
	overflow: hidden;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.hero-right img {
	width: 80%;
	height: 80%;
	object-fit: cover;
	display: block;
	padding: 8px; /* adds space inside the image container */
	border-radius: 16px;
	box-shadow: 0 6px 20px rgba(0, 0, 0, 0.15);
	transition: transform 0.4s ease, box-shadow 0.4s ease;
}

/* Hover effect */
.hero-right img:hover {
	transform: scale(1.05); /* zoom in a bit */
	box-shadow: 0 4px 10px rgba(46, 125, 50, 0.35);
	/* deeper shadow on hover */
}

.hero-left {
	flex: 1;
	background-color: #ffffff;
	display: flex;
	flex-direction: column; /* Stack items vertically */
	justify-content: center; /* Center vertically */
	align-items: center; /* Center horizontally */
	padding: 50px;
	color: #333;
	text-align: center; /* Center text inside <h1> and <p> */
}

.hero-left h1 {
	font-size: 48px;
	color: #2e7d32;
	margin-bottom: 20px;
}

.hero-left p {
	font-size: 20px;
	margin-bottom: 30px;
	line-height: 1.5;
}

.hero-left button {
	background-color: #2e7d32;
	color: white;
	border: none;
	padding: 15px 30px;
	border-radius: 8px;
	font-size: 18px;
	cursor: pointer;
	transition: background 0.3s ease;
}

.hero-left button:hover {
	background-color: #256429;
}

.products-items {
	display: flex;
	height: 500px;
	justify-content: center;
	align-items: center;
}

.products-items img {
	width: 70%;
	height: 70%;
	object-fit: cover;
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 8px; /* adds space inside the image container */
	border-radius: 16px;
	box-shadow: 0 6px 20px rgba(0, 0, 0, 0.15);
	transition: transform 0.4s ease, box-shadow 0.4s ease;
}

.products-items div {
	height: 400px;
	width: 400px;
	display: flex;
	flex-wrap: wrap;
	justify-content: space-evenly
}

.products-items h4 {
	width: 400px;
	display: flex;
	flex-wrap: wrap;
	justify-content: space-evenly
}

.products h3, p {
	display: flex;
	justify-content: center;
	align-items: center;
}

.products h3, h4 {
	color: #2e7d32;
}

.products {
	padding: 60px 20px;
	text-align: center;
	border-radius: 32px;
	box-shadow: 0 8px 24px rgba(0, 0, 0, 0.15);
	margin: 40px 20px;
}

.footer {
	background-color: #2e7d32;
	color: #ffffff;
	padding: 40px 60px;
	display: flex;
	justify-content: space-between;
	flex-wrap: wrap;
	font-family: 'Segoe UI', sans-serif;
}

.footer-section h4 {
	font-size: 18px;
	margin-bottom: 12px;
	color: #ffffff;
	background-color: #2e7d32;
}

.footer-section a {
	color: #ffffff;
	text-decoration: none;
	transition: color 0.3s ease;
	background-color: #2e7d32;
}

.footer-section a:hover {
	color: #ffffff;
}

.footer-section p {
	background-color: #2e7d32;
}

.footer-section h3 {
	background-color: #2e7d32;
}

.footer-section ul {
	background-color: #2e7d32;
}

.footer-section li {
	background-color: #2e7d32;
}

.footer div {
	background-color: #2e7d32;
}
</style>
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
			<div class="nav-login">
				<div class="login">
					<%@ page language="java" session="true"%>
					<%
					String user1 = (String) session.getAttribute("user");
					if (user1 != null) {
					%>
					<p>
						Welcome, <strong>&nbsp;<%= user1 %></strong>!
					</p>
					<form action="LogoutServlet" method="post">
						<input type="submit" value="Logout">
					</form>
					<%
					} else {
					%>
					<form action="login.html" method="get">
						<input type="submit" value="Login">
					</form>
					<%
					}
					%>
				</div>

			</div>
		</div>
	</header>

	<div class="hero">
		<div class="hero-left">
			<h1>Your Health, Our Priority</h1>
			<p>Trusted medicines and healthcare essentials delivered to your
				door.</p>
			<%@ page language="java" session="true"%>
			<%
			String user2 = (String) session.getAttribute("user");
			if (user2 != null) {
			%>
			<form action="index.jsp" method="get">
				<button>Shop Now</button>
			</form>
			<%
			} else {
			%>
			<form action="login.html" method="get">
				<button>Shop Now</button>
			</form>
			<%
			}
			%>
		</div>
		<div class="hero-right">
			<img
				src="medical-green-background-abstract-illustrations-47240712-556311611.JPG"
				alt="Medicine Banner">
		</div>
	</div>

	<div class="products">
		<h3>Featured Products</h3>
		<p>Discover our most popular health and wellness products trusted
			by our customers.</p>
		<div class="products-items">
			<div class="med1">
				<img src="multi-o.webp" alt=pic1>
				<h4>Swallow Daily Vitamin</h4>
			</div>
			<div class="med2">
				<img src="418327-1.webp" alt=pic2>
				<h4>Torrent Shelcal 500</h4>
			</div>
			<div class="med3">
				<img src="61-1-500x500.webp" alt=pic3>
				<h4>Naproxen</h4>
			</div>
		</div>
	</div>
	<footer class="footer">
		<div class="footer-section about">
			<h3>MEDISPHERE</h3>
			<p>Your trusted online pharmacy and health partner.</p>
		</div>
		<div class="footer-section links">
			<h4>Quick Links</h4>
			<ul>
				<li><a href="#">Store</a></li>
				<li><a href="ContactUs.jsp">Contact</a></li>
				<li><a href="Blog.jsp">FAQ</a></li>
			</ul>
		</div>
		<div class="footer-section contact">
			<h4>Contact Us</h4>
			<p>Email: care@medicare.com</p>
			<p>Phone: +91-9876543210</p>
		</div>
		<div class="footer-section social">
			<h4>Follow Us</h4>
			<a href="#"><i class="fab fa-facebook"></i></a> <a href="#"><i
				class="fab fa-instagram"></i></a>
		</div>
	</footer>

</body>
</html>