<%@ page import="java.util.List" %>
<%@ page import="com.model.Product" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Report Results</title>
    <style>
        /* General Body Styles */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #fceabb 0%, #f8b500 100%); /* Warm, inviting gradient */
            color: #333;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            box-sizing: border-box;
        }

        /* Container for the Main Content */
        .container {
            max-width: 950px; /* Slightly wider container */
            margin: 40px auto;
            background-color: #fff;
            padding: 50px; /* Increased padding */
            border-radius: 15px; /* More rounded corners */
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.2); /* Stronger shadow for depth */
            animation: fadeIn 0.9s ease-out; /* Added animation for smooth entry */
        }

        /* Keyframe Animation for Container */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* Main Heading Style */
        h1 {
            color: #e67e22; /* Warm orange color */
            text-align: center;
            font-size: 2.8em; /* Larger, more impactful heading */
            margin-bottom: 30px;
            position: relative;
            padding-bottom: 10px; /* Space for the pseudo-element underline */
        }

        /* Underline effect for H1 */
        h1::after {
            content: '';
            width: 90px;
            height: 4px;
            background-color: #f39c12; /* Brighter orange accent */
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            border-radius: 2px;
        }

        /* Report Title Heading Style */
        h2 {
            color: #d35400; /* Darker orange for report title */
            text-align: center;
            font-size: 1.8em;
            margin-top: 30px;
            margin-bottom: 25px;
        }

        /* Table Styles */
        table {
            width: 100%;
            border-collapse: separate; /* Use separate for rounded corners on cells */
            border-spacing: 0; /* Remove default spacing */
            margin-top: 30px;
            font-size: 1em;
            border-radius: 10px; /* Rounded corners for the table itself */
            overflow: hidden; /* Ensures rounded corners are applied correctly */
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05); /* Subtle shadow for the table */
        }

        /* Table Header Styles */
        th {
            background-color: #f39c12; /* Bright orange background for headers */
            color: white;
            padding: 15px 20px; /* More padding */
            text-align: left;
            font-weight: 600;
            text-transform: uppercase; /* Uppercase text for headers */
            letter-spacing: 0.5px;
        }

        /* Table Data Cell Styles */
        td {
            padding: 14px 20px; /* Consistent padding */
            border-bottom: 1px solid #fdf5e6; /* Very light border for rows */
            background-color: #ffffff; /* White background for data cells */
            transition: background-color 0.3s ease;
        }

        /* Alternating Row Colors */
        tr:nth-child(even) td {
            background-color: #fffaf0; /* Very light yellow for even rows */
        }

        /* Row Hover Effect */
        tr:hover td {
            background-color: #fff0d9; /* Lighter orange on hover */
            cursor: pointer;
        }

        /* No Results Message */
        .no-results {
            text-align: center;
            color: #8b6e4e; /* Earthy tone for message */
            font-size: 1.2em;
            margin-top: 40px;
            padding: 20px;
            border: 1px dashed #dcb88a; /* Dashed border for empty state */
            border-radius: 8px;
            background-color: #fff9f0;
        }

        /* Message Box (Error/Info) */
        .message {
            text-align: center;
            margin-top: 25px;
            padding: 15px;
            border-radius: 8px;
            background-color: #fce4ec; /* Light pink for messages */
            color: #c2185b; /* Darker pink for text */
            border: 1px solid #f8bbd0;
            font-size: 1.05em;
            animation: slideIn 0.5s ease-out; /* Slide in animation for messages */
        }

        /* Keyframe Animation for messages */
        @keyframes slideIn {
            from { opacity: 0; transform: translateY(-10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* Back Links Styles */
        .back-link {
            display: block;
            text-align: center;
            margin-top: 30px; /* More space above links */
            color: #e67e22; /* Orange for back links */
            text-decoration: none;
            font-weight: 600;
            font-size: 1.1em;
            transition: color 0.3s ease, text-decoration 0.3s ease;
        }

        /* Back Links Hover Effect */
        .back-link:hover {
            color: #d35400; /* Darker orange on hover */
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
            h2 {
                font-size: 1.5em;
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
                color: #555;
            }
        }
        @media (max-width: 480px) {
            .container {
                padding: 25px;
            }
            h1 {
                font-size: 1.8em;
            }
            h2 {
                font-size: 1.3em;
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
        <h1>Report Results</h1>
        <% String reportTitle = (String) request.getAttribute("reportTitle"); %>
        <% String message = (String) request.getAttribute("message"); %>

        <% if (message != null) { %>
            <div class="message">
                <%= message %>
            </div>
        <% } else if (reportTitle != null && !reportTitle.isEmpty()) { %>
            <h2><%= reportTitle %></h2>
            <%
                List<Product> reportProducts = (List<Product>) request.getAttribute("reportProducts");
                if (reportProducts != null && !reportProducts.isEmpty()) {
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
                        <% for (Product product : reportProducts) { %>
                            <tr>
                                <td data-label="Product ID"><%= product.getProductID() %></td>
                                <td data-label="Product Name"><%= product.getProductName() %></td>
                                <td data-label="Category"><%= product.getCategory() %></td>
                                <td data-label="Price">&#x20B9;<%= String.format("%.2f", product.getPrice()) %></td>
                                <td data-label="Quantity"><%= product.getQuantity() %></td>
                            </tr>
                        <% } %>
                    </tbody>
                </table>
            <%
                } else {
            %>
                <p class="no-results">No products found for this report criteria.</p>
            <%
                }
            %>
        <% } else { %>
            <p class="no-results">No report generated or invalid criteria.</p>
        <% } %>
        <a href="ReportCriteriaServlet" class="back-link">Generate Another Report</a>
        <a href="index.jsp" class="back-link">Back to Home</a>
    </div>
</body>
</html>