<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Product Management System</title>
    <style>
        /* General Body Styles */
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #a8dadc 0%, #457b9d 100%); /* A soft, inviting blue-green gradient */
            color: #2e3c43;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh; /* Full viewport height */
            box-sizing: border-box; /* Include padding and border in the element's total width and height */
        }

        /* Container for the Main Content */
        .container {
            max-width: 850px; /* Slightly wider container */
            margin: 40px auto; /* Adjusted margin for vertical centering */
            background-color: #ffffff;
            padding: 50px 40px; /* Increased padding */
            border-radius: 15px; /* More rounded corners */
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.2); /* More prominent shadow for depth */
            text-align: center; /* Center content within the container */
            animation: fadeInScale 0.9s ease-out; /* Added animation for a grander entrance */
        }

        /* Keyframe Animation for Container */
        @keyframes fadeInScale {
            from { opacity: 0; transform: scale(0.95) translateY(20px); }
            to { opacity: 1; transform: scale(1) translateY(0); }
        }

        /* Heading Style */
        h1 {
            color: #1d3557; /* A deep, rich blue */
            font-size: 3em; /* Larger, more impactful heading */
            margin-bottom: 45px; /* More space below heading */
            position: relative;
            padding-bottom: 15px; /* Space for the pseudo-element underline */
        }

        /* Underline effect for H1 */
        h1::after {
            content: '';
            width: 120px; /* Wider underline */
            height: 5px; /* Thicker underline */
            background-color: #e63946; /* Striking red accent */
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            border-radius: 3px;
        }

        /* Menu Navigation Styles */
        .menu {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 25px; /* Increased gap between menu items */
            margin-bottom: 50px; /* Space before the footer */
        }

        /* Individual Menu Link Styles */
        .menu a {
            flex: 1 1 250px; /* Allows flexibility and a larger base size */
            max-width: 270px; /* Max width for consistency */
            padding: 20px 25px; /* More padding for a bigger clickable area */
            background: linear-gradient(45deg, #457b9d 0%, #1d3557 100%); /* Blue gradient for buttons */
            color: #ffffff;
            text-decoration: none;
            font-size: 1.15em; /* Larger font size */
            font-weight: 600;
            border-radius: 10px; /* More rounded buttons */
            transition: all 0.3s ease; /* Smooth transition for all properties */
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1); /* Subtle shadow */
            position: relative;
            overflow: hidden; /* For hover effect */
        }

        /* Menu Link Hover Effects */
        .menu a:hover {
            transform: translateY(-5px); /* More pronounced lift effect */
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.25); /* Stronger shadow on hover */
            background: linear-gradient(45deg, #1d3557 0%, #457b9d 100%); /* Reverse gradient on hover */
        }

        .menu a::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: rgba(255, 255, 255, 0.1); /* Light overlay effect */
            transition: all 0.3s ease-in-out;
            transform: skewX(-20deg);
        }

        .menu a:hover::before {
            left: 100%;
        }


        /* Footer Styles */
        .footer {
            margin-top: 50px; /* More space above the footer */
            text-align: center;
            font-size: 0.9em;
            color: #6a808a; /* Softer gray for copyright */
        }

        /* Responsive Design for Smaller Screens */
        @media (max-width: 768px) {
            .container {
                margin: 30px auto;
                padding: 30px 20px;
            }
            h1 {
                font-size: 2.5em;
            }
            .menu {
                flex-direction: column;
                align-items: center;
                gap: 15px; /* Slightly less gap for smaller screens */
            }
            .menu a {
                width: 90%; /* Wider buttons on smaller screens */
                max-width: 300px; /* Limit max width */
                font-size: 1em;
                padding: 18px 20px;
            }
        }

        @media (max-width: 480px) {
            h1 {
                font-size: 2em;
                margin-bottom: 30px;
            }
            h1::after {
                width: 90px;
            }
            .container {
                padding: 25px 15px;
            }
            .menu a {
                font-size: 0.95em;
                padding: 16px 18px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Product Management System</h1>
        <div class="menu">
            <a href="productadd.jsp">Add New Product</a>
            <a href="productupdate.jsp">Update Product Details</a>
            <a href="productdelete.jsp">Delete Product</a>
            <a href="DisplayProductsServlet">View All Products</a>
            <a href="ReportCriteriaServlet">Generate Reports</a>
        </div>
        <div class="footer">
            &copy; 2025 Product Management System. All rights reserved.
        </div>
    </div>
</body>
</html>