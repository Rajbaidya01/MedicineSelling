<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<!-- jQuery (required) -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- Select2 CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css"
	rel="stylesheet" />

<!-- Select2 JS -->
<script
	src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

<style>
body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	background-color: #ffffff; /* White background for clean billing */
	color: #212121; /* Dark text for readability */
	margin: 0;
	padding: 0;
}

h1 {
	text-align: center;
	color: #2e7d32; /* Brand green heading */
	padding: 20px;
}

form {
	width: 80%;
	max-width: 800px;
	margin: 0 auto;
	background-color: #f5f5f5; /* Soft grey background */
	color: #212121;
	padding: 30px;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
	border-radius: 8px;
}

label {
	display: block;
	margin-top: 15px;
	font-weight: 600;
	color: #2e7d32;
}

select, input[type="text"], input[type="number"], input[type="tel"] {
	width: 100%;
	padding: 10px;
	margin-top: 5px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
	background-color: #ffffff;
	color: #212121;
}

input[readonly] {
	background-color: #eeeeee;
	color: #555;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
	background-color: #ffffff;
	color: #212121;
}

table, th, td {
	border: 1px solid #cccccc;
}

th, td {
	text-align: center;
	padding: 10px;
}

th {
	background-color: #2e7d32; /* Brand green */
	color: #ffffff;
}

#totalAmount {
	background-color: #e8f5e9; /* Soft green highlight */
	color: #2e7d32;
	font-weight: bold;
}

#confirm {
	background-color: #2e7d32;
	color: #ffffff;
	padding: 10px 20px;
	font-size: 16px;
	border: none;
	border-radius: 8px;
	cursor: pointer;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
	transition: all 0.3s ease;
	margin-top: 20px;
}

#confirm:hover {
	background-color: #43a047;
	transform: scale(1.05);
}

#confirm:active {
	transform: scale(0.98);
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.3);
}

#print {
	background-color: #2e7d32;
	color: #ffffff;
	padding: 10px 20px;
	font-size: 16px;
	border: none;
	border-radius: 8px;
	cursor: pointer;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
	transition: all 0.3s ease;
	margin-top: 20px;
}

#print:hover {
	background-color: #43a047;
	transform: scale(1.05);
}

#print:active {
	transform: scale(0.98);
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.3);
}

#formSection {
	display: none; /* Hide the form initially */
}
</style>
<script>
function fetchMedicineDetails() {
	const medicineSelect = document.getElementById("medicineSelect");
	const medicineValue = medicineSelect.value;
	const xhr = new XMLHttpRequest();
	xhr.open("GET", "FetchMedicineDetails?name=" + medicineValue, true);
	xhr.onreadystatechange = function () {
		if (xhr.readyState === 4 && xhr.status === 200) {
			const obj = JSON.parse(xhr.responseText);
			document.getElementById("price").value = obj.price;
			document.getElementById("stock").value = obj.stock;
			document.getElementById("exp_date").value = obj.exp_date;
		}
	};
	xhr.send();
}

let totalAmount = 0;

function calculateAmount() {
	const price = parseInt(document.getElementById("price").value);
	const units = parseInt(document.getElementById("units").value);
	const amount = price * units;
	const medicineName = document.getElementById("medicineSelect").value;

	let flag = false;

	if (medicineName && !isNaN(amount)) {
		const table = document.getElementById("medicineTable");
		const rowCount = table.rows.length;

		for (let i = 1; i < rowCount; i++) {
			let row = table.rows[i];
			let existingMedicine = row.cells[0].innerHTML;
			if (existingMedicine === medicineName) {
				let existingUnits = parseInt(row.cells[1].innerHTML);
				let existingAmount = parseInt(row.cells[2].innerHTML);
				let newUnits = existingUnits + units;
				let newAmount = existingAmount + amount;
				row.cells[1].innerHTML = newUnits;
				row.cells[2].innerHTML = newAmount;
				flag = true;
				break;
			}
		}
		if (!flag) {
			let row = table.insertRow();
			row.insertCell(0).innerHTML = medicineName;
			row.insertCell(1).innerHTML = units;
			row.insertCell(2).innerHTML = amount;
		}
		totalAmount += amount;
		document.getElementById("totalAmount").value = totalAmount;
	}
}

function submitMedicineDetails() {
    const formData = new FormData();

    const rows = document.querySelectorAll("#medicineTable tr:not(:first-child)");
    
    const name = document.getElementById("name").value.trim();
    const address = document.getElementById("address").value.trim();
    const phno = document.getElementById("phno").value.trim();
    const totalAmount = document.getElementById("totalAmount").value.trim();

    formData.append("name", name);
    formData.append("address", address);
    formData.append("phno", phno);
    formData.append("totalAmount", totalAmount);
    
    rows.forEach((row, index) => {
        const cells = row.querySelectorAll("td");
        formData.append("medicineName", cells[0].textContent.trim());
        formData.append("units", cells[1].textContent.trim());
        formData.append("amount", cells[2].textContent.trim());
    });

    fetch("PDFMaker", {
        method: "POST",
        body: new URLSearchParams(formData)
    })
    .then(response => response.blob())
    .then(blob => {
        const url = window.URL.createObjectURL(blob);
        const a = document.createElement('a');
        a.href = url;
        a.download = 'bills.pdf';
        a.click();
        window.URL.revokeObjectURL(url);
    })
    .catch(error => console.error("Error generating PDF:", error));
}

</script>
</head>
<body>
	<h1>Medicine Purchase</h1>
	<form onsubmit="submitMedicineDetails(); return false;">
		<label for="medicineSelect">Select Medicine:</label> <select
			id="medicineSelect" class="select2" onchange="fetchMedicineDetails()"
			style="width: 100%;">
			<option value=""></option>
			<%
			Connection con = null;
			Statement stmt = null;
			ResultSet rs = null;
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/details_for_medicine", "root", "7#29sqlRAJ$@");
				stmt = con.createStatement();
				rs = stmt.executeQuery("select name from med_details");
				while (rs.next()) {
					String medicineName = rs.getString("name");
			%>
			<option value="<%=medicineName%>"><%=medicineName%></option>
			<%
			}
			} catch (Exception e) {
			e.printStackTrace();
			} finally {
			try {
			if (rs != null)
				rs.close();
			} catch (SQLException e) {
			}
			try {
			if (stmt != null)
				stmt.close();
			} catch (SQLException e) {
			}
			try {
			if (con != null)
				con.close();
			} catch (SQLException e) {
			}
			}
			%>
		</select><br> <br> <label for="price">Price:</label> <input
			type="text" id="price" readonly><br> <br> <label
			for="stock">Stock:</label> <input type="text" id="stock" readonly><br>
		<br> <label for="exp_date">Expiration Date:</label> <input
			type="text" id="exp_date" readonly><br> <br> <label
			for="units">Units to Purchase:</label> <input type="number"
			id="units" oninput="calculateAmount()"><br> <br>

		<table border="1" id="medicineTable">
			<tr>
				<th>Medicine Name</th>
				<th>Units</th>
				<th>Amount</th>
			</tr>
		</table>
		<br> <label for="totalAmount">Total Amount:</label> <input
			type="text" id="totalAmount" readonly><br> <br> <input
			type="button" id="confirm" value="CONFIRM"
			onclick="checkAmountAndShowForm()"><br> <br>

		<!-- Form Section (Hidden Initially) -->
		<div id="formSection">
			<label for="name">Customer's Information:</label>
			<label for="name">Name:</label> <input type="text" id="name"><br>
			<br> <label for="address">Address:</label> <input type="text"
				id="address"><br> <br> <label for="phno">Phone
				No:</label> <input type="tel" id="phno" pattern="[0-9]{10}" maxlength="10"
				placeholder="Enter 10-digit number"><br> <br> <input
				type="button" id="print" onclick="submitMedicineDetails()"
				value="PRINT">
		</div>

		<!-- Output Section -->
		<div id="output" style="margin-top: 20px; font-weight: bold;"></div>
	</form>
	<script>
    $(document).ready(function() {
        $('.select2').select2({
            placeholder: "Search or select medicine",
            allowClear: true
        });
    });
    function checkAmountAndShowForm() {
		const totalAmount = document.getElementById("totalAmount").value;
		
		if (totalAmount && !isNaN(totalAmount) && Number(totalAmount) > 0) {
			document.getElementById("formSection").style.display = "block";
		} else {
			alert("Please enter a valid total amount before submitting.");
		}
	}
</script>
</body>
</html>