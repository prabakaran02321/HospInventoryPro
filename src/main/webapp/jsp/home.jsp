<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Home</title>
<style>
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
</style>
</head>
<body>
	<header>
		<div class="container">
			<div class="header-inner">
				<h1>Hospital Stock And Inventory</h1>
				<nav>
					<ul>
						<li><a href="<%= request.getContextPath() %>/jsp/home.jsp" class="nav-link">Home</a></li>
						<li><a href='<%= request.getContextPath() %>/api/request' class="nav-link">Request Stocks</a></li>
						<li><a href="#" class="nav-link">Dispense Stocks</a></li>
						<li><a href="#" class="nav-link">Manage Orders</a></li>
						<li><a href="#" class="nav-link">Logout</a></li>
					</ul>
				</nav>
			</div>
		</div>
	</header>

</body>
</html>
