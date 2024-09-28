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

@WebServlet("/addBook")


public class AddBook extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        try {
           
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/librarymanage", "root", "root123");

            
            String bookName = req.getParameter("book_name");
            String authorId = req.getParameter("author_id");
            String price = req.getParameter("price");
            String edition = req.getParameter("edition");
            String amount = req.getParameter("amount");
            String categoryId = req.getParameter("category_id");
            String bookDesc = req.getParameter("book_desc");
            String quantity = req.getParameter("quantity");

            
            String query = "INSERT INTO books (book_name, author_id, price, edition, amount, category_id, book_desc, quantity) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, bookName);
            pst.setString(2, authorId);
            pst.setString(3, price);
            pst.setString(4, edition);
            pst.setString(5, amount);
            pst.setString(6, categoryId);
            pst.setString(7, bookDesc);
            pst.setString(8, quantity);
            pst.executeUpdate();

            res.sendRedirect("adminDashboard.jsp");
           


        } catch (Exception e) {
            e.printStackTrace();
            

        }
    }
}
