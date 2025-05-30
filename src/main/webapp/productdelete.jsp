<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Delete Product</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #ffdde1 0%, #ffafbd 100%); /* Soft red-pink gradient */
            color: #2e3c43;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .container {
            max-width: 600px;
            margin: 60px auto;
            background-color: #ffffff;
            padding: 40px 30px;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.08);
            animation: fadeIn 0.8s ease-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        h1 {
            text-align: center;
            color: #c0392b; /* Stronger red for heading */
            margin-bottom: 30px;
            font-size: 2.5em; /* Larger heading */
            position: relative;
        }

        h1::after {
            content: '';
            width: 70px;
            height: 4px;
            background-color: #e74c3c; /* Accent red for underline */
            position: absolute;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
            border-radius: 2px;
        }

        form {
            display: grid;
            gap: 20px;
        }

        label {
            font-weight: 600;
            margin-bottom: 5px;
            color: #333;
            font-size: 1.1em;
        }

        input[type="number"] {
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 1.05em;
            width: 100%;
            box-sizing: border-box;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }

        input[type="number"]:focus {
            border-color: #e74c3c; /* Red border on focus */
            box-shadow: 0 0 8px rgba(231, 76, 60, 0.2); /* Soft red shadow on focus */
            outline: none;
        }

        input[type="submit"] {
            background: linear-gradient(to right, #e74c3c 0%, #c0392b 100%); /* Red gradient for button */
            color: white;
            padding: 14px;
            border: none;
            border-radius: 6px;
            font-size: 1.2em; /* Larger font size */
            font-weight: 700; /* Bolder font */
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 4px 10px rgba(231, 76, 60, 0.3); /* Button shadow */
        }

        input[type="submit"]:hover {
            background: linear-gradient(to left, #e74c3c 0%, #c0392b 100%); /* Reverse gradient on hover */
            transform: translateY(-2px); /* Lift effect on hover */
            box-shadow: 0 6px 15px rgba(231, 76, 60, 0.4);
        }

        .message {
            text-align: center;
            margin-top: 20px;
            padding: 12px;
            border-radius: 6px;
            font-size: 1.05em;
            animation: slideIn 0.5s ease-out; /* Slide in animation for messages */
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
            margin-top: 25px;
            color: #3498db; /* Blue for back link */
            text-decoration: none;
            font-weight: 600;
            font-size: 1.1em;
            transition: color 0.3s ease, text-decoration 0.3s ease;
        }

        .back-link:hover {
            color: #2980b9; /* Darker blue on hover */
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Delete Product</h1>
        <% String message = (String) request.getAttribute("message"); %>
        <% if (message != null) { %>
            <div class="message <%= message.contains("Failed") ? "error-message" : "success" %>">
                <%= message %>
            </div>
        <% } %>
        <form action="DeleteProductServlet" method="post">
            <label for="productID">Product ID:</label>
            <input type="number" id="productID" name="productID" required>

            <input type="submit" value="Delete Product">
        </form>
        <a href="index.jsp" class="back-link">Back to Home</a>
    </div>
</body>
</html>