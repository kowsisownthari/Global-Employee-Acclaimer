import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Paths;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2, // 2MB
    maxFileSize = 1024 * 1024 * 10,      // 10MB
    maxRequestSize = 1024 * 1024 * 50    // 50MB
)
public class AddProduct extends HttpServlet {

    private static final String UPLOAD_DIRECTORY = "Images"; // Folder name

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get the upload folder path
        String uploadPath = getServletContext().getRealPath("/") + UPLOAD_DIRECTORY;


        // Create the directory if it doesn't exist
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }
        try {
            String pn, pu;
            int pp, pq;
            
            pn = request.getParameter("productname");
            pu = request.getParameter("unit");
            pp = Integer.parseInt(request.getParameter("price"));
            pq = Integer.parseInt(request.getParameter("quantity"));
            
            Part filePart = request.getPart("productimage"); // Get the file
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // File Name

            if (!fileName.isEmpty()) {
                String filePath = uploadPath + File.separator + fileName;
                filePart.write(filePath); // Save file

                // Display success message
                response.setContentType("text/html");
                PrintWriter out = response.getWriter();
                
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/javaex","root","");
                Statement st = con.createStatement();
                
                String sql = "insert into file_upload(product_name, quantity, unit, price, product_image) values('"+pn+"','"+pq+"','"+pu+"','"+pp+"','"+fileName+"');";
                int i = st.executeUpdate(sql);
                if(i != 0)
                    out.print("<script>"
                            + "alert('Inserted Successfully!');"
                            + "location.href='UploadFile.jsp';"
                            + "</script>");
            }
        } catch (Exception e) {
            response.getWriter().println("<h3>File upload failed: " + e.getMessage() + "</h3>");
        }
    }
}