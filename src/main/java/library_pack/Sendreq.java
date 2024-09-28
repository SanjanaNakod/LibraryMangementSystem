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

@WebServlet("/sendreqdata")

public class Sendreq extends HttpServlet {

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        res.setContentType("text/html"); 
        
        try {
           
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/librarymanage", "root", "root123");

           
           
            String id = req.getParameter("bookid");
            String bname=req.getParameter("bookname");
           String query = "select quantity from books where book_id=? ";
            PreparedStatement st = con.prepareStatement(query);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();

            String query1 = "select sum(quantity) as qunty from users where  bookname=?";
            PreparedStatement st1 = con.prepareStatement(query1);            
            st1.setString(1, bname);
            ResultSet rs1 = st1.executeQuery();
            
            
            
            System.out.println("id : id=" + id );
            HttpSession session = req.getSession();
            session.setAttribute("id", id);
            
            if(rs1.next()) {
            	int qty=rs1.getInt("qunty");
            	System.out.println(qty);

            if (rs.next()) {
            	
            	int quantity = rs.getInt("quantity");
                System.out.println(quantity);
                
                if(quantity > qty) {
                	                    
                  System.out.println("books qty available");
                  res.sendRedirect(req.getContextPath() + "/Sendreq.jsp");
              }else {
            	  res.sendRedirect(req.getContextPath() + "/Sendreqerr.jsp");
            	  System.out.println("books qty not available");
            	  }

            }else {
            	System.out.println("sorry");
            }
            }else {
            	System.out.println("total qty");
            }
           

        } catch (Exception e) {
            e.printStackTrace();
        }
    }}
