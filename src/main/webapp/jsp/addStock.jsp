<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hospital Stocks and Inventory Management System</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
</head>
<body class="bg-gray-100 text-gray-800 font-sans">
    <div class="container mx-auto p-5">
        <h1 class="text-3xl font-bold mb-5">Hospital Stocks and Inventory Management System</h1>
        
 
        <!-- Screen 2: Add New Stock -->
        <div class="bg-white p-5 rounded-lg shadow-lg">
            <h2 class="text-2xl font-semibold mb-4">Add New Stock</h2>
            <form action="/stockService" method="post">
                <!-- Stock Information Form -->
                <div class="grid grid-cols-1 md:grid-cols-2 gap-4 mb-4">
                    <div>
                        <label for="stock-name" class="block mb-1">Stock Name</label>
                        <input type="text" id="stock-name" name="stockName" class="border border-gray-300 p-2 rounded-lg w-full" required>
                    </div>
                    <div>
                        <label for="description" class="block mb-1">Description</label>
                        <textarea id="description" name="description" class="border border-gray-300 p-2 rounded-lg w-full"></textarea>
                    </div>
                    <div>
                        <label for="quantity" class="block mb-1">Quantity</label>
                        <input type="number" id="quantity" name="quantity" class="border border-gray-300 p-2 rounded-lg w-full" required>
                    </div>
                    <div>
                        <label for="initial-quantity" class="block mb-1">Initial Quantity</label>
                        <input type="number" id="initial-quantity" name="initialQuantity" class="border border-gray-300 p-2 rounded-lg w-full" required>
                    </div>
                    <div>
                        <label for="supplier" class="block mb-1">Supplier</label>
                        <select id="supplier" name="supplier" class="border border-gray-300 p-2 rounded-lg w-full" required>
                            <option value="">Select Supplier</option>
                            <!-- Populate with suppliers from database -->
                        </select>
                    </div>
                    <div>
                        <label for="expiry-date" class="block mb-1">Expiry Date</label>
                        <input type="date" id="expiry-date" name="expiryDate" class="border border-gray-300 p-2 rounded-lg w-full">
                    </div>
                </div>

                <!-- Action Buttons -->
                <div class="flex space-x-2">
                    <button type="submit" class="bg-blue-500 text-white p-2 rounded-lg">Submit</button>
                    <button type="reset" class="bg-gray-500 text-white p-2 rounded-lg">Reset</button>
                </div>
            </form>

            <!-- Confirmation and Validation Messages -->
            <div id="message" class="mt-4">
                <% 
                    String stockName = request.getParameter("stockName");
                    if (stockName != null) {
                        out.println("<div class=\"bg-green-100 text-green-800 p-2 rounded-lg\">Stock added successfully!</div>");
                    }
                %>
            </div>
       
