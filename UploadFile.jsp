<%-- 
    Document   : UploadFile
    Created on : 7 Mar, 2025, 5:20:33 PM
    Author     : sathi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Products</title>
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
            <h1 align="center">ADD PRODUCTS</h1>
            <form action="AddProduct" method="post" enctype="multipart/form-data">
                <label for="product_name">Product Name : </label>
                <input type="text" name="productname" class="form-control"><br>
                
                <label for="quantity">Quantity : </label>
                <input type="text" name="quantity" class="form-control"><br>
                
                <label for="unit">Unit : </label>
                <select name="unit" class="form-control">
                    <option value="Millilitre">Millilitre(ml)</option>
                    <option value="Litre">Litre(ltr)</option>
                    <option value="Grams">Grams(gms)</option>
                    <option value="Kilograms">Kilograms(kgs)</option>
                </select><br>

                <label for="price">Price : </label>
                <input type="text" name="price" class="form-control"><br>
                
                <label for="product_image">Product Image : </label>
                <input type="file" name="productimage" class="form-control"><br>

                <input type="submit" value="INSERT" name="insert" class="btn btn-success btn-block">
            </form>
        </div>
    </body>
</html>