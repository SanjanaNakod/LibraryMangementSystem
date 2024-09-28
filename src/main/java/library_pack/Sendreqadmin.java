package library_pack;

import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/sendreqadmin")
public class Sendreqadmin extends HttpServlet{
	public void doGet(HttpServletRequest req,HttpServletResponse res) {
		 try {
	           
	            Class.forName("com.mysql.cj.jdbc.Driver");
	            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/librarymanage", "root", "root123");
	            
	            String id = req.getParameter("id");
	            String fname = req.getParameter("fullName");
		        String bname = req.getParameter("Books");
		        String qty = req.getParameter("Quantity");
		        String date = req.getParameter("date");
		        
                HttpSession session = req.getSession();
                session.setAttribute("date", date);
		        PreparedStatement q=con.prepareStatement("select * from users where bookname=? and username=? and (select count(id)  from users where username=?)>2 ");
		        q.setString(1, bname);
		        q.setString(2, fname);		     
		        q.setString(3, fname);	
		        ResultSet rs=q.executeQuery();
		        if(rs.next()) {
		            res.sendRedirect(req.getContextPath() + "/userbookqty.jsp");

		        }else {
		       	 PreparedStatement st = con.prepareStatement("insert into users(id, username, bookname, quantity, date) values(?,?, ?, ?,?)");
	  	            st.setString(1, id);
	  	            st.setString(2, fname);
	  	            st.setString(3, bname);
	  	          st.setString(4, qty);
	  	        st.setString(5, date);
	  	            int x = st.executeUpdate();

	  	            if (x > 0) {
	  	                System.out.println("Request Send Successfully");
	  	              res.sendRedirect(req.getContextPath() + "/book_list.jsp");
	  	             
	  	            } else {
	  	                System.out.println("Sorry, Data could not be inserted");
	  	            }
		        }
		        
		        
	           
	            
	            
		 } catch (Exception e) {
	            e.printStackTrace();
	        }
		
	}

}
