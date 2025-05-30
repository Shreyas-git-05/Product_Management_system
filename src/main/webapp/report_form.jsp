<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Generate Reports</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(to right, #4facfe 0%, #00f2fe 100%);
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
            color: #007bff;
            text-align: center;
            margin-bottom: 35px;
            font-size: 2.2em;
            position: relative;
        }
        h1::after {
            content: '';
            width: 90px;
            height: 4px;
            background-color: #17a2b8;
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
        select,
        input[type="number"],
        input[type="text"] {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: 6px;
            box-sizing: border-box;
            font-size: 1em;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }
        select:focus,
        input[type="number"]:focus,
        input[type="text"]:focus {
            border-color: #007bff;
            box-shadow: 0 0 8px rgba(0, 123, 255, 0.2);
            outline: none;
        }
        .input-group {
            display: none; /* Hidden by default */
            animation: slideIn 0.5s ease-out;
        }
        input[type="submit"] {
            background: linear-gradient(to right, #17a2b8 0%, #138496 100%);
            color: white;
            padding: 14px 25px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 1.1em;
            font-weight: bold;
            letter-spacing: 0.5px;
            transition: background 0.3s ease, transform 0.2s ease;
            box-shadow: 0 4px 10px rgba(23, 162, 184, 0.3);
        }
        input[type="submit"]:hover {
            background: linear-gradient(to right, #138496 0%, #17a2b8 100%);
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
            color: #007bff;
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
        <h1>Generate Product Reports</h1>
        <% String message = (String) request.getAttribute("message"); %>
        <% if (message != null) { %>
            <div class="message <%= message.contains("Invalid") ? "error-message" : "success" %>">
                <%= message %>
            </div>
        <% } %>
        <form action="ReportServlet" method="post">
            <label for="reportType">Select Report Type:</label>
            <select id="reportType" name="reportType" onchange="toggleReportFields()">
                <option value="">-- Select Report --</option>
                <option value="priceGreaterThan">Products with Price Greater Than</option>
                <option value="byCategory">Products in a Specific Category</option>
                <option value="topNByQuantity">Top N Products by Quantity</option>
            </select>

            <div id="priceThresholdGroup" class="input-group">
                <label for="priceThreshold">Price Threshold:</label>
                <input type="number" id="priceThreshold" name="priceThreshold" step="0.01">
            </div>

            <div id="categoryGroup" class="input-group">
                <label for="category">Category Name:</label>
                <input type="text" id="category" name="category">
            </div>

            <div id="limitGroup" class="input-group">
                <label for="limit">Number of Top Products (N):</label>
                <input type="number" id="limit" name="limit">
            </div>

            <input type="submit" value="Generate Report">
        </form>
        <a href="index.jsp" class="back-link">Back to Home</a>

        <script>
            function toggleReportFields() {
                var reportType = document.getElementById("reportType").value;
                document.getElementById("priceThresholdGroup").style.display = "none";
                document.getElementById("categoryGroup").style.display = "none";
                document.getElementById("limitGroup").style.display = "none";

                // Clear previous values and remove required attributes
                document.getElementById("priceThreshold").value = "";
                document.getElementById("priceThreshold").removeAttribute("required");
                document.getElementById("category").value = "";
                document.getElementById("category").removeAttribute("required");
                document.getElementById("limit").value = "";
                document.getElementById("limit").removeAttribute("required");

                if (reportType === "priceGreaterThan") {
                    document.getElementById("priceThresholdGroup").style.display = "block";
                    document.getElementById("priceThreshold").setAttribute("required", "required");
                } else if (reportType === "byCategory") {
                    document.getElementById("categoryGroup").style.display = "block";
                    document.getElementById("category").setAttribute("required", "required");
                } else if (reportType === "topNByQuantity") {
                    document.getElementById("limitGroup").style.display = "block";
                    document.getElementById("limit").setAttribute("required", "required");
                }
            }
            // Call on page load to set initial state
            window.onload = toggleReportFields;
        </script>
    </div>
</body>
</html>