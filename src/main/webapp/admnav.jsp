<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
   
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
       
<nav class="navbar navbar-expand-lg navbar-light bg-light">


    <div class="container">
        <a class="navbar-brand" href="<%= application.getContextPath() %>/adminDashboard.jsp"><i class="bi bi-book"></i> Admin Dashboard</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ">
                <li class="nav-item"> <a href="<%= application.getContextPath() %>/adminDashboard.jsp" class="nav-link">Add New Book</a>
    </li>
                <li class="nav-item"> <a href="<%= application.getContextPath() %>/editBook.jsp" class="nav-link">Edit Books</a>
    </li>   
                <li class="nav-item"> <a href="<%= application.getContextPath() %>/Showreq.jsp" class="nav-link">Show Requests</a></li>
                 <li class="nav-item"><a class="nav-link" href="#">Contacts</a></li>
            </ul>
        </div>

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
   
   
   