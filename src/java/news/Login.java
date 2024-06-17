/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package news;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

public class Login extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Connection con;
        PrintWriter out = resp.getWriter();
        String email = req.getParameter("txtemail");
        String password = req.getParameter("txtpassword");
        try
        {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            
            con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","System","sys");
            
            Statement stmt = con.createStatement();
            String query = "select * from userdb where email = '"+email+"' and password = '"+password+"' ";
            ResultSet rs = stmt.executeQuery(query);
            if(rs.next())
            {
                int uid = rs.getInt("urole");
                HttpSession session = req.getSession();
                session.setAttribute("userid", uid);
                resp.sendRedirect("Home.jsp");
                
            }
            else
            {
                out.println("<script>alert('email or password is invalid!');"
                        + "window.location.href = 'Login.jsp';</script>");
            }    
            rs.close();
            stmt.close();
            con.close();
        }
        catch(Exception e)
        {
            out.println(e);
        }
        
    }
    
    

}
