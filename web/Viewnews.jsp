<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
    if (session == null || session.getAttribute("userid") == null) {
        // If the session or "userid" attribute is not set, redirect the user to the login page
        response.sendRedirect("Login.jsp");
    } else {
%>
        <%
                int id = Integer.parseInt(request.getParameter("id"));
                Connection con;
        try
        {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            
            con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","System","sys");
            
            Statement stmt = con.createStatement();
            String query = "select * from news where id = "+id+"";
            ResultSet rs = stmt.executeQuery(query);
            while(rs.next())
            { %>
        <div class='col-md-3'>
            <div class="card" style="width: 100%;">
                <img src='images/<%= rs.getString("imgname") %>' height="300px" class="card-img-top" alt="...">
                <div class="card-body">
                    <h2 class="card-title"><%= rs.getString("title") %></h2>
                    <div class="card-body">

                        <p><%= rs.getString("content") %></p>
                        <p><% String[] parts = rs.getString("pdate").split(" ", 2);String datePart = parts[0]; %><%= datePart %></p>
                    </div>
                </div>
            </div>
        </div>
        <% }
        rs.close();
        stmt.close();
        con.close();
    }
    catch(Exception e)
    {
        out.println(e);
    }
        %>
        <% } %>
    </body>
</html>
