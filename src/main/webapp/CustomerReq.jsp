<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Bootstrap Icons -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
       
<title>Insert title here</title>
</head>
<body>
 <jsp:include page="custnav.jsp"/>
<div class="container mt-5">

 <div class="mbo-3"><div  class=" p-2 text-dark fs-3" onclick="history.back();"><i class="bi bi-arrow-left"></i>
</div>
</div>
    <h2>My Books</h2>
    <table border="1" width="100%" class="table table-bordered table-success mt-3">
        <thead>
            <tr>
              
                <th>User Name</th>
                <th>Book Name</th>
                 <th>Quantity</th> 
                  <th>Accepted date</th>  
                  <th>Return</th>
                  
            </tr>
        </thead>
        <tbody>
            <% 
         Connection conn = null;
         PreparedStatement stmt = null;
         ResultSet rs = null;
         
         try
         {
        
        	  Class.forName("com.mysql.cj.jdbc.Driver");
              conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/librarymanage", "root", "root123");

              String email = (String) session.getAttribute("email");
              String emailquery="select concat(fname,' ',lname) as username,librarian_id from librarian where email=?";
              PreparedStatement emailStmt = conn.prepareStatement(emailquery);
              emailStmt.setString(1,email);
              ResultSet emailRs = emailStmt.executeQuery();
              
              if(emailRs.next()){
            	  String uname=emailRs.getString("username");
            
              String sql = "SELECT  u.username, u.bookname, u.quantity, b.issue_date FROM issued_books b  join users u on b.user_id =u.id where u.username=? " ;
              
              stmt = conn.prepareStatement(sql);
              stmt.setString(1, uname);
              rs = stmt.executeQuery();

              while (rs.next()) {
              	 
                  String username = rs.getString("u.username");
                  String bookname = rs.getString("u.bookname");
                  String quantity = rs.getString("u.quantity");                 
                  String date = rs.getString("b.issue_date");
                 
         %>
               
         <tr>
         
            <td><%= username %></td>
             <td><%= bookname %></td>
            <td><%= quantity %></td>
           <td><%= date %></td>
            <td>  <form action="Return.jsp" method="post">
                   <button type="submit" class="btn btn-secondary" onclick="validateForm()" >Return</button>
                  
                 </form> </td>
         </tr>
         
         <%  } 
         }else System.out.println("username not found");
         
     }
     catch(Exception ex)
     {
    	 
     }
     %>

</tbody>
</table> 
</div>

</body>
</html>