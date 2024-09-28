<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="custnav.jsp"></jsp:include>
<% Double fine = (Double) session.getAttribute("fine");%>
<div class="container mb-3">
 <h2>Return details</h2>
    <table border="1" width="100%" class="table table-bordered table-success mt-3">
        <thead>
            <tr>
                <th>Name</th>
                <th>Book Name</th>
                <th>issue_date</th>
                 <th>return_date</th> 
                  <th>Fine</th>  
                  
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
            
              String sql = "SELECT u.username, b.book_name, ib.issue_date, ib.return_date FROM issued_books ib  join users u on u.id=ib.user_id"+
              " join books b on b.book_id=ib.book_id where username=? " ;
              
              stmt = conn.prepareStatement(sql);
              stmt.setString(1, uname);
              rs = stmt.executeQuery();

              while (rs.next()) {
                  String username = rs.getString("u.username");
              	   String bookname= rs.getString("b.book_name");
                  String issue_date = rs.getString("ib.issue_date");
                  String return_date = rs.getString("ib.return_date"); 
                                  
         %>
          <tr>
          <td><%= username%></td>
            <td><%= bookname %></td>
             <td><%= issue_date %></td>
            <td><%= return_date %></td>
           <td><%= fine %></td>
        
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