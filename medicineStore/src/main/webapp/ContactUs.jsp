<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
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

body {
	font-family: 'Segoe UI', Tahoma, sans-serif;
	background-color: #f9f9f9;
	margin: 0;
	padding: 0;
}

.contact-container {
	max-width: 700px;
	margin: 50px auto;
	padding: 40px;
	background-color: #ffffff;
	border-radius: 12px;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}

.contact-container h2 {
	text-align: center;
	color: #2e7d32;
	margin-bottom: 30px;
}

.contact-form label {
	display: block;
	margin-bottom: 6px;
	font-weight: bold;
	color: #333;
}

.contact-form input, .contact-form textarea {
	width: 100%;
	padding: 12px;
	margin-bottom: 20px;
	border: 1px solid #ccc;
	border-radius: 6px;
	font-size: 14px;
}

.contact-form textarea {
	resize: vertical;
	height: 150px;
}

.contact-form button {
	background-color: #2e7d32;
	color: #fff;
	padding: 12px 20px;
	border: none;
	border-radius: 6px;
	cursor: pointer;
	font-size: 16px;
	transition: background-color 0.3s;
}

.contact-form button:hover {
	background-color: #256327;
}

@media ( max-width : 600px) {
	.contact-container {
		padding: 20px;
	}
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
	<div class="contact-container">
		<h2>Contact Us</h2>
		<form class="contact-form" action="ContactUs.jsp" method="post">
			<label for="name">Your Name</label> <input type="text" id="name"
				name="name" required> <label for="email">Your Email</label>
			<input type="email" id="email" name="email" required> <label
				for="subject">Subject</label> <input type="text" id="subject"
				name="subject" required> <label for="message">Message</label>
			<textarea id="message" name="message" required></textarea>

			<button type="submit" onclick="render()">Send Message</button>
		</form>
	</div>
	<script>
		function render() {
			alert("Submitted");
		}
	</script>
</body>
</html>