<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Online Grocery Store</title>
    <style>
        @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap");
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: "Poppins", sans-serif;
        }
        body {
            background-color: #f4f4f9; /* Light background for contrast */
            color: #333;
        }
        nav {
            background-color: #007bff; /* Primary blue color */
            color: #fff;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        nav .logo {
            font-size: 1.8rem;
            font-weight: bold;
        }
        nav .logo a {
            text-decoration: none;
            color: #fff;
            transition: color 0.3s ease;
        }
        nav .logo a:hover {
            color: #cce5ff; /* Light blue hover effect */
        }
        nav ul {
            list-style: none;
            display: flex;
            gap: 20px;
        }
        nav ul li a {
            text-decoration: none;
            color: #fff;
            font-weight: 500;
            padding: 10px 15px;
            border-radius: 5px;
            transition: background-color 0.3s ease, color 0.3s ease;
        }
        nav ul li a:hover {
            background-color: #0056b3; /* Darker blue for hover */
            color: #cce5ff; /* Lighter text color */
        }
        header {
            text-align: center;
            margin: 20px 0;
            font-size: 28px;
            font-weight: 500;
            color: #333;
        }
        /* Responsive Design */
        @media (max-width: 768px) {
            nav {
                flex-direction: column;
                align-items: flex-start;
            }
            nav ul {
                flex-direction: column;
                width: 100%;
                gap: 10px;
            }
            nav ul li {
                width: 100%;
            }
            nav ul li a {
                display: block;
                width: 100%;
            }
        }
    </style>
</head>
<body>
<nav>
    <div class="logo">
        <a href="HomePage.jsp">Online Grocery Store</a>
    </div>
    <ul>
        <li><a href="HomePage.jsp">Home</a></li>
        <li><a href="MyProfile.jsp">My Profile</a></li>
        <li><a href="Cart.jsp">Cart</a></li>
        <li><a href="Logout.jsp">Logout</a></li>
    </ul>
</nav>
</body>
</html>
