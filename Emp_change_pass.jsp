<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% String user = (String) session.getAttribute("user_id");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update</title>
    </head>
    <body>
        <%
        String id=request.getParameter("id");
        String pass=request.getParameter("pass");
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/emp_acclaimerj","root","");
        Statement stm=con.createStatement();
        String sql="update employee_register set pass='"+pass+"' where id="+user+";";
        int i=stm.executeUpdate(sql);
        if (i!=0)
          out.print("<script>"
          +"alert('Updated Successfully');"
           +"location.href='Employee_Dashboard.jsp';"
           +"</script>");
        %>
        
    </body>
</html>
