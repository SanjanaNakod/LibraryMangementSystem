<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    
<title>Insert title here</title>
</head>
<body>

 
 <jsp:include page="custnav.jsp"/>  
<div class="container m-5">
    <h2 class="text-center mb-4">Books Collection</h2>
    <div class="row">
        <% 
           
            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;

            try {
                
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/librarymanage", "root", "root123");

               
                String sql = "SELECT books.book_id, books.book_name, books.price, books.edition,books.quantity, books.book_desc, authors.author_name, categories.category_name " +
                             "FROM books " +
                             "JOIN authors ON books.author_id = authors.author_id " +
                             "JOIN categories ON books.category_id = categories.category_id";

                stmt = conn.prepareStatement(sql);
                rs = stmt.executeQuery();

                while (rs.next()) {
                	   String bookid = rs.getString("book_id");
                    String bookName = rs.getString("book_name");
                    String authorName = rs.getString("author_name");
                    String categoryName = rs.getString("category_name");
                    double price = rs.getDouble("price");
                    String bookDesc = rs.getString("book_desc");
                    String edition = rs.getString("edition");
                    String qty = rs.getString("quantity");
        %>
       <div class="col-md-4 mb-4">
                <div class="card h-100">
                    <img src="img/art-museum-books-sticker.jpg" class="card-img-top" alt="<%= bookName %>">
                    <div class="card-body">
                        <h5 class="card-title"><%= bookName %></h5>
                        <h6 class="text-muted">by <%= authorName %></h6>
                        <p class="card-text"><strong>Category:</strong> <%= categoryName %></p>
                        <p class="card-text"><strong>Price:</strong> ₹<%= price %></p>
                        <p class="card-text"><strong>Quantity:</strong> <%= qty %></p>
                        <p class="card-text"><strong>Edition:</strong> <%= edition != null ? edition : "N/A" %></p>
                        <p class="card-text"><%= bookDesc.length() > 100 ? bookDesc.substring(0, 100) + "..." : bookDesc %></p>
                        <form action="<%=application.getContextPath()%>/sendreqdata" method="get">
                            <div class="my-3">
                              
                                <input type="text" name="bookid" readonly class="form-control"  hidden value="<%= bookid %>" required>
                                <input type="hidden" name="bookname" readonly class="form-control" value="<%= bookName %>" required>
                            </div>
                            <div class="mb-3">
                                <button type="submit" class="btn btn-secondary">Send Request</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
           
        <% 
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
           
        %>
    </div>
</div>


</body>
</html>