<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Employee Login</title>
    </head>
    <body>
         <%
     String un=request.getParameter("uname");
     String ps=request.getParameter("pass");
     
     try {
       Class.forName("com.mysql.jdbc.Driver");
       Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/emp_acclaimerj", "root", "");
       Statement stm = con.createStatement();
       
       String query = "select * from advisor_register where mail='" + un + "' and pass='" + ps + "'";
       System.out.println("Executing query: " + query);
       
       ResultSet rs = stm.executeQuery(query);
       
       if (rs.next()) {
            String advisor_id = rs.getString("id"); 
            String name = rs.getString("name"); 
            String contact = rs.getString("contact");   
            String pro = rs.getString("pro");
            
            System.out.println("Login successful for: " + name);
            
            session.setAttribute("user_id",advisor_id);

            
            
            out.print("<script>" +
                    "alert('Logged in Successfully');" +
                    "location.href='Advisor_Dashboard.jsp';" +
                    "</script>");
        }
        else {
            System.out.println("Login failed for: " + un);
            out.print("<script>" +
                    "alert('Invalid Username or Password');" +
                    "location.href='Home.jsp';" +
                    "</script>");
        }
     } catch (Exception e) {
         System.out.println("Exception in login: " + e.getMessage());
         e.printStackTrace();
         out.print("<script>" +
                 "alert('Error: " + e.getMessage() + "');" +
                 "location.href='Login.jsp';" +
                 "</script>");
     }
%>
    </body>
</html>