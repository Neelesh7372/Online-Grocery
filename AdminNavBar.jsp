<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <style>
        @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap");
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: "Poppins", sans-serif;
        }
        body {
            background-color: #f4f4f9;
            color: #333;
        }
        nav {
            background-color: #007bff; /* Blue background */
            color: #fff;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .logo a {
            text-decoration: none;
            font-size: 1.8rem;
            font-weight: bold;
            color: #fff;
            transition: color 0.3s ease;
        }
        .logo a:hover {
            color: #cce5ff; /* Light blue hover effect */
        }
        nav ul {
            list-style: none;
            display: flex;
            gap: 20px;
        }
        nav ul li {
            position: relative;
        }
        nav ul li a {
            text-decoration: none;
            color: #fff;
            font-weight: 500;
            padding: 8px 15px;
            border-radius: 5px;
            transition: background-color 0.3s ease, color 0.3s ease;
        }
        nav ul li a:hover {
            background-color: #0056b3; /* Darker blue for hover effect */
            color: #cce5ff; /* Light blue text hover effect */
        }
        nav ul li a:active {
            background-color: #004085; /* Even darker blue for active state */
        }
        nav ul li a::after {
            content: '';
            position: absolute;
            bottom: -5px;
            left: 0;
            width: 0%;
            height: 2px;
            background-color: #fff;
            transition: width 0.3s ease;
        }
        nav ul li a:hover::after {
            width: 100%;
        }
        /* Mobile responsiveness */
        @media (max-width: 768px) {
            nav {
                flex-direction: column;
                align-items: flex-start;
            }
            nav ul {
                flex-direction: column;
                width: 100%;
            }
            nav ul li {
                margin: 5px 0;
            }
        }
    </style>
</head>
<body>
    <nav>
        <div class="logo">
            <a href="AdminHome.jsp" id="homepageLogo">Admin Dashboard</a>
        </div>
        <ul>
            <li><a href="CustomerManagement.jsp">Customers</a></li>
            <li><a href="ProductManagement.jsp">Products</a></li>
            <li><a href="AddProduct.jsp">Add Products</a></li>
            <li><a href="DisplayOrder.jsp">Orders</a></li>
            <li><a href="Logout.jsp">Logout</a></li>
        </ul>
    </nav>
</body>
</html>
