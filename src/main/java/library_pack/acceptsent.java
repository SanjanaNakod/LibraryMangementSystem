package library_pack;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletRequest;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/acceptsent")
public class acceptsent extends HttpServlet{
	public void doGet(HttpServletRequest req,HttpServletResponse res) {
		try {
		    Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/librarymanage", "root", "root123");
            
            String date=req.getParameter("date");
            System.out.println("date"+date);
            String bname=req.getParameter("bname");
            System.out.println("bname"+bname);
            PreparedStatement st=con.prepareStatement("insert into booksentdate (Date, bookname) values(?,?)");
            st.setString(1, date);
            st.setString(2, bname);
            int x = st.executeUpdate();

	            if (x > 0) {
	                System.out.println("sent Successfully");
	            } else {
	                System.out.println("Failed to accept ");
	            }

	    } catch (Exception e) {
            e.printStackTrace();
        }
	}

}
