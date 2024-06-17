/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package news;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.text.SimpleDateFormat;

public class Editnews extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        int id = Integer.parseInt(req.getParameter("hid"));
        String title = req.getParameter("txttitle");
        String content = req.getParameter("txtcontent");
        String date = req.getParameter("date");
        String category = req.getParameter("selcat");
        String author = req.getParameter("txtauthor");
        
        Connection con;
        

        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    java.util.Date parsedDate = dateFormat.parse(date);

    // Convert the java.util.Date to java.sql.Date
    java.sql.Date sqlDate = new java.sql.Date(parsedDate.getTime());
            
            Class.forName("oracle.jdbc.driver.OracleDriver");

            con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "sys");
            
            String iquery = "update news set title=? , content=? , pdate=? , category=? ,author=? where id=? ";
            PreparedStatement pstmt = con.prepareStatement(iquery);
            pstmt.setString(1, title);
            pstmt.setString(2, content);
            pstmt.setDate(3, sqlDate);
            pstmt.setString(4, category);
            pstmt.setString(5, author);
            pstmt.setInt(6, id);

            pstmt.executeUpdate();
            resp.sendRedirect("Listnews.jsp");

        } catch (Exception e) {
            out.println(e);
        }
    }

    

}
