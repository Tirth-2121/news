<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body>
        <%@include file="Navbar.jsp" %>
        <div class="flex flex-col items-center justify-center h-screen dark">
            <div class="w-full max-w-md bg-gray-800 rounded-lg shadow-md p-6">
                <h2 class="text-2xl font-bold text-gray-200 mb-4">Add News</h2>

                <form class="flex flex-col" method="post" action="Addnews" enctype="multipart/form-data">
                    <textarea name="txttitle" placeholder="Title" class="bg-gray-700 text-gray-200 border-0 rounded-md p-2 mb-4 focus:bg-gray-600 focus:outline-none focus:ring-1 focus:ring-blue-500 transition ease-in-out duration-150" required=""></textarea>
                    <textarea name="txtcontent" placeholder="Content" class="bg-gray-700 text-gray-200 border-0 rounded-md p-2 mb-4 focus:bg-gray-600 focus:outline-none focus:ring-1 focus:ring-blue-500 transition ease-in-out duration-150" required=""></textarea>

                    <input type="text" name="txtauthor" placeholder="Author name" typ class="bg-gray-700 text-gray-200 border-0 rounded-md p-2 mb-4 focus:bg-gray-600 focus:outline-none focus:ring-1 focus:ring-blue-500 transition ease-in-out duration-150" type="text" required="">

                    <input type="date" name="date" class="bg-gray-700 text-gray-200 border-0 rounded-md p-2 mb-4 focus:bg-gray-600 focus:outline-none focus:ring-1 focus:ring-blue-500 transition ease-in-out duration-150" />



                    <select id="countries" name="selcat" class="bg-gray-700 border text-gray-200 border-0  rounded-md p-2 mb-4 focus:ring-blue-500 focus:bg-gray-600 focus:outline-none focus:ring-1 focus:ring-blue-500 transition ease-in-out duration-150">
                        <option value="general">general</option>
                        <option value="health">Health</option>
                        <option value="political">political</option>
                        <option value="business">business</option>
                        <option value="technology">technology</option>
                        <option value="food">food</option>
                        <option value="entertainment">entertainment</option>
                        <option value="science">science</option>
                        <option value="sports">sports</option>
                    </select>


                    <input placeholder="image" class="bg-gray-700 text-gray-200 border-0 rounded-md p-2 mb-4 focus:bg-gray-600 focus:outline-none focus:ring-1 focus:ring-blue-500 transition ease-in-out duration-150" type="file" name='file'>

                    <button class="bg-gradient-to-r from-indigo-500 to-blue-500 text-white font-bold py-2 px-4 rounded-md mt-4 hover:bg-indigo-600 hover:to-blue-600 transition ease-in-out duration-150" type="submit">Apply</button>
                </form>
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
