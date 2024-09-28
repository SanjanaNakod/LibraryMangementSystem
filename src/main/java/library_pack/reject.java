package library_pack;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/reject")
public class reject extends HttpServlet
{
	public void doGet(HttpServletRequest req,HttpServletResponse res) {
		 try {
	           
	            Class.forName("com.mysql.cj.jdbc.Driver");
	            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/librarymanage", "root", "root123");
	            
	            
	            PreparedStatement st = con.prepareStatement("select * from  users");
	            ResultSet rs = st.executeQuery();

	            String id=req.getParameter("id");

	            if (rs.next()) {

            	 String bname = rs.getString("bookname");
	            PreparedStatement deleteSt = con.prepareStatement(
                        "delete from users where id=? and  bookname=?");
             	   deleteSt.setString(1, id);
             	   deleteSt.setString(2, bname);
             	   deleteSt.executeUpdate();
                    ResultSet rs3 = deleteSt.executeQuery();

                    if (rs3.next()) {
                        res.sendRedirect(req.getContextPath() + "/Showreq.jsp");
                                 } else System.out.println("failed") ;  
                    
	            } else {
	                System.out.println("Sorry, Data could not be inserted");
	            }
		 } catch (Exception e) {
	            e.printStackTrace();
	        }
	}
}
