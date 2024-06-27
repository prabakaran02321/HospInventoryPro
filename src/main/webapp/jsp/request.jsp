<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="java.util.List"%>
<%@ page import="com.hsaims.model.RequestStock"%>
<jsp:useBean id="requestRepo" class="com.hsaims.repository.RequestStockRepo"/>  

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Request Stocks</title>
<style>
/* Global styles */
body {
	font-family: 'Roboto', sans-serif;
	background-color: #f7fafc;
	margin: 0;
	padding: 0;
}

.container {
	max-width: 1200px;
	margin: 0 auto;
	padding: 0 1rem;
}

/* Header styles */
header {
    background-color: #3b82f6; /* Change header background color */
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    padding: 1rem 0;
    color: #ffffff; /* Set text color to white */
}

header .header-inner {
    display: flex;
    justify-content: space-between;
    align-items: center;
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 1rem;
}

header h1 {
    font-size: 2rem;
    font-weight: 700;
    color: #ffffff; /* Set heading color to white */
    margin: 0; /* Remove default margin */
}

header nav ul {
    display: flex;
    list-style-type: none;
    margin: 0;
    padding: 0;
}

header nav ul li {
    margin-right: 1rem;
}

header nav ul li a {
    color: #ffffff; /* Set link color to white */
    text-decoration: none;
    padding: 0.5rem 1rem;
    border-radius: 0.25rem;
    transition: background-color 0.3s ease, color 0.3s ease; /* Add transition for smoother hover effect */
}

header nav ul li a:hover {
    background-color: #2563eb; /* Darken background color on hover */
    color: #ffffff; /* Maintain text color on hover */
}

/* Form and Table styles */
.form-container {
    background-color: #ffffff;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    padding: 2rem;
    margin-bottom: 2rem;
    margin-top: 40px;
    border-radius: 0.5rem;
}

.form-container h2 {
    font-size: 1.5rem;
    font-weight: 700;
    color: #4b5563;
    margin-bottom: 1rem;
}

.form-container form {
    display: flex;
    flex-direction: column; /* Set form fields in a vertical order */
    gap: 2rem;
}

.form-container label {
    font-weight: 600;
    color: #4b5563;
    margin-bottom: 0.5rem;
}

.form-container select,
.form-container input[type="number"] {
    width: 100%;
    padding: 0.75rem;
    border: 1px solid #d1d5db;
    border-radius: 0.25rem;
    font-size: 1rem;
    transition: border-color 0.3s ease;
}

.form-container select:focus,
.form-container input[type="number"]:focus {
    outline: none;
    border-color: #3b82f6;
}

.form-container button {
    background-color: #3b82f6;
    color: #ffffff;
    padding: 0.75rem 1.5rem;
    border: none;
    border-radius: 0.25rem;
    font-size: 1rem;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.form-container button:hover {
    background-color: #2563eb;
}

.table-container {
	background-color: #ffffff;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	padding: 1.5rem;
}

.table-container h2 {
	font-size: 1.5rem;
	font-weight: 700;
	color: #4b5563;
	margin-bottom: 1rem;
}

.table-container table {
	width: 100%;
	border-collapse: collapse;
}

.table-container th, .table-container td {
	border: 1px solid #d1d5db;
	padding: 0.75rem;
	text-align: left;
}

.table-container th {
	background-color: #edf2f7;
	font-weight: 600;
	color: #4b5563;
}

.table-container td {
	color: #374151;
}
</style>
</head>
<body>

	<!-- Header -->
	<header>
		<div class="container">
			<div class="header-inner">
				<h1>Request Stocks</h1>
				<nav>
					<ul>
						<li><a href="#" class="nav-link">Home</a></li>
						<li><a href="#" class="nav-link">Request Stocks</a></li>
						<li><a href="#" class="nav-link">Dispense Stocks</a></li>
						<li><a href="#" class="nav-link">Manage Orders</a></li>
						<li><a href="#" class="nav-link">Logout</a></li>
					</ul>
				</nav>
			</div>
		</div>
	</header>

	<div class="container">
		<!-- Main Section -->
		<main class="space-y-8">
			<!-- New Stock Request Form -->
			<div class="form-container">
				<h2>New Stock Request</h2>
				<form>
					<div>
						<label for="stock-item">Select Stock Item</label> <select
							id="stock-item" name="stock">
							<option value="" selected="selected">-- Select Item --</option>
							<% ResultSet rsStock = requestRepo.getStockItems(); 
							   while(rsStock.next()){ %>
							<option value='<%=rsStock.getString("stock_id")%>'><%=rsStock.getString("name") %></option>
							<% } %>
						</select>
					</div>
					<div>
						<label for="quantity">Enter Quantity</label> <input type="number"
							id="quantity" name="quantity">
					</div>
					<div>
						<label for="department">Select Department</label> <select
							id="department" name="department">
							<option value="" selected="selected">-- Select Department --</option>
							<% ResultSet rsDepart = requestRepo.getDepartments(); 
							   while(rsDepart.next()){ %>
							<option value='<%=rsDepart.getString("department_id") %>'><%=rsDepart.getString("name") %></option>
							<% } %>
						</select>
					</div>
					<button type="submit">Submit Request</button>
				</form>
			</div>

			<%
			
			%>
			<div class="table-container">
				<h2>My Requests</h2>
				 <table class="table table-striped">
            <thead>
                <tr>
                    <th>S.no</th>
                    <th>Stock ID</th>
                    <th>Quantity</th>
                    <th>Requested By</th>
                    <th>Department ID</th>
                    <th>Status</th>
                    <th>Created At</th>
                    <th>Updated At</th>
                </tr>
            </thead>
            <tbody>
                <%
                List<RequestStock> requestList = (List<RequestStock>) request.getAttribute("requestsList");
                int recordsPerPage = (int) request.getAttribute("recordsPerPage");
                int currentPage = (int) request.getAttribute("currentPage");
                    int serialNo = (currentPage - 1) * recordsPerPage + 1;
                    for (RequestStock req : requestList) {
                %>
                <tr>
                    <td><%= serialNo++ %></td>
                    <td><%= req.getStockId() %></td>
                    <td><%= req.getQuantity() %></td>
                    <td><%= req.getRequestedBy() %></td>
                    <td><%= req.getDepartmentId() %></td>
                    <td><%= req.getStatus() %></td>
                    <td><%= req.getCreatedAt() %></td>
                    <td><%= req.getUpdatedAt() %></td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
			</div>
		</main>
	</div>

</body>
</html>
