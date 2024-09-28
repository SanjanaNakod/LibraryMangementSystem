<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>About Us - Library Management System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background-color: white;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            color: #2c3e50;
        }
        p {
            font-size: 18px;
            line-height: 1.6;
        }
        ul {
            list-style-type: none;
            padding: 0;
        }
        ul li {
            margin: 5px 0;
        }
    </style>
</head>
<body>
<jsp:include page="nav.jsp"/>


   <div class="container">
        <h1>About Us</h1>
        <p>Welcome to the <strong>Library Management System</strong>! Our platform is designed to simplify and enhance the experience of managing libraries, from large institutions to small personal collections. We provide a comprehensive system for both librarians and library patrons to manage, organize, and access books and resources easily.</p>

        <h2>Our Mission</h2>
        <p>We aim to empower libraries by streamlining day-to-day operations, improving resource accessibility, and building a stronger reading community.</p>

        <h2>Key Features</h2>
        <ul>
            <li><strong>Book Cataloging:</strong> Add, update, and organize books with ease.</li>
            <li><strong>User Management:</strong> Track members, borrowing history, and due books.</li>
            <li><strong>Search & Reserve:</strong> Search for books and make reservations online.</li>
            <li><strong>Analytics & Reports:</strong> Generate insightful reports on inventory and user activity.</li>
            <li><strong>Notifications:</strong> Receive alerts on due dates, new arrivals, and library events.</li>
        </ul>

        <h2>Why Choose Us?</h2>
        <p>We offer a user-friendly, reliable, and customizable solution that fits libraries of any size.</p>

        <ul>
            <li><strong>Easy to Use:</strong> Simple and intuitive interface for everyone.</li>
            <li><strong>Secure:</strong> We protect your data with reliable and secure technologies.</li>
            <li><strong>Adaptable:</strong> Customize features to suit your specific library needs.</li>
        </ul>

        <p>Join us in revolutionizing the library experience and making reading accessible to all!</p>
    </div>
</body>
</html>