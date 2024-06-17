<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="components/css-js.jsp" %>
    </head>
    <body>
        <%
    if (session == null || session.getAttribute("userid") == null) {
        // If the session or "userid" attribute is not set, redirect the user to the login page
        response.sendRedirect("Login.jsp");
    } else {
%>
        <%@include file="Navbar.jsp" %>
    <center><h2>News</h2></center>
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">title</th>
                    <th scope="col">content</th>
                    <th scope="col">Category</th>
                    <th scope="col">Author</th>
                    <th scope="col">Date</th>
                    <th scope="col">Edit</th>
                    <th scope="col">Delete</th>
                </tr>
            </thead>
            <tbody>
                <%
                        Connection con;
                try
                {
                    Class.forName("oracle.jdbc.driver.OracleDriver");
            
                    con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","System","sys");
            
                    Statement stmt = con.createStatement();
                    String query = "select * from news";
                    ResultSet rs = stmt.executeQuery(query);
                    while(rs.next())
                    { %>

                <tr>
                    <td><%= rs.getString("title") %></td>
                    <td><%= rs.getString("content") %></td>
                    <td><%= rs.getString("category") %></td>
                    <td><%= rs.getString("author") %></td>
                    <td><% String[] parts = rs.getString("pdate").split(" ", 2);String datePart = parts[0]; %><%= datePart %></td>
                    <td class="text-center"><a href="Editnews.jsp?id=<%= rs.getString("id") %>" class="text-primary"><span class="fas fa-edit"></a></span></td>
        <td class="text-center" ><a href="Deletenews?id=<%= rs.getString("id") %>" class="text-danger" onclick="return confirm('Are you sure you want to delete this news?')"><span class="fas fa-trash"></a></span></td>
                </tr>

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
            </tbody>
        </table>
            
                <%@include file="footer.jsp" %>
                <% } %>
    </body>
</html>
