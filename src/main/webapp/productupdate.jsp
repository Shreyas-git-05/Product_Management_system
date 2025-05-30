<%@ page import="com.model.Product" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Product</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient to right, #6a11cb 0%, #2575fc 100%;
            color: #333;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
        .container {
            max-width: 650px;
            background-color: #fff;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
            animation: fadeIn 0.8s ease-out;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        h1 {
            color: #2575fc;
            text-align: center;
            margin-bottom: 35px;
            font-size: 2.2em;
            position: relative;
        }
        h1::after {
            content: '';
            width: 80px;
            height: 4px;
            background-color: #ffc107;
            position: absolute;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
            border-radius: 2px;
        }
        form {
            display: grid;
            gap: 18px;
        }
        label {
            font-weight: bold;
            margin-bottom: 5px;
            color: #555;
            display: block;
        }
        input[type="text"],
        input[type="number"] {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: 6px;
            box-sizing: border-box;
            font-size: 1em;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }
        input[type="text"]:focus,
        input[type="number"]:focus {
            border-color: #2575fc;
            box-shadow: 0 0 8px rgba(37, 117, 252, 0.2);
            outline: none;
        }
        input[type="submit"] {
            background: linear-gradient(to right, #ffc107 0%, #ff8c00 100%);
            color: #fff;
            padding: 14px 25px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 1.1em;
            font-weight: bold;
            letter-spacing: 0.5px;
            transition: background 0.3s ease, transform 0.2s ease;
            box-shadow: 0 4px 10px rgba(255, 193, 7, 0.3);
        }
        input[type="submit"]:hover {
            background: linear-gradient(to right, #ff8c00 0%, #ffc107 100%);
            transform: translateY(-2px);
        }
        .message {
            text-align: center;
            margin-top: 25px;
            padding: 12px;
            border-radius: 6px;
            font-size: 1.05em;
            animation: slideIn 0.5s ease-out;
        }
        @keyframes slideIn {
            from { opacity: 0; transform: translateY(-10px); }
            to { opacity: 1; transform: translateY(0); }
        }
        .message.success {
            background-color: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }
        .message.error-message {
            background-color: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }
        .back-link {
            display: block;
            text-align: center;
            margin-top: 30px;
            color: #2575fc;
            text-decoration: none;
            font-size: 1.05em;
            transition: color 0.3s ease, text-decoration 0.3s ease;
        }
        .back-link:hover {
            color: #0056b3;
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Update Product Details</h1>
        <% String message = (String) request.getAttribute("message"); %>
        <% if (message != null) { %>
            <div class="message <%= message.contains("Failed") || message.contains("not found") ? "error-message" : "success" %>">
                <%= message %>
            </div>
        <% } %>

        <% Product product = (Product) request.getAttribute("product"); %>

        <form action="UpdateProductServlet" method="post">
            <label for="productID">Product ID:</label>
            <input type="number" id="productID" name="productID" value="<%= (product != null) ? product.getProductID() : "" %>" required>

            <label for="productName">Product Name:</label>
            <input type="text" id="productName" name="productName" value="<%= (product != null) ? product.getProductName() : "" %>" required>

            <label for="category">Category:</label>
            <input type="text" id="category" name="category" value="<%= (product != null) ? product.getCategory() : "" %>" required>

            <label for="price">Price:</label>
            <input type="number" id="price" name="price" step="0.01" value="<%= (product != null) ? product.getPrice() : "" %>" required>

            <label for="quantity">Quantity:</label>
            <input type="number" id="quantity" name="quantity" value="<%= (product != null) ? product.getQuantity() : "" %>" required>

            <input type="submit" value="Update Product">
        </form>
        <a href="index.jsp" class="back-link">Back to Home</a>
    </div>
</body>
</html>