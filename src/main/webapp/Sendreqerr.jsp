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
<div class="container">
<div class="mx-auto">
<h2>The Books Quantity not avialable</h2>
<h4>Please select available Quantity Books</h4>
     <div class="mb-3">

            <a href="<%=application.getContextPath() %>/book_list.jsp" class="btn btn-secondary">Go Back</a>
        </div>

</div>
</div>

</body>
</html>