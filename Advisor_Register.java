import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Paths;
import java.sql.*;
import java.util.Properties;
import java.util.Random;
import javax.mail.*;
import javax.mail.internet.*;
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
public class Advisor_Register extends HttpServlet {
    private static final String UPLOAD_DIRECTORY = "Images"; // Folder name
    
    // Email configuration
    private static final String SMTP_HOST = "smtp.gmail.com";
    private static final String SMTP_PORT = "587";
    private static final String SENDER_EMAIL = "kowsisowthari@gmail.com";
    private static final String SENDER_PASSWORD = "qkyg aqul ppgx hrjb";
    
    // Method to generate random password
    private String generateRandomPassword() {
        String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*";
        StringBuilder password = new StringBuilder();
        Random random = new Random();
        
        // Generate a random password of length 10
        for (int i = 0; i < 10; i++) {
            int index = random.nextInt(chars.length());
            password.append(chars.charAt(index));
        }
        
        return password.toString();
    }
    
    // Method to send email
    private void sendEmail(String to, String randomPassword) throws MessagingException {
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", SMTP_HOST);
        props.put("mail.smtp.port", SMTP_PORT);
        props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
        props.put("mail.smtp.ssl.protocols", "TLSv1.2");
        
        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(SENDER_EMAIL, SENDER_PASSWORD);
            }
        });
        
        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress(SENDER_EMAIL));
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
        message.setSubject("PASSWORD FOR LOAN HUB");
         message.setText("Your Username is: " + to + " and Your password is: " + randomPassword);
        
        Transport.send(message);
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get the upload folder path
        String uploadPath = getServletContext().getRealPath("/") + UPLOAD_DIRECTORY;
        // Create the directory if it doesn't exist
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }
        
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        try {
            String name, advisorid, mail, contact, birth, doj, street, city, State, Country, educate, pro, gen, year,branch,uname;
   
            name = request.getParameter("name");
            advisorid = request.getParameter("advisorid");
            contact = request.getParameter("contact");
            birth = request.getParameter("birth");
            mail = request.getParameter("mail");
            doj = request.getParameter("doj");
            street = request.getParameter("street");
            city = request.getParameter("city");
            State = request.getParameter("State");
            Country = request.getParameter("Country");
            educate = request.getParameter("educate");
            pro = request.getParameter("pro");
            gen = request.getParameter("gen");
            year = request.getParameter("year");
            branch = request.getParameter("branch");
            uname = request.getParameter("uname");

            
            String randomPassword = generateRandomPassword();
           
            Part filePart1 = request.getPart("profile");
            Part filePart2 = request.getPart("proof");
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
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/emp_acclaimerj", "root", "");
            Statement st = con.createStatement();
            
            String sql = "insert into advisor_register(name,advisorid,contact,birth,mail,doj,street,city,State,Country,educate,pro,gen,year,branch,uname,pass,profile,proof) values('" + name + "','" + advisorid + "','" + contact + "','" + birth + "','" + mail + "','" + doj + "','" + street + "','" + city + "','" + State + "','" + Country + "','" + educate + "','" + pro + "','" + gen + "','" + year + "','"+branch+"','"+uname+"','"+randomPassword+"','" + fileName1 + "','" + fileName2 + "');";
            int i = st.executeUpdate(sql);
            
            if (i != 0) {
                // Send email with random password
                try {
                    sendEmail(mail, randomPassword);
                    out.print("<script>"
                            + "alert('Registration Successful! Login details sent to your email.');"
                            + "</script>");
                } catch (MessagingException e) {
                    out.print("<script>"
                            + "alert('Registration Successful! But email could not be sent: " + e.getMessage() + "');"
                                    +"location.href='Advisor_Register.jsp';"
                            + "</script>");
                }
            }
        } catch (Exception e) {
            out.println("<h3>Registration failed: " + e.getMessage() + "</h3>");
        }
    }
}