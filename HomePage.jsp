<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.entity.Customer" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.helper.DBHelper" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
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
            background-color: #ffffff;
            color: #333;
        }
        nav {
            background-color: #007bff;
            color: #fff;
            padding: 15px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        nav .logo {
            font-size: 24px;
            font-weight: 600;
        }
        nav ul {
            list-style: none;
            display: flex;
            gap: 20px;
        }
        nav ul li a {
            color: #fff;
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s ease;
        }
        nav ul li a:hover {
            color: #0056b3;
        }
        header {
            text-align: center;
            margin: 20px 0;
            font-size: 28px;
            font-weight: 500;
        }
        .product-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
            padding: 20px;
        }
        .product-card {
            background-color: #f0f8ff;
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 15px;
            text-align: center;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .product-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }
        .product-card img {
            width: 100%;
            max-height: 200px;
            object-fit: cover;
            margin-bottom: 15px;
        }
        .product-card h3 {
            font-size: 20px;
            margin: 10px 0;
        }
        .quantity-controls {
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 10px 0;
        }
        .quantity-controls button {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 15px;
            font-size: 14px;
            cursor: pointer;
        }
        .quantity-controls button:hover {
            background-color: #0056b3;
        }
        .confirm-button {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 15px;
            font-size: 16px;
            cursor: pointer;
            text-align: center;
        }
        .confirm-button:hover {
            background-color: #0056b3;
        }
        .my-container {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

    </style>
</head>
<body>
<%
    if (session.getAttribute("customer") != null) {
        Customer customer = (Customer) session.getAttribute("customer");
        
%>
    <jsp:include page="./commons/publicNavBar.jsp" />
    <header>Welcome, <%= customer.getName() %> to Online Grocery Store</header>

    <section class="product-grid">
        <%
    String sql = "SELECT p.productId, p.productName, p.productDescription, p.productPrice, p.imgUrl, " +
                 "COALESCE(c.no_of_items, 0) AS cartQuantity " +
                 "FROM PRODUCTS p " +
                 "LEFT JOIN CartTable c ON p.productId = c.ProductID AND c.Email = ?";
    String customerEmail = customer.getEmail();
    try (PreparedStatement pstmt = DBHelper.getPreparedStatement(sql)) {
        pstmt.setString(1, customerEmail);
        ResultSet rs = pstmt.executeQuery();
        while (rs.next()) {
            int productId = rs.getInt("productId");
            String productName = rs.getString("productName");
            String productDescription = rs.getString("productDescription");
            double productPrice = rs.getDouble("productPrice");
            String imgUrl = rs.getString("imgUrl");
            int cartQuantity = rs.getInt("cartQuantity");
%>
<div class="product-card">
    <!-- Product Image -->
    <img src="<%= imgUrl != null ? imgUrl : "images/default-product.jpg" %>" alt="<%= productName %>">

    <!-- Product Name -->
    <h3><%= productName %></h3>

    <!-- Product Description -->
    <p><%= productDescription %></p>

    <!-- Product Price -->
    <p>Rs. <%= productPrice %> / kg</p>

    <!-- Quantity Controls -->
    <div class="quantity-controls">
        <!-- Decrement Button -->
        <form action="removeToCartAction" method="post" style="display: inline;">
            <input type="hidden" name="id" value="<%= productId %>">
            <button type="submit">-</button>
        </form>

        <!-- Quantity Display -->
        <input type="text" name="quantity" value="<%= cartQuantity > 0 ? cartQuantity : 0 %>" readonly style="width: 30px; text-align: center;">

        <!-- Increment Button -->
        <form action="AddToCart" method="post" style="display: inline;">
            <input type="hidden" name="id" value="<%= productId %>">
            <button type="submit">+</button>
        </form>
    </div>
</div>

<%
        }
    } catch (SQLException e) {
        out.println("Error: " + e.getMessage());
    }
%>
    </section>
    <div class="my-container">
        <form action="Cart.jsp" method="post">
            <button type="submit" class="my-button">Confirm Wishlist</button>
        </form>
    </div>

<%
    } else {
        response.sendRedirect("LoginPage.jsp");
    }
%>
<script>
    function incrementQuantity(button) {
        const input = button.previousElementSibling;
        input.value = parseInt(input.value) + 1;
    }

    function decrementQuantity(button) {
        const input = button.nextElementSibling;
        if (parseInt(input.value) > 1) {
            input.value = parseInt(input.value) - 1;
        }
    }
</script>
</body>
</html>