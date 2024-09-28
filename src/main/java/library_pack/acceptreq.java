package library_pack;
import java.sql.*;
import java.net.http.HttpRequest;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/accreq")
public class acceptreq extends HttpServlet {
	public void doGet(HttpServletRequest req,HttpServletResponse res) {
		 try {
	           
	            Class.forName("com.mysql.cj.jdbc.Driver");
	            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/librarymanage", "root", "root123");
	               
	            PreparedStatement st = con.prepareStatement("select * from  users");
	            ResultSet rs = st.executeQuery();
                String id=req.getParameter("id");

	            if (rs.next()) {
               	 int userqty = rs.getInt("quantity");
            	 String bname = rs.getString("bookname");

            	    HttpSession session = req.getSession();
                    session.setAttribute("bname", rs.getString("bookname"));     
                    HttpSession session1 = req.getSession();
                    session1.setAttribute("userId", rs.getString("id"));
//            	 System.out.println("id"+id);
            	 System.out.println("bname"+bname);
	               try( PreparedStatement q=con.prepareStatement("select book_id, book_name, author_id, price, edition, amount, category_id, book_desc, quantity from books where book_name=?");){
	            	  q.setString(1, bname);
	            	  ResultSet rs1 = q.executeQuery();
	                if (rs1.next()) {
	                	String bookid= rs1.getString("book_id");
//	               	 System.out.println("bookid"+bookid);
	                    session.setAttribute("bookId", rs1.getString("book_id")); 
	                	 System.out.println("Accept successful! rs1");
	                	  res.sendRedirect(req.getContextPath() + "/accept.jsp");
	                	 int currentqty = rs1.getInt("quantity");
	                	  if (userqty < currentqty -1  ) {
	                        int newqty = currentqty - userqty;

	                      try (PreparedStatement updateSt = con.prepareStatement(
                               "UPDATE books SET quantity = ? WHERE book_name = ?")) {
                           updateSt.setInt(1, newqty);
                           updateSt.setString(2, bname);
                           int x1 = updateSt.executeUpdate();

                           if (x1 > 0) {
                               System.out.println("Accept successful! New qty: " + newqty);
//                               delete
//                               try (PreparedStatement deleteSt = con.prepareStatement(
//                                       "delete from users where id=? and  bookname=?")) {
//                            	   deleteSt.setString(1, id);
//                            	   deleteSt.setString(2, bname);
//                            	   deleteSt.executeUpdate();
//                                   ResultSet rs3 = deleteSt.executeQuery();
//
//                                   if (rs3.next()) {
//                                       System.out.println("Accept successful! New qty: " + newqty);
//                                       res.sendRedirect(req.getContextPath() + "/Showreq.jsp");
//                                                } else System.out.println("failed") ;       	                    
//                                   } catch (Exception e) {
//        	                      e.printStackTrace();
//        	                      System.out.println(e);
//        	                     
//        	                  }
                               
                               

                           } else {
                               System.out.println("failed. Please try again quantity.");
                              
                           }
	                    } catch (Exception e) {
	                      e.printStackTrace();
	                      System.out.println(e);
	                     
	                  }
                       }
	                }
	            	   
	               }
	            } else {
	                System.out.println("Sorry, Data could not be inserted");
	            }

	            
	            
		 } catch (Exception e) {
	            e.printStackTrace();
	        }
	}

}
