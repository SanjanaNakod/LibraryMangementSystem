
package library_pack;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/sendlogindata")
public class login extends HttpServlet {

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        res.setContentType("text/html"); 
        
        try {
           
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/librarymanage", "root", "root123");

           
            String email = req.getParameter("email");
            String pswd = req.getParameter("pwd");
            String role = req.getParameter("role");

            System.out.println("Login : email=" + email + ", password=" + pswd + ", role=" + role);

           
            String query;
            if ("admin".equals(role)) {
                query = "SELECT * FROM admin WHERE email = ? AND password = ?";
            } else {
                query = "SELECT * FROM librarian WHERE email = ? AND password = ?";
            }

           
            PreparedStatement login = con.prepareStatement(query);
            login.setString(1, email);
            login.setString(2, pswd);
            ResultSet rs = login.executeQuery();

            if (rs.next()) {
               
                HttpSession session = req.getSession();
                session.setAttribute("email", rs.getString("email"));
                session.setAttribute("role", role);

                
                if ("admin".equals(role)) {
                   
                    res.sendRedirect(req.getContextPath() + "/adminDashboard.jsp");
                } else {
                    
                    res.sendRedirect(req.getContextPath() + "/book_list.jsp");
                }
            } else {
              
                req.setAttribute("errorMessage", "Invalid email or password!");
                req.getRequestDispatcher("login.jsp").forward(req, res);
            }


        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
