<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
</head>
<body>
 <%
     String un=request.getParameter("uname");
     String ps=request.getParameter("pass");
     if(un.equals("admin") && ps.equals("0000")) {
         out.print("<script>"+
         "alert('Logged in Successfully');"+
         "location.href='Admin_Dashboard.jsp';" +
    
         "</script>");
        }
       else {
            out.print("<script>"+ 
            "alert('Invalid Username or Password');"+
             "</script>");
        }
 %>
     </body>
</html>
