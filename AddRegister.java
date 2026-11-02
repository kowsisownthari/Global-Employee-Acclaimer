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
public class AddRegister extends HttpServlet {

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
            String name, dpt, gen,DOB, mail,pass,Emp_id, branch,contact, DOJ,Address,username ;
   
            name = request.getParameter("name");
            dpt = request.getParameter("dpt");
            gen = request.getParameter("gen");
            DOB = request.getParameter("DOB");
            mail = request.getParameter("mail");
            pass = request.getParameter("pass");
            Emp_id = request.getParameter("Emp_id");
            branch = request.getParameter("branch");
            contact =request.getParameter("contact");
            DOJ = request.getParameter("DOJ");
            Address= request.getParameter("Address");
            username = request.getParameter("username");
            
            Part filePart1 = request.getPart("image1");
            Part filePart2 = request.getPart("image2");

            String fileName1 = Paths.get(filePart1.getSubmittedFileName()).getFileName().toString();
            String fileName2 = Paths.get(filePart2.getSubmittedFileName()).getFileName().toString();

            if (!fileName1.isEmpty()) {
                String filePath1 = uploadPath + File.separator + fileName1;
                filePart1.write(filePath1);
            }

            if (!fileName2.isEmpty()) {
                String filePath2 = uploadPath + File.separator + fileName2;
                filePart2.write(filePath2);
            }


                response.setContentType("text/html");
                PrintWriter out = response.getWriter();
                
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/emp_acclaimerj","root","");
                Statement st = con.createStatement();
                
                String sql = "insert into employee_register(name,dpt,gen,DOB,mail,pass,Emp_id,branch,contact,DOJ,Address,username,image1,image2) values('"+name+"','"+dpt+"','"+ gen+"','"+DOB+"','"+mail+"','"+pass+"','"+Emp_id+"','"+branch+"','"+contact+"','"+DOJ+"','"+Address+"','"+username+"','"+fileName1+"','"+fileName2+"');";
                int i = st.executeUpdate(sql);
                if(i != 0)
                    out.print("<script>"
                            + "alert('Inserted Successfully!');"          
                            +"location.href='Employee_register.jsp';"
                            + "</script>");
            }
         catch (Exception e) {
            response.getWriter().println("<h3>File upload failed: " + e.getMessage() + "</h3>");
        }
    }
}