<%@page import="java.util.Date"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <jsp:include page="nav.jsp"/>
 <div class="container mx-5">
 <form action="<%=application.getContextPath() %>/sendreqadmin" method="get">
 
    <h2 class=" text-center">Send Request</h2>
         <% 
     Connection conn = null;
     PreparedStatement bookStmt = null;
     PreparedStatement genderStmt = null;
     ResultSet booksRs = null;
     ResultSet brs = null;
     ResultSet rs = null;
     
     try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/librarymanage", "root", "root123");

       
      
        String id = (String) session.getAttribute("id");
        System.out.println(id);
        String bookQuery = "SELECT * FROM books where book_id=?";
        bookStmt = conn.prepareStatement(bookQuery);
        bookStmt.setString(1,id);
        booksRs = bookStmt.executeQuery();
        String email = (String) session.getAttribute("email");
        System.out.println("email="+email);
        String emailquery="select concat(fname,' ',lname) as username,librarian_id from librarian where email=?";
        PreparedStatement emailStmt = conn.prepareStatement(emailquery);
        emailStmt.setString(1,email);
        ResultSet emailRs = emailStmt.executeQuery();
        
        
     %>
      <div class="my-3">
        <% while (emailRs.next()) { %>
        <input type="text" id="id" name="id" class="form-control" hidden value="<%= emailRs.getString("librarian_id") %>" required>
             
    </div>
    <div class="my-3">
        <label for="fullName">Full Name</label>
           
        <input type="text" id="fullName" name="fullName" class="form-control"  value="<%= emailRs.getString("username") %>" required>
               <% } %>
    </div>

      <div class="my-3">
       
             <label for="Books">Book Name</label>
   
            <% while (booksRs.next()) { %>
        <input type="text" id="Books" name="Books" class="form-control"  value="<%= booksRs.getString("book_name") %>" required>
                  <% } %>
      </div>
       
      <%   
    
      %>
       <div class="my-3">
        <label for="Quantity">Book Quantity</label>
        <input type="text" id="Quantity" name="Quantity" class="form-control"  value="1" required>
    </div>
           
     <% 
     } catch(Exception ex) {
        ex.printStackTrace();
     }
     %>
       <div class="my-3">
        <label for="date">Select Date</label>
        <input type="date" id="myDate" value="<%new Date().toString(); %>" class="form-control" name="date">
    </div>  
    <div class="mbo-3">
        <button type="submit" class="btn btn-secondary my-3">Send</button>
    </div>   
 </form>
 </div>
</body>
</html>