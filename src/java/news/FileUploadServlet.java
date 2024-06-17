/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package news;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.*;
import java.util.UUID;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 50)
public class FileUploadServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();

        Part part = req.getPart("file");
        String fileName = extractFileName(part);
        String savePath = "D:\\CMPICA\\MCA sem-1\\Advance Java\\case study\\news\\web\\images" + File.separator + fileName;
        File fileSaveDir = new File(savePath);
        part.write(savePath + File.separator);
        Connection con;
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");

            con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "sys");

            Statement stmt = con.createStatement();
            String query = "select max(id) from img";
            ResultSet rs = stmt.executeQuery(query);
            rs.next();
            int max = rs.getInt(1);
            max++;
            String iquery = "insert into img values(?,?)";
            PreparedStatement pstmt = con.prepareStatement(iquery);
            pstmt.setInt(1, max);
            pstmt.setString(2, fileName);

            pstmt.executeUpdate();

        } catch (Exception e) {

        }
    }

    private String generateRandomFileName(String originalFileName) {
        // Generate a random string (UUID) to use as the new filename
        String randomString = UUID.randomUUID().toString().replace("-", "");

        // Get the file extension from the original filename
        String fileExtension = originalFileName.substring(originalFileName.lastIndexOf('.'));

        // Combine the random string and the file extension
        return randomString + fileExtension;
    }

    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                // Use the generated random filename instead of the original one
                return generateRandomFileName(s.substring(s.indexOf("=") + 2, s.length() - 1));
            }
        }
        return "";
    }

}
