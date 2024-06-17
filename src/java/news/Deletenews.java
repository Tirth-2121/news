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

public class Deletenews extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        Connection con;
        int id = Integer.parseInt(req.getParameter("id"));
        try
        {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            
            con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","sys");
            
            Statement stmt = con.createStatement();
            String query = "delete from news where id = "+id+"";
            if(stmt.executeUpdate(query) == 1)
            {
                resp.sendRedirect("Listnews.jsp");
            }
            else
            {
                out.println("noo");
            }
            
        }
        catch(Exception e)
        {
            out.println(e);
        }
    }

}
