<%@ page import="java.util.List" %>
<%@ page import="com.model.Product" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>All Products</title>
    <style>
        /* General Body Styles */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #e0f2f7 0%, #b3e0e7 100%); /* Light blue-green gradient */
            color: #2e3c43;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            box-sizing: border-box;
        }

        /* Container for the Main Content */
        .container {
            max-width: 1000px;
            margin: 40px auto; /* Adjusted margin for vertical centering */
            background-color: #ffffff;
            padding: 50px; /* Increased padding for more breathing room */
            border-radius: 15px; /* More rounded corners */
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.15); /* Stronger shadow for depth */
            animation: fadeIn 0.9s ease-out; /* Added animation for smooth entry */
        }

        /* Keyframe Animation for Container */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* Heading Style */
        h1 {
            text-align: center;
            color: #2196f3; /* A vibrant blue for the heading */
            font-size: 2.8em; /* Larger, more impactful heading */
            margin-bottom: 40px; /* More space below heading */
            position: relative;
            padding-bottom: 15px; /* Space for the pseudo-element underline */
        }

        /* Underline effect for H1 */
        h1::after {
            content: '';
            width: 100px; /* Wider underline */
            height: 4px;
            background-color: #00bcd4; /* Cyan accent for underline */
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            border-radius: 2px;
        }

        /* Table Styles */
        table {
            width: 100%;
            border-collapse: separate; /* Use separate for rounded corners on cells */
            border-spacing: 0; /* Remove default spacing */
            margin-top: 25px;
            font-size: 1em;
            border-radius: 10px; /* Rounded corners for the table itself */
            overflow: hidden; /* Ensures rounded corners are applied correctly */
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05); /* Subtle shadow for the table */
        }

        /* Table Header Styles */
        th {
            background-color: #2196f3; /* Vibrant blue background for headers */
            color: #ffffff;
            padding: 15px 20px; /* More padding */
            text-align: left;
            font-weight: 600;
            text-transform: uppercase; /* Uppercase text for headers */
            letter-spacing: 0.5px;
        }

        /* Table Data Cell Styles */
        td {
            padding: 14px 20px; /* Consistent padding */
            border-bottom: 1px solid #ebf2f5; /* Lighter border for rows */
            background-color: #ffffff; /* White background for data cells */
            transition: background-color 0.3s ease;
        }

        /* Alternating Row Colors */
        tr:nth-child(even) td {
            background-color: #f8fcff; /* Very light blue for even rows */
        }

        /* Row Hover Effect */
        tr:hover td {
            background-color: #e0f7fa; /* Light cyan on hover */
            cursor: pointer;
        }

        /* No Products Message */
        .no-products {
            text-align: center;
            color: #607d8b; /* Softer gray for message */
            font-size: 1.2em; /* Larger font for emphasis */
            margin-top: 40px;
            padding: 20px;
            border: 1px dashed #cfd8dc; /* Dashed border for empty state */
            border-radius: 8px;
            background-color: #f9f9f9;
        }

        /* Back Link Style */
        .back-link {
            display: block;
            text-align: center;
            margin-top: 45px; /* More space above the link */
            color: #2196f3; /* Blue for the back link */
            text-decoration: none;
            font-weight: 600;
            font-size: 1.1em;
            transition: color 0.3s ease, text-decoration 0.3s ease;
        }

        /* Back Link Hover Effect */
        .back-link:hover {
            color: #1976d2; /* Darker blue on hover */
            text-decoration: underline;
        }

        /* Responsive Design for Smaller Screens */
        @media (max-width: 768px) {
            .container {
                margin: 30px auto;
                padding: 30px;
            }
            h1 {
                font-size: 2.2em;
            }
            table, thead, tbody, th, td, tr {
                display: block; /* Make table elements behave as block elements */
            }
            thead tr {
                position: absolute;
                top: -9999px;
                left: -9999px; /* Hide table headers visually */
            }
            tr {
                border: 1px solid #ddd;
                margin-bottom: 15px;
                border-radius: 8px;
                overflow: hidden;
            }
            td {
                border: none; /* Remove individual cell borders */
                position: relative;
                padding-left: 50%; /* Space for the pseudo-element label */
                text-align: right;
            }
            td::before {
                content: attr(data-label); /* Use data-label for content */
                position: absolute;
                left: 10px;
                width: 45%;
                padding-right: 10px;
                white-space: nowrap;
                text-align: left;
                font-weight: 600;
                color: #444;
            }
        }
        @media (max-width: 480px) {
            .container {
                padding: 25px;
            }
            h1 {
                font-size: 1.8em;
            }
            td {
                font-size: 0.9em;
            }
            .back-link {
                font-size: 1em;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>All Products in Inventory</h1>
        <%
            List<Product> products = (List<Product>) request.getAttribute("products");
            if (products != null && !products.isEmpty()) {
        %>
            <table>
                <thead>
                    <tr>
                        <th>Product ID</th>
                        <th>Product Name</th>
                        <th>Category</th>
                        <th>Price</th>
                        <th>Quantity</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Product product : products) { %>
                        <tr>
                            <td data-label="Product ID"><%= product.getProductID() %></td>
                            <td data-label="Product Name"><%= product.getProductName() %></td>
                            <td data-label="Category"><%= product.getCategory() %></td>
                            <td data-label="Price"><%= String.format("%.2f", product.getPrice()) %></td>
                            <td data-label="Quantity"><%= product.getQuantity() %></td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        <%
            } else {
        %>
            <p class="no-products">No products found in the inventory.</p>
        <%
            }
        %>
        <a href="index.jsp" class="back-link">Back to Home</a>
    </div>
</body>
</html>