<%-- 
    Document   : ViewProducts
    Created on : 7 Mar, 2025, 5:31:05 PM
    Author     : sathi
--%>


<%@page import="java.sql.* "%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Products</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <style>
            body{
                font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
                background-color: bisque;
                color: teal;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <table class="table">
                <h1 align="center">PRODUCTS</h1>
                <tr>
                    <th>ID</th>
                    <th>NAME</th>
                    <th>DESIGNATION</th>
                    <th>GENDER</th>
                          <th>USERNAME</th>
                    <th>IMAGE</th>
                </tr>
                <%
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/emp_acclaimerj","root","");
                    Statement st = con.createStatement();
                    ResultSet rs=st.executeQuery("select * from employee_register");
                    while(rs.next())
                        out.print("<tr><td>"+rs.getString(1)+"</td>"
                                + "<td>"+rs.getString(2)+"</td>"
                                        + "<td>"+rs.getString(3)+"</td>"
                                                + "<td>"+rs.getString(4)+"</td>"
                                                         + "<td>"+rs.getString(13)+"</td>"
                                                                + "<td><img src='Images/"+rs.getString(14)+"' style='height: 100px; width: 100px;' class='img-circle'></td></tr>");
                    con.close();
                %>
            </table>
        </div>
    </body>
</html>