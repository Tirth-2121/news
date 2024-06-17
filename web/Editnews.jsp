<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,java.util.Date,java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body>
        <%
    if (session == null || session.getAttribute("userid") == null) {
        // If the session or "userid" attribute is not set, redirect the user to the login page
        response.sendRedirect("Login.jsp");
    } else {
%>
    <center><h2 class="text-2xl font-bold text-black">Edit News</h2></center>
        <%
            Connection con;
            int id = Integer.parseInt(request.getParameter("id"));
            Class.forName("oracle.jdbc.driver.OracleDriver");
            
            con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","sys");
            
            Statement stmt = con.createStatement();
            String query = "select * from news where id = "+id+"";
            ResultSet rs = stmt.executeQuery(query);
            rs.next();
        %>
    <div class="flex flex-col items-center justify-center h-screen dark" style="margin-top: -30px">
            <div class="w-full max-w-md bg-gray-800 rounded-lg shadow-md p-6">
                <h2 class="text-2xl font-bold text-gray-200 mb-4">Edit News</h2>

                <form class="flex flex-col" method="post" action="Editnews">
                    <input type="hidden" name="hid" value="<%= rs.getInt("id") %>" />
                    <textarea name="txttitle" placeholder="Title" required="" class="bg-gray-700 text-gray-200 border-0 rounded-md p-2 mb-4 focus:bg-gray-600 focus:outline-none focus:ring-1 focus:ring-blue-500 transition ease-in-out duration-150"><%= rs.getString("title") %></textarea>
                    <textarea name="txtcontent" placeholder="Content" required="" class="bg-gray-700 text-gray-200 border-0 rounded-md p-2 mb-4 focus:bg-gray-600 focus:outline-none focus:ring-1 focus:ring-blue-500 transition ease-in-out duration-150"><%= rs.getString("content") %></textarea>

                    <input type="text" name="txtauthor" required="" value="<%= rs.getString("author") %>" placeholder="Author name" typ class="bg-gray-700 text-gray-200 border-0 rounded-md p-2 mb-4 focus:bg-gray-600 focus:outline-none focus:ring-1 focus:ring-blue-500 transition ease-in-out duration-150" type="text">
                    <%
                        Date today = new Date();

    // Format the date in the "YYYY-MM-DD" format
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    String todayFormatted = dateFormat.format(today);
                    %>

                    <input type="date" name="date" value="<%= todayFormatted  %>" class="bg-gray-700 text-gray-200 border-0 rounded-md p-2 mb-4 focus:bg-gray-600 focus:outline-none focus:ring-1 focus:ring-blue-500 transition ease-in-out duration-150" />



                    <select id="countries" name="selcat" class="bg-gray-700 border text-gray-200 border-0  rounded-md p-2 mb-4 focus:ring-blue-500 focus:bg-gray-600 focus:outline-none focus:ring-1 focus:ring-blue-500 transition ease-in-out duration-150">
                        <option value="general"  <%= rs.getString("category").equals("general") ? "selected" : "" %>>general</option>
                        <option value="health" <%= rs.getString("category").equals("health") ? "selected" : "" %>>Health</option>
                        <option value="political" <%= rs.getString("category").equals("political") ? "selected" : "" %>>political</option>
                        <option value="business" <%= rs.getString("category").equals("business") ? "selected" : "" %>>business</option>
                        <option value="technology" <%= rs.getString("category").equals("technology") ? "selected" : "" %>>technology</option>
                        <option value="food" <%= rs.getString("category").equals("food") ? "selected" : "" %>>food</option>
                        <option value="entertainment" <%= rs.getString("category").equals("entertainment") ? "selected" : "" %>>entertainment</option>
                        <option value="science" <%= rs.getString("category").equals("science") ? "selected" : "" %>>science</option>
                        <option value="sports" <%= rs.getString("category").equals("sports") ? "selected" : "" %>>sports</option>
                    </select>

                    <button class="bg-gradient-to-r from-indigo-500 to-blue-500 text-white font-bold py-2 px-4 rounded-md mt-4 hover:bg-indigo-600 hover:to-blue-600 transition ease-in-out duration-150" type="submit">Apply</button>
                </form>
            </div>
        </div>
    <% } %>
    </body>
</html>
