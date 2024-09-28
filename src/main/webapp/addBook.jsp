<%@page import="java.sql.*"%>
<%@page import="library_pack.Userlist"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add New Book</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
 <div class="mbo-3"><div  class=" p-2 text-dark fs-3" onclick="history.back();"><i class="bi bi-arrow-left"></i>
</div></div>
        <h2>Add New Book</h2>
        
        <form action="<%= application.getContextPath() %>/addBook" method="get">
            <div class="mb-3">
                <label for="book_name" class="form-label">Book Name</label>
                <input type="text" class="form-control" id="book_name" name="book_name" required>
            </div>
             <% 
     Connection conn = null;
     PreparedStatement aStmt = null;
     PreparedStatement categoryStmt = null;
     ResultSet authorRs = null;
     ResultSet categoryRs = null;
     
     try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/librarymanage", "root", "root123");

       
        String authorQuery = "SELECT author_id, author_name FROM authors";
        aStmt = conn.prepareStatement(authorQuery);
        authorRs = aStmt.executeQuery();

   
        String categoryQuery = "SELECT category_id, category_name FROM categories";
        categoryStmt = conn.prepareStatement(categoryQuery);
        categoryRs = categoryStmt.executeQuery();
     %>   
       <div class="mbo-3">
        <label for="city">Author</label>
        <select id="city" name="author_id" class="form-select" required>
            <option value="">Select a Author</option>
            <% while (authorRs.next()) { %>
                <option value="<%= authorRs.getInt("author_id") %>"><%= authorRs.getString("author_name") %></option>
            <% } %>
        </select>
       </div>
      
            <div class="mb-3">
                <label for="price" class="form-label">Price</label>
                <input type="number" class="form-control" id="price" name="price" step="0.01" required>
            </div>
            <div class="mb-3">
                <label for="edition" class="form-label">Edition</label>
                <input type="text" class="form-control" id="edition" name="edition">
            </div>
            <div class="mb-3">
                <label for="amount" class="form-label">Amount</label>
                <input type="number" class="form-control" id="amount" name="amount" step="0.01" required>
            </div>
             <div class="mbo-3">
        <label for="city">Category</label>
        <select id="city" name="category_id" class="form-select" required>
            <option value="">Select a Category</option>
            <% while (categoryRs.next()) { %>
                <option value="<%= categoryRs.getInt("category_id") %>"><%= categoryRs.getString("category_name") %></option>
            <% } %>
        </select>
       </div>
          
             <% 
     } catch(Exception ex) {
        ex.printStackTrace();
     }
     
     %>
            <div class="mb-3">
                <label for="book_desc" class="form-label">Book Description</label>
                <textarea class="form-control" id="book_desc" name="book_desc" rows="3"></textarea>
            </div>
            <div class="mb-3">
                <label for="quantity" class="form-label">Quantity</label>
                <input type="number" class="form-control" id="quantity" name="quantity" required>
            </div>
            <button type="submit" class="btn btn-primary">Add Book</button>
        </form>
        
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
