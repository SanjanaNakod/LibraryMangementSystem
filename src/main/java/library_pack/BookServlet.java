package library_pack;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class BookServlet {
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws Exception {
	HttpSession session = request.getSession(false);
	String role = (String) session.getAttribute("role");

	if (role != null && role.equals("ADMIN")) {
	    
	} else {
	   
	    response.sendRedirect("unauthorized.jsp");
	}
	}
}
