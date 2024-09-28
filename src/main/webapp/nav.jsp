<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<meta charset="UTF-8"> <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Bootstrap Icons -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
       
    <link rel="stylesheet" href="styles1.css">
<link rel="stylesheet" href="<%= application.getContextPath() %>/css/style2.css">



     
          
          
          
<nav class="navbar navbar-expand-lg navbar-light bg-light">

    <div class="container">
        <a class="navbar-brand" href="<%= application.getContextPath() %>/Book.jsp"><i class="bi bi-book"></i> LIBRARY MANAGEMENT</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ">
                <li class="nav-item"><a class="nav-link"  href="<%= application.getContextPath() %>/Book.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="<%= application.getContextPath() %>/about.jsp">About</a></li>
                  <li class="nav-item"><a class="nav-link" href="<%= application.getContextPath() %>/Contact.jsp">Contacts</a></li>
            </ul>
        </div>
 <a href="<%= application.getContextPath() %>/cart.jsp" class="btn btn-outline-secondary mx-2"><i class="bi bi-cart"></i></a>
          <%
            String email = (String) session.getAttribute("email");
            String role = (String) session.getAttribute("role");
        %>
      
        <div class="d-flex align-items-center">
            <% if (email != null) { 
                
                String firstLetter = email.substring(0, 1).toUpperCase();
            %>
                <div class="dropdown">
                  
                    <a href="#" class="btn btn-outline-secondary dropdown-toggle" id="userDropdown" role="button"
                       data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="bi bi-person"></i> <%= firstLetter %>
                    </a>

                 
                    <ul class="dropdown-menu" aria-labelledby="userDropdown">
                        <% if ("admin".equals(role)) { %>
                            <li><a class="dropdown-item" href="adminDashboard.jsp">Dashboard</a></li>
                        <% } else { %>
                            <li><a class="dropdown-item" href="<%=application.getContextPath() %>/book_list.jsp">View Books</a></li>
                             <li><a class="dropdown-item" href="<%=application.getContextPath() %>/Return.jsp">Return Books</a></li>
                      
                        <% } %>
                        <li><a class="dropdown-item" href="logout.jsp">Logout</a></li>
                    </ul>
                </div>
            <% } else { %>
                
                <a href="<%= application.getContextPath() %>/registration.jsp" class="btn btn-outline-secondary mx-2">Register</a>
                <a href="<%= application.getContextPath() %>/login.jsp" class="btn btn-outline-secondary mx-2">Login</a>
            <% } %>
        </div>
    </div>
</nav>

