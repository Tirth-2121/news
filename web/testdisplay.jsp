<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
                Connection con;
        try
        {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            
            con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","System","sys");
            
            Statement stmt = con.createStatement();
            String query = "select * from img";
            ResultSet rs = stmt.executeQuery(query);
            while(rs.next())
            { %>
            <div class="card col-md-3">
                <!--                <div class="card-image" style="background: url('components/bg-remove.png');background-repeat: no-repeat;background-size: cover"></div>-->
                <img class="card-img-top" src='images/<%= rs.getString("image") %>' style="height: 235px;"></img>
                <div class="category"> category </div>
                <div class="heading"> titletitletitletitletitletitletitletitletitletitletitle
                    <div class="author"> By <span class="name">tirth</span> on 3 days ago </div>
                </div>
                <button><a href="Viewnews.jsp?id=<%= rs.getString("id") %>" >Read more..</a></button>
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
    </body>
</html>
