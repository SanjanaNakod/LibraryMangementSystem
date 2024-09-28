<%@page import="java.sql.*, java.util.Date, java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
 <form action="accept.jsp" method="get">
<div class="container">
<h2>Accept Request</h2>
 <div class="my-3">
 <% String bname = (String) session.getAttribute("bname"); %>
        <label for="date">Sent to customer </label>
        <input type="date" id="myDate" value="<%new Date().toString(); %>" class="form-control" name="date">
        <input hidden value="<%=bname %>" name="bname">
    </div>  
     <div class="mb-3">
            <label for="action" class="form-label">Action</label>
            <select class="form-select" id="action" name="action" required>
                <option value="issue">Issue</option>
            </select>
        </div>
    <div class="mbo-3">
        <button type="submit" class="btn btn-secondary my-3">Send</button>
    </div></div> </form>
   <%
               String userId = (String) session.getAttribute("userId");
            	String bookId = (String) session.getAttribute("bookId");
            	String action = request.getParameter("action");
            	String date = request.getParameter("date");
            	
        		  Connection conn = null;
                  PreparedStatement ps = null;
                  ResultSet rs = null;
                  
              
                      if (userId != null && bookId != null && action != null) {
                    
                          try {
                              Class.forName("com.mysql.cj.jdbc.Driver");
                              conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/librarymanage", "root", "root123");

                            
                              if ("issue".equals(action)) {
                                  String issueQuery = "INSERT INTO issued_books (user_id, book_id, issue_date) VALUES (?, ?, ?)";
                                  ps = conn.prepareStatement(issueQuery);
                                  ps.setInt(1, Integer.parseInt(userId));
                                  ps.setInt(2, Integer.parseInt(bookId));
                                  ps.setString(3,date);
                                  ps.executeUpdate();
                                  out.println("<div class='alert alert-success'>Book issued successfully.</div>");
                              }
                                  else {
                                      out.println("<div class='alert alert-danger'>No record found for this book issue.</div>");
                                  }
                              }
                           catch (Exception e) {
                              e.printStackTrace();
                          } 
                      }
        		 %>
</body>
</html>