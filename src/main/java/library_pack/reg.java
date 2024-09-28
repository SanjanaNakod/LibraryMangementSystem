package library_pack;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/senddata")
public class reg extends HttpServlet{
	
	public void doGet(HttpServletRequest req,HttpServletResponse res) {
		 try {
		        Class.forName("com.mysql.cj.jdbc.Driver");
		        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/librarymanage", "root", "root123");

		        
		        String fname = req.getParameter("firstName");
		        String lname = req.getParameter("lastName");
		        String mbno = req.getParameter("mobileNo");
		        String cityid = req.getParameter("cityId");
		        String genderid = req.getParameter("genderId");
		        String email = req.getParameter("email");
		        String pswd = req.getParameter("pwd");
		        String cfmpwd = req.getParameter("cfmpwd");

		        // Debugging output to check for null values
//		        System.out.println("Username: " + username);
//		        System.out.println("Email: " + email);
//		        System.out.println("Password: " + pswd);
//		        System.out.println("Confirm Password: " + cfmpwd);
		        


	        
	            String query = "SELECT email FROM librarian WHERE email = ?";
	            PreparedStatement checkEmail = con.prepareStatement(query);
	            checkEmail.setString(1, email);
	            ResultSet rs = checkEmail.executeQuery();

	      
	            if (rs.next()) {
	                System.out.println(" This email is already registered!");
	            } else {
	            	  if (pswd != null && cfmpwd != null && pswd.equals(cfmpwd)) {
	      	            PreparedStatement st = con.prepareStatement("insert into librarian( fname, lname, mobileno, cityid, genderid, email, password) values(?, ?, ?,?,?,?,?)");
	      	            st.setString(1, fname);
	      	            st.setString(2, lname);
	      	            st.setString(3, mbno);
	      	            st.setString(4, cityid);
	      	            st.setString(5, genderid);
	      	            st.setString(6, email);
	      	            st.setString(7, pswd);

	      	            int x = st.executeUpdate();

	      	            if (x > 0) {
	      	                System.out.println("Registered Successfully");
	      	            } else {
	      	                System.out.println("Sorry, Data could not be inserted");
	      	            }

	      	            st.close();
	      	        } else {
	      	            if (pswd == null || cfmpwd == null) {
	      	                System.out.println("Password or Confirm Password is null");
	      	            } else {
	      	                System.out.println("Passwords do not match");
	      	            }
	      	        }
	            }

	          
	            rs.close();
	            checkEmail.close();
	            con.close();

		    } catch (Exception e) {
		        System.out.println(e);
		    }
	}

}

