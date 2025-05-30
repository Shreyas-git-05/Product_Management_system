<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Add Product</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #a8dadc 0%, #457b9d 100%); /* Softer, calming gradient */
            color: #2e3c43;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .container {
            max-width: 600px;
            background-color: #ffffff;
            padding: 40px; /* Increased padding */
            border-radius: 15px; /* More rounded corners */
            box-shadow: 0 12px 30px rgba(0, 0, 0, 0.15); /* More prominent shadow */
            animation: slideInUp 0.8s ease-out; /* Added animation */
        }

        @keyframes slideInUp {
            from { opacity: 0; transform: translateY(30px); }
            to { opacity: 1; transform: translateY(0); }
        }

        h1 {
            text-align: center;
            color: #1d3557; /* Darker blue for heading */
            margin-bottom: 35px; /* More space below heading */
            font-size: 2.5em; /* Larger heading */
            position: relative;
        }

        h1::after {
            content: '';
            width: 70px;
            height: 4px;
            background-color: #e63946; /* Accent color for underline */
            position: absolute;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
            border-radius: 2px;
        }

        form {
            display: grid;
            gap: 22px; /* Increased gap between form elements */
        }

        label {
            font-weight: 600;
            margin-bottom: 8px; /* More space below labels */
            color: #457b9d; /* Blue-gray for labels */
            font-size: 1.1em;
        }

        input[type="text"],
        input[type="number"] {
            padding: 14px; /* Increased padding */
            border: 1px solid #cddde3; /* Lighter border */
            border-radius: 8px; /* More rounded input fields */
            font-size: 1.05em;
            width: 100%;
            box-sizing: border-box;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }

        input[type="text"]:focus,
        input[type="number"]:focus {
            border-color: #457b9d; /* Highlight border on focus */
            box-shadow: 0 0 10px rgba(69, 123, 157, 0.2); /* Soft shadow on focus */
            outline: none;
        }

        input[type="submit"] {
            background: linear-gradient(to right, #e63946 0%, #c42f3a 100%); /* Red gradient for submit */
            color: white;
            padding: 15px; /* Slightly more padding */
            border: none;
            border-radius: 8px; /* More rounded button */
            font-size: 1.2em; /* Larger font size */
            font-weight: 700; /* Bolder font */
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 6px 15px rgba(230, 57, 70, 0.3); /* Button shadow */
        }

        input[type="submit"]:hover {
            background: linear-gradient(to left, #e63946 0%, #c42f3a 100%); /* Reverse gradient on hover */
            transform: translateY(-3px); /* Lift effect on hover */
            box-shadow: 0 8px 20px rgba(230, 57, 70, 0.4);
        }

        .message {
            text-align: center;
            margin-top: 25px; /* More space above message */
            padding: 15px; /* More padding */
            border-radius: 8px; /* More rounded message box */
            font-size: 1.05em;
            animation: fadeIn 0.6s ease-out; /* Fade in animation for messages */
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
            margin-top: 30px; /* More space above back link */
            color: #1d3557; /* Dark blue for link */
            text-decoration: none;
            font-weight: 600;
            font-size: 1.1em;
            transition: color 0.3s ease, text-decoration 0.3s ease;
        }

        .back-link:hover {
            color: #e63946; /* Accent color on hover */
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Add New Product</h1>
        <% String message = (String) request.getAttribute("message"); %>
        <% if (message != null) { %>
            <div class="message <%= message.contains("Failed") ? "error-message" : "success" %>">
                <%= message %>
            </div>
        <% } %>
        <form action="AddProductServlet" method="post">
            <label for="productId">Product ID:</label>
            <input type="text" id="productId" name="productId" required>

            <label for="productName">Product Name:</label>
            <input type="text" id="productName" name="productName" required>

            <label for="category">Category:</label>
            <input type="text" id="category" name="category" required>

            <label for="price">Price:</label>
            <input type="number" id="price" name="price" step="0.01" required>

            <label for="quantity">Quantity:</label>
            <input type="number" id="quantity" name="quantity" required>

            <input type="submit" value="Add Product">
        </form>
        <a href="index.jsp" class="back-link">Back to Home</a>
    </div>
</body>
</html>