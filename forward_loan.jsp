
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Register</title>
</head>
<body>
    <%
        String application_id=request.getParameter("application_id");
        String advisor_name=request.getParameter("advisor_name");

        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/emp_acclaimerj","root","");
        Statement stm=con.createStatement();
       String sql = "UPDATE loan_application SET status='Forwarded',Forwarded_to='" + advisor_name + "' WHERE application_id='" + application_id + "'";         
        int i=stm.executeUpdate(sql);
        if (i!=0)
          out.print("<script>"
          +"alert('success');"
           +"</script>");
        %>
</body>
</html>

