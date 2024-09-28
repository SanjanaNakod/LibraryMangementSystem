package library_pack;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/editBook")
public class EditBookServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        try {
       
            Class.forName("com.mysql.cj.jdbc.Driver");
          
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/librarymanage", "root", "root123");

           
            int bookId = Integer.parseInt(req.getParameter("book_id"));
            String bookName = req.getParameter("book_name");
            int authorId = Integer.parseInt(req.getParameter("author_id"));
            double price = Double.parseDouble(req.getParameter("price"));
            String edition = req.getParameter("edition");
            double amount = Double.parseDouble(req.getParameter("amount"));
            int categoryId = Integer.parseInt(req.getParameter("category_id"));
            String bookDesc = req.getParameter("book_desc");
            int quantity = Integer.parseInt(req.getParameter("quantity"));

            
            String query = "UPDATE books SET book_name = ?, author_id = ?, price = ?, edition = ?, amount = ?, category_id = ?, book_desc = ?, quantity = ? WHERE book_id = ?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, bookName);
            pst.setInt(2, authorId);
            pst.setDouble(3, price);
            pst.setString(4, edition);
            pst.setDouble(5, amount);
            pst.setInt(6, categoryId);
            pst.setString(7, bookDesc);
            pst.setInt(8, quantity);
            pst.setInt(9, bookId);
            pst.executeUpdate();

         
            res.sendRedirect("adminDashboard.jsp");

        
            pst.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
          
        }
    }
}
