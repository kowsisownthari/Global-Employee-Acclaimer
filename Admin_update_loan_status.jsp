<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update</title>
    </head>
    <body>
        <%
        String application_id=request.getParameter("application_id");
        String status=request.getParameter("status");
        String rejection_reason=request.getParameter("rejection_reason");
        
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/emp_acclaimerj","root","");
        Statement stm=con.createStatement();
        String sql="update loan_application set status='"+status+"',Admin_rejected_reason='"+rejection_reason+"' where application_id="+application_id+";";
        int i=stm.executeUpdate(sql);
        if (i!=0)
          out.print("<script>"
          +"alert('Updated Successfully');"
           +"location.href='Admin_Dashboard.jsp';"
           +"</script>");
        %>
        
    </body>
</html>
