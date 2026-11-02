import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/SendEmailServlet")
public class SendEmailServlet extends HttpServlet {
    private static final String SMTP_HOST = "smtp.gmail.com"; // Use your SMTP server
    private static final String SMTP_PORT = "587"; // Port for TLS
    private static final String SENDER_EMAIL = "kowsisowthari@gmail.com"; // Your email
    private static final String SENDER_PASSWORD = "iqnp wtcc zpfo hanm"; // Your password
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String to = request.getParameter("to");
        String subject = request.getParameter("subject");
        String messageText = request.getParameter("message");
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", SMTP_HOST);
        props.put("mail.smtp.port", SMTP_PORT);
        // Additional Required Properties
props.put("mail.smtp.ssl.trust", "smtp.gmail.com"); // Trust Gmail SSL
props.put("mail.smtp.ssl.protocols", "TLSv1.2"); // Ensure TLS 1.2+

        // Authenticate with email server
        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(SENDER_EMAIL, SENDER_PASSWORD);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(SENDER_EMAIL));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            message.setSubject(subject);
            message.setText(messageText);

            Transport.send(message);

            // Display success response
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<h3>Email sent successfully to " + to + "!</h3>");
            out.println("<a href='EmailForm.jsp'>Send another email</a>");

        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }
}
