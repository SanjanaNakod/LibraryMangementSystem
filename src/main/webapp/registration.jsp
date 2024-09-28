<%@page import="library_pack.Userlist"%>
<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
       
<link rel="stylesheet" href="<%= application.getContextPath() %>/css/style.css">
<title>Create New Account</title>

</head>
<body>
<jsp:include page="nav.jsp"/>

     
  <div class="mbo-3"><div  class=" p-2 text-dark fs-3" onclick="history.back();"><i class="bi bi-arrow-left"></i>
</div></div>
 
<div class="center">
    <h2 class=" text-center ">Create New Account</h2>
    <form action="<%=application.getContextPath()%>/senddata" method="get">
   
    <div class="mbo-3">
        <label for="firstName">First Name</label>
        <input type="text" id="firstName" name="firstName" class="form-control" required>
    </div>
    <div class="mbo-3">
        <label for="lastName">Last Name</label>
        <input type="text" id="lastName" name="lastName" class="form-control" required>
    </div>
    <div class="mbo-3">
        <label for="mobileNo">Mobile Number</label>
        <input type="text" id="mobileNo" name="mobileNo" class="form-control" required>
    </div>

    <% 
     Connection conn = null;
     PreparedStatement cityStmt = null;
     PreparedStatement genderStmt = null;
     ResultSet cityRs = null;
     ResultSet genderRs = null;
     
     try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/librarymanage", "root", "root123");

       
        String cityQuery = "SELECT cityId, city FROM cities";
        cityStmt = conn.prepareStatement(cityQuery);
        cityRs = cityStmt.executeQuery();

   
        String genderQuery = "SELECT genderId, gender FROM genders";
        genderStmt = conn.prepareStatement(genderQuery);
        genderRs = genderStmt.executeQuery();
     %>

      
       <div class="mbo-3">
        <label for="city">City</label>
        <select id="city" name="cityId" class="form-select" required>
            <option value="">Select a City</option>
            <% while (cityRs.next()) { %>
                <option value="<%= cityRs.getInt("cityId") %>"><%= cityRs.getString("city") %></option>
            <% } %>
        </select>
       </div>

       
          <div class="mbo-3">
        <label for="gender">Gender</label>
        <select id="gender" name="genderid" class="form-select" required>
            <option value="">Select a Gender</option>
            <option value="1">Male</option>
            <option value="2">Female</option>
            <option value="3">Other</option>
        </select>
    </div>

    <% 
     } catch(Exception ex) {
        ex.printStackTrace();
     }
     %>

    <div class="mbo-3">
        <label for="email">Email</label>
        <input type="email" id="email" name="email" class="form-control" required>
    </div>
    <div class="mbo-3">
        <label for="password">Password</label>
        <input type="password" id="password" name="pwd" class="form-control" required>
    </div>
    <div class="mbo-3">
        <label for="confirm-password">Confirm Password</label>
        <input type="password" id="confirm-password" name="cfmpwd" class="form-control" required>
    </div>
    <div class="mbo-3">
        <button type="submit" class="btn btn-secondary">Register</button>
    </div>
    <div class="mbo-3">
        <span>Already have an account? <a class="text-danger" href="<%= application.getContextPath() %>/login.jsp">Login</a></span>       
    </div>
</form>

</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

