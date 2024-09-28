<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Book</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
     <div class="mbo-3"><div  class=" p-2 text-dark fs-3" onclick="history.back();"><i class="bi bi-arrow-left"></i>
</div></div>
        <h2>Edit Book</h2>
        <%
            String bookId = request.getParameter("book_id");
            if (bookId != null && !bookId.isEmpty()) {
                 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/librarymanage", "root", "root123");
                String query = "SELECT * FROM books WHERE book_id = ?";
                PreparedStatement pst = con.prepareStatement(query);
                pst.setInt(1, Integer.parseInt(bookId));
                ResultSet rs = pst.executeQuery();
                if (rs.next()) {
        %>
        <form action="<%= application.getContextPath() %>/editBook" method="post">
            <input type="hidden" name="book_id" value="<%= rs.getInt("book_id") %>">
            <div class="mb-3">
                <label for="book_name" class="form-label">Book Name</label>
                <input type="text" class="form-control" id="book_name" name="book_name" value="<%= rs.getString("book_name") %>" required>
            </div>
            <div class="mb-3">
                <label for="author_id" class="form-label">Author ID</label>
                <input type="number" class="form-control" id="author_id" name="author_id" value="<%= rs.getInt("author_id") %>" required>
            </div>
            <div class="mb-3">
                <label for="price" class="form-label">Price</label>
                <input type="number" class="form-control" id="price" name="price" value="<%= rs.getDouble("price") %>" step="0.01" required>
            </div>
            <div class="mb-3">
                <label for="edition" class="form-label">Edition</label>
                <input type="text" class="form-control" id="edition" name="edition" value="<%= rs.getString("edition") %>">
            </div>
            <div class="mb-3">
                <label for="amount" class="form-label">Amount</label>
                <input type="number" class="form-control" id="amount" name="amount" value="<%= rs.getDouble("amount") %>" step="0.01" required>
            </div>
            <div class="mb-3">
                <label for="category_id" class="form-label">Category ID</label>
                <input type="number" class="form-control" id="category_id" name="category_id" value="<%= rs.getInt("category_id") %>" required>
            </div>
            <div class="mb-3">
                <label for="book_desc" class="form-label">Book Description</label>
                <textarea class="form-control" id="book_desc" name="book_desc" rows="3"><%= rs.getString("book_desc") %></textarea>
            </div>
            <div class="mb-3">
                <label for="quantity" class="form-label">Quantity</label>
                <input type="number" class="form-control" id="quantity" name="quantity" value="<%= rs.getInt("quantity") %>" required>
            </div>
            <button type="submit" class="btn btn-primary">Update Book</button>
        </form>
        <a href="<%= application.getContextPath() %>/adminDashboard.jsp" class="btn btn-secondary mt-3">Back to Dashboard</a>
        <%
                }
                rs.close();
                pst.close();
                con.close();
            }
        %>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
