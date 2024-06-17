<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <%@include file="components/css-js.jsp" %>
        <style>
            .card {
                width: 190px;
                background: white;
                padding: .4em;
                border-radius: 6px;
            }

            .card-image {
                /*background-color: rgb(236, 236, 236);*/
                /*                width: 100%;
                                height: 250px;
                                border-radius: 6px 6px 0 0;*/
            }

            .card-image:hover {
                transform: scale(0.98);
            }

            .category {
                text-transform: uppercase;
                font-size: 0.7em;
                font-weight: 600;
                color: rgb(63, 121, 230);
                padding: 10px 7px 0;
            }

            .category:hover {
                cursor: pointer;
            }

            .heading {
                font-weight: 600;
                color: rgb(88, 87, 87);
                padding: 7px;
            }

            .heading:hover {
                cursor: pointer;
            }

            .author {
                color: gray;
                font-weight: 400;
                font-size: 11px;
                padding-top: 20px;
            }

            .name {
                font-weight: 600;
            }

            .name:hover {
                cursor: pointer;
            }
        </style>
    </head>
    <body>
        <%@include file="Navbar.jsp" %>

        <div class='row'>
            <%
                Connection con;
                PreparedStatement pstmt = null;
        try
        {
        String cat = request.getParameter("cat");
            Class.forName("oracle.jdbc.driver.OracleDriver");
            
            con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","System","sys");
            
            String query;
            if (cat == null) {
                query = "select * from news";
                pstmt = con.prepareStatement(query);
            } else {
                query = "SELECT * FROM news WHERE category = ?";
                pstmt = con.prepareStatement(query);
                pstmt.setString(1, cat);
            }
            ResultSet rs = pstmt.executeQuery();

            while(rs.next())
            { %>

            <div class="card col-md-3 mb-3">
                <!--                <div class="card-image" style="background: url('components/bg-remove.png');background-repeat: no-repeat;background-size: cover"></div>-->
                <img class="card-img-top" src='images/<%= rs.getString("imgname") %>' style="height: 235px;"></img>
                <div class="category"> <%= rs.getString("category") %> </div>
                <div class="heading"> <%= rs.getString("title") %>
                    <div class="author"> By <span class="name"><%= rs.getString("author") %></span> on <% String[] parts = rs.getString("pdate").split(" ", 2);String datePart = parts[0]; %><%= datePart %> </div>
                </div>
                <button><a href="Viewnews.jsp?id=<%= rs.getString("id") %>" >Read more..</a></button>
            </div>
            <% }
            rs.close();
            con.close();
        }
        catch(Exception e)
        {
            out.println(e);
        }
            %>

        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
