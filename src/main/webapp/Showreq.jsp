<%@page import="java.sql.*"%>
<%@page import="java.util.Date"%>
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
 <jsp:include page="nav.jsp"/>
<div class="container mt-5">

 <div class="mbo-3"><div  class=" p-2 text-dark fs-3" onclick="history.back();"><i class="bi bi-arrow-left"></i>
</div></div>
    <h2>Customer Requests</h2>
    <table border="1" width="100%" class="table table-bordered table-success mt-3">
        <thead>
            <tr>
                <th>Customer id</th>
                <th>User Name</th>
                <th>Book Name</th>
                 <th>Quantity</th> 
                  <th>Date</th>  
                  <th>Accept</th>   
                   <th>Reject</th>   
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

             
              String sql = "SELECT id, username, bookname, quantity, date FROM users " ;

              stmt = conn.prepareStatement(sql);
              rs = stmt.executeQuery();

              while (rs.next()) {
              	   String id = rs.getString("id");
                  String username = rs.getString("username");
                  String bookname = rs.getString("bookname");
                  String quantity = rs.getString("quantity");                 
                  String date = rs.getString("date");
         %>
               
         <tr>
          <td> <%= id %></td>
            <td><%= username %></td>
             <td><%= bookname %></td>
            <td><%= quantity %></td>
           <td><%= date %></td>
           
                <td>  <form action="<%=application.getContextPath() %>/accreq" method="get">
                   <button type="submit" class="btn btn-secondary" >Accept</button>
                     <input hidden name="id" value="<%=id %>">
                 </form> </td>
         
          <td> <form action="<%=application.getContextPath() %>/reject" method="get">
          <button type="submit" class="btn btn-secondary " >Reject</button>
          <input hidden name="id" value="<%=id %>">
       
         
         </form></td>
         </tr>
         
         <%
         }
         
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