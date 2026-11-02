<%-- 
    Document   : EmailForm
    Created on : 7 Mar, 2025, 11:52:53 AM
    Author     : sathi
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Send Email</title>
</head>
<body>
    <h2>Send Email</h2>
    <form action="SendEmailServlet" method="post">
        To: <input type="email" name="to" required><br><br>
        Subject: <input type="text" name="subject" required><br><br>
        Message: <textarea name="message" required></textarea><br><br>
        <input type="submit" value="Send Email">
    </form>
</body>
</html>

