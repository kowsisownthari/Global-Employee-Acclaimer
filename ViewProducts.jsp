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
            .modal-content {
                background-color: #f5f5f5;
                color: teal;
            }
            .modal-header {
                border-bottom: 2px solid teal;
            }
            .details-label {
                font-weight: bold;
                color: #008080;
            }
            .product-image {
                margin: 10px auto;
                display: block;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <table class="table">
                <h1 align="center">PRODUCTS</h1>
                <tr>
                    <th>PRODUCT ID</th>
                    <th>PRODUCT NAME</th>
                    <th>QUANTITY</th>
                    <th>UNIT</th>
                    <th>PRICE</th>
                    <th>PRODUCT IMAGE</th>
                    <th>ACTION</th>
                </tr>
                <%
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/javaex","root","");
                    Statement st = con.createStatement();
                    ResultSet rs=st.executeQuery("select * from file_upload");
                    while(rs.next()) {
                        String productId = rs.getString(1);
                        String productName = rs.getString(2);
                        String quantity = rs.getString(3);
                        String unit = rs.getString(4);
                        int price = rs.getInt(5);
                        String image = rs.getString(6);
                        
                        out.print("<tr><td>"+productId+"</td>"
                                + "<td>"+productName+"</td>"
                                + "<td>"+quantity+"</td>"
                                + "<td>"+unit+"</td>"
                                + "<td>"+price+"</td>"
                                + "<td><img src='Images/"+image+"' style='height: 100px; width: 100px;' class='img-circle'></td>"
                                + "<td><button type='button' class='btn btn-info' data-toggle='modal' data-target='#productModal"+productId+"'>View Details</button></td></tr>");
                        
                        out.print("<div class='modal fade' id='productModal"+productId+"' tabindex='-1' role='dialog' aria-labelledby='productModalLabel' aria-hidden='true'>"
                                + "<div class='modal-dialog' role='document'>"
                                + "<div class='modal-content'>"
                                + "<div class='modal-header'>"
                                + "<button type='button' class='close' data-dismiss='modal' aria-label='Close'><span aria-hidden='true'>&times;</span></button>"
                                + "<h4 class='modal-title' id='productModalLabel'>Product Details</h4>"
                                + "</div>"
                                + "<div class='modal-body'>"
                                + "<div class='row'>"
                                + "<div class='col-md-6'>"
                                + "<p><span class='details-label'>Product ID:</span> "+productId+"</p>"
                                + "<p><span class='details-label'>Product Name:</span> "+productName+"</p>"
                                + "<p><span class='details-label'>Quantity:</span> "+quantity+"</p>"
                                + "<p><span class='details-label'>Unit:</span> "+unit+"</p>"
                                + "<p><span class='details-label'>Price:</span> "+price+"</p>"
                                + "</div>"
                                + "<div class='col-md-6'>"
                                + "<img src='Images/"+image+"' class='img-responsive img-circle product-image' style='height: 150px; width: 150px;'>"
                                + "</div>"
                                + "</div>"
                                + "</div>"
                                + "<div class='modal-footer'>"
                                + "<button type='button' class='btn btn-primary' data-dismiss='modal'>Close</button>"
                                + "</div>"
                                + "</div>"
                                + "</div>"
                                + "</div>");
                    }
                    con.close();
                %>
            </table>
        </div>
    </body>
</html>