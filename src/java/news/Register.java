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


public class Register extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        Connection con;
        String fname = req.getParameter("txtfname");
        String lname = req.getParameter("txtlname");
        String email = req.getParameter("txtemail");
        String password = req.getParameter("txtpassword");
        String cpassword = req.getParameter("txtcpassword");
        String fullname = fname+" "+lname;
        try
        {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            
            con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","sys");
            
            Statement stmt = con.createStatement();
            String query = "select max(id) from userdb";
            ResultSet rs = stmt.executeQuery(query);
            rs.next();
            int max = rs.getInt(1);
            max++;
            String iquery = "insert into userdb values(?,?,?,?,?)";
            PreparedStatement pstmt = con.prepareStatement(iquery);
            pstmt.setInt(1, max);
            pstmt.setString(2, fullname);
            pstmt.setString(3,email );
            pstmt.setString(4, password);
            pstmt.setInt(5, 2);
            if(password.equals(cpassword))
            {
                pstmt.executeUpdate();
                out.println("<script>alert('record inserted!');"
                        + "window.location.href = 'Login.jsp';</script>");
//                resp.sendRedirect("Login.jsp");
            }
            else
            {
                out.println("<script>alert('password and confirm password should be match!');"
                        + "window.location.href = 'Register.jsp';</script>");
            }
            
            
        }
        catch(Exception e)
        {
            out.println(e);
        }
    }

    

}
