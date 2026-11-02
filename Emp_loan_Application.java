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
public class Emp_loan_Application extends HttpServlet {

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
            String user_id, user_name,contact,dpt,Emp_id,gender,mail, loan_type, amount,tenure, repayment_amount,requiredDate,bank_name, acc_number,bank_branch, prev_loan_amount,monthly_emi,closing_date ;
   
            user_id = request.getParameter("user_id");
            user_name = request.getParameter("user_name");
            contact = request.getParameter("contact");
            dpt = request.getParameter("dpt");
            Emp_id = request.getParameter("Emp_id");
            gender = request.getParameter("gender");
            mail = request.getParameter("mail");
            loan_type = request.getParameter("loan_type");
            amount = request.getParameter("amount");
            tenure = request.getParameter("tenure");
            repayment_amount = request.getParameter("repayment_amount");
            requiredDate = request.getParameter("requiredDate");
            bank_name = request.getParameter("bank_name");
            acc_number = request.getParameter("acc_number");
            bank_branch =request.getParameter("bank_branch");
            prev_loan_amount = request.getParameter("prev_loan_amount");
            monthly_emi= request.getParameter("monthly_emi");
            closing_date = request.getParameter("closing_date");
            
            Part filePart1 = request.getPart("bank_statement");
            Part filePart2 = request.getPart("aadhar_card");
            Part filePart3 = request.getPart("pan_card");

            String fileName1 = Paths.get(filePart1.getSubmittedFileName()).getFileName().toString();
            String fileName2 = Paths.get(filePart2.getSubmittedFileName()).getFileName().toString();
            String fileName3 = Paths.get(filePart3.getSubmittedFileName()).getFileName().toString();


            if (!fileName1.isEmpty()) {
                String filePath1 = uploadPath + File.separator + fileName1;
                filePart1.write(filePath1);
            }

            if (!fileName2.isEmpty()) {
                String filePath2 = uploadPath + File.separator + fileName2;
                filePart2.write(filePath2);
            }
             if (!fileName3.isEmpty()) {
                String filePath3 = uploadPath + File.separator + fileName3;
                filePart3.write(filePath3);
            }
                response.setContentType("text/html");
                PrintWriter out = response.getWriter();
                
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/emp_acclaimerj","root","");
                Statement st= con.createStatement();
                
                String sql = "insert into loan_application(user_name,user_id,contact,dpt,Emp_id,gender,mail,loan_type,amount,tenure,repayment_amount,requiredDate,bank_name,acc_number,bank_branch,prev_loan_amount,monthly_emi,closing_date,bank_statement,aadhar_card,pan_card,status) values('"+user_name+"','"+user_id+"','"+contact+"','"+dpt+"','"+Emp_id+"','"+gender+"','"+mail+"','"+loan_type+"','"+ amount+"','"+tenure+"','"+repayment_amount+"','"+requiredDate+"','"+bank_name+"','"+acc_number+"','"+bank_branch+"','"+prev_loan_amount+"','"+monthly_emi+"','"+closing_date+"','"+fileName1+"','"+fileName2+"','"+fileName3+"','Pending');";
                int i = st.executeUpdate(sql);
                if(i != 0)
                    out.print("<script>"
                            + "alert('Applied Successfully!');"
                              +"location.href='Employee_new_loan.jsp';"
                            + "</script>");
            }
         catch (Exception e) {
            response.getWriter().println("<h3>File upload failed: " + e.getMessage() + "</h3>");
        }
    }
}