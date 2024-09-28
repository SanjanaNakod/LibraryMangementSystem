<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
       
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
      
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
       
<title>Insert title here</title>

<link rel="stylesheet" href="<%= application.getContextPath() %>/css/style.css">
</head>
<body>
<jsp:include page="nav.jsp"/>
 <div class="mbo-3"><div  class=" p-2 text-dark fs-3" onclick="history.back();"><i class="bi bi-arrow-left"></i>
</div></div>
<div class="center">
<h2 class=" text-center ">Login</h2>
<form  action="<%=application.getContextPath()%>/sendlogindata" method="get">
      <div class="mbo-3">
        <label for="email">Email</label>
        <input type="email" id="email" name="email" required>
    </div>
    <div class="mbo-3">
        <label for="password">Password</label>
        <input type="password" id="password" name="pwd" required>
    </div>
         <div class="mb-3">
            <label for="role">Login as:</label>
            <select id="role" name="role" class="form-select" required>
                <option value="user">User</option>
                <option value="admin">Admin</option>
            </select>
        </div>
        <div class="mb-3">
            <button type="submit" class="btn btn-secondary">Login</button>
        </div>
     <div class="mbo-3">
         <span>Don't have account  <a class="text-danger"  href="<%= application.getContextPath() %>/registration.jsp" target="_blank">Register</a>   </span>       
   
    </div>
</form>
</div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
   
</body>
</html>