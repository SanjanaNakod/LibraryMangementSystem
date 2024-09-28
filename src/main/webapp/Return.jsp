<%@page import="java.sql.*, java.util.Date, java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Issue or Return Book</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
 <jsp:include page="custnav.jsp"/>
<div class="container mt-5">
    <h2> Return a Book</h2>

    <form action="Return.jsp" method="get">
        <div class="mb-3">
            <label for="user_id" class="form-label">Select User</label>
            <select class="form-select" id="user_id" name="user_id" required>
                <option value="">Choose a user</option>
                <% 
                   
                    Connection conn = null;
                    PreparedStatement ps = null;
                    ResultSet rs = null;
                    
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/librarymanage", "root", "root123");

                        String email = (String) session.getAttribute("email");
                        String emailquery="select concat(fname,' ',lname) as username,librarian_id from librarian where email=?";
                        PreparedStatement emailStmt = conn.prepareStatement(emailquery);
                        emailStmt.setString(1,email);
                        ResultSet emailRs = emailStmt.executeQuery();
                        
                        if(emailRs.next()){  
                        	 String uname=emailRs.getString("username");
                   
                        String query = "SELECT id, username,bookname FROM users where username=?";
                        ps = conn.prepareStatement(query);
                        ps.setString(1, uname);
                        rs = ps.executeQuery();
                     
                        while (rs.next()) {
                        	 HttpSession session1 = request.getSession();
                             session.setAttribute("bname", rs.getString("bookname"));
                %>
                            <option value="<%= rs.getInt("id") %>"><%= rs.getString("username") %></option>
                             
                <% 
                        }     }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } 
                %>
            </select>
        </div>

        <div class="mb-3">
       
            <label for="book_id" class="form-label">Select Book</label>
            <select class="form-select" id="book_id" name="book_id" required>
                <option value="">Choose a book</option>
                <% 
                    
                    try {
                    	String bname=(String) session.getAttribute("bname");
                    	
                        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/librarymanage", "root", "root123");
                        String userId = request.getParameter("user_id");
                        String bookQuery = "SELECT book_id, book_name FROM books where book_name=?";
                        ps = conn.prepareStatement(bookQuery);
                        ps.setString(1, bname);
                        rs = ps.executeQuery();
                       
                        while (rs.next()) {
                %>
                            <option value="<%= rs.getInt("book_id") %>"><%= rs.getString("book_name") %></option>
                <% 
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } 
                %>
            </select>
        </div>

        <div class="mb-3">
            <label for="action" class="form-label">Action</label>
            <select class="form-select" id="action" name="action" required>
                               <option value="return">Return</option>
            </select>
        </div>

      <button type="submit" class="btn btn-primary">Submit</button>
    </form>
</div>

<% 
    String userId = request.getParameter("user_id");
            		 System.out.println(userId);
    String bookId = request.getParameter("book_id");
	 System.out.println(bookId);
    String action = request.getParameter("action");

    if (userId != null && bookId != null && action != null) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/librarymanage", "root", "root123");

          if ("return".equals(action)) {
        	 
                String returnQuery = "SELECT ib.issue_date, DATEDIFF(CURDATE(), ib.issue_date) AS days_borrowed, b.price FROM issued_books ib JOIN books b ON ib.book_id = b.book_id WHERE ib.user_id = ? AND ib.book_id = ? AND return_date IS NULL ";
                ps = conn.prepareStatement(returnQuery);
                ps.setInt(1, Integer.parseInt(userId));
                ps.setInt(2, Integer.parseInt(bookId));
                rs = ps.executeQuery();

                if (rs.next()) {
                    int daysBorrowed = rs.getInt("days_borrowed");
                    System.out.println(daysBorrowed);
                    double bookPrice = rs.getDouble("price");
                    double fine = 0.0;

                    if (daysBorrowed > 15) {
                        fine = bookPrice * 0.40;  
                    }
                    HttpSession session1 = request.getSession();
                    session.setAttribute("fine", fine);
                   System.out.println(fine);
                    String updateQuery = "UPDATE issued_books SET return_date = CURDATE()  WHERE user_id = ? AND book_id = ?";
                    ps = conn.prepareStatement(updateQuery);
                   
                    ps.setInt(1, Integer.parseInt(userId));
                    ps.setInt(2, Integer.parseInt(bookId));
                    ps.executeUpdate();

                    out.println("<div class='alert alert-success'>Book returned successfully. Days borrowed: " + daysBorrowed + ". Fine: " + fine + "</div>");
    		     
                } else {
                    out.println("<div class='alert alert-danger'>No record found for this book issue.</div>");
                }
                     response.sendRedirect(request.getContextPath() + "/fine.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } 
    }
%>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
