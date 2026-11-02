<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Employee Register</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">       
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script> 
<style>
   body {
      color: #aa082e;
      font-family: 'Roboto', sans-serif;
    }
    a:link{
      text-decoration: none;
    }
     .notes {
      text-align: center;
      color: black;
      font-weight: bold;
    }
    .note {
      height: 80px;
      background: #dba73b;
      color: #fff;
      font-weight: bold;
      line-height: 80px;
      text-align:center;
    }
    .form-content {
      padding: 5%;
      border: 1px solid #ced4da;
      margin-bottom: 2%;
      background: #fff;
      border-radius: 10px;
    }
    .form-control,.form-select {
      border-radius: 1.5rem;
      width: 100%;
      padding: 10px;
      box-sizing: border-box;
      margin-bottom: 15px;
    }
    .custom-file-upload {
      display: block;
      width: 100%;
      padding: 10px;
      margin-bottom: 15px;
      border: 2px dashed #ced4da;
      border-radius: 10px;
      text-align: center;
      color: #6c757d;
      cursor: pointer;
    }
    .custom-file-upload:hover {
      background-color: #f8f9fa;
    }
    .btnSubmit {
      border: none;
      border-radius: 1.5rem;
      padding: 10px 20px;
      cursor: pointer;
      background: #0062cc;
      color: #fff;
      display: block;
      margin: 0 auto;
    }
       .navbar {
                background: #222121;
                padding: 1rem;
                height:90px;
            }
            .navbar-nav .nav-link {
                color: #ffffff;
                font-weight: 500;
                transition: all 0.3s ease;
                margin-left: 25px;
                position: relative;
            }
            .navbar-nav .nav-link:after {
                content: '';
                position: absolute;
                width: 0;
                height: 2px;
                bottom: -2px;
                left: 0;
                background-color: #fff;
                transition: width 0.3s ease;
            }
            .navbar-nav .nav-link:hover:after {
                width: 100%;
            }
            .navbar-brand {
                font-size: 1.8em;
                font-weight: 700;
                color: #ffffff;
            }
            .dropdown-menu {
                background: #ffffff;
                border-radius: 8px;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            }
            .dropdown-item {
                color: #222121;
                transition: all 0.3s ease;
            }
            .dropdown-item:hover {
                background-color: #222121;
                color: #ffffff;
            }
            footer {
                background: #222121;
                color: #ffffff;
                padding: 10px 0;
                margin-top: 50px;
            }
            .form {
      background: #fff;
     
    }
    .form-control {
      border-radius: 1.5rem;
      padding: 10px 20px;
      margin-bottom: 1rem;
      border: 1px solid #ced4da;
      font-size: 1rem;
    }
    .btnSubmit {
      border: none;
      border-radius: 1.5rem;
      padding: 10px 20px;
      width: 100%;
      cursor: pointer;
      background: #0062cc;
      color: #fff;
      font-weight: bold;
    }
</style>
</head>
<body>
           <nav class="navbar navbar-expand-lg">
            <div class="container">
                <a class="navbar-brand" href="#"><img src="image/2.PNG" style="height:80px; width:100px;">
</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="Home.jsp">Home</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="registerDropdown" role="button" data-bs-toggle="dropdown">
                                Register
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="Employee_register.jsp">Employee</a></li>
                            </ul>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="loginDropdown" role="button" data-bs-toggle="dropdown">
                                Login
                            </a>
                            <ul class="dropdown-menu">
                                 <li><a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#LoginModal">Employee</a></li>
                              <li><a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#advisorLoginModal">Financial Advisor</a></li>
                                 <li><a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#adminLoginModal">Admin</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
 <div class="modal fade" id="advisorLoginModal" tabindex="-1" aria-labelledby="advisorLoginModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                  
                    <div class="modal-body">
                        <form action="Advisor_Login.jsp" method="post" >
    <div class="form">
      <div class="notes">
        <p>Advisor Login Page</p>
      </div><br><br>
<center>
      <div class="form-content">
        <div class="form-group">
          <input type="text" name="uname" class="form-control" placeholder="Username" required>
        </div>
        <div class="form-group">
          <input type="password" name="pass" class="form-control" placeholder="Password" required>
        </div>
        <input type="submit" class="btnSubmit" value="Login" name="sub">
      </div>
    </div>
  </form>
                    </div>
                </div>
            </div>
        </div>
         <div class="modal fade" id="LoginModal" tabindex="-1" aria-labelledby="LoginModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                   
                    <div class="modal-body">
                       <form action="Emp_Login.jsp" method="post" >
    <div class="form">
      <div class="notes">
        <p>Employee Login Page</p>
      </div><br><br>
<center>
      <div class="form-content">
        <div class="form-group">
          <input type="text" name="uname" class="form-control" placeholder="Username" required>
        </div>
        <div class="form-group">
          <input type="password" name="pass" class="form-control" placeholder="Password" required>
        </div>
        <input type="submit" class="btnSubmit" value="Login" name="sub">
        <div class="text-center">Do not have an account? <a href="Employee_register.jsp">Signup here</a></div>
      </div>
    </div>
  </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
         <div class="modal fade" id="adminLoginModal" tabindex="-1" aria-labelledby="adminLoginModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    
                    <div class="modal-body">
                       <form action="Advisor_Login.jsp" method="post" >
    <div class="form">
      <div class="notes">
        <p>Admin Login Page</p>
      </div><br><br>
<center>
      <div class="form-content">
        <div class="form-group">
          <input type="text" name="uname" class="form-control" placeholder="Username" required>
        </div>
        <div class="form-group">
          <input type="password" name="pass" class="form-control" placeholder="Password" required>
        </div>
        <input type="submit" class="btnSubmit" value="Login" name="sub">
        
      </div>
    </div>
  </form>
                        </div>
                    </div>
                </div>
            </div>
        
<form action="AddRegister" method="post" enctype="multipart/form-data" style="margin-top:20px;" >
    <div class="container register-form">
      <div class="form">
        <div class="note" >
          <p>Employee Register</p>
        </div>
        <div class="form-content">
          <div class="row">
            <div class="col-md-6">
             <input type="text" name="name" class="form-control" placeholder="Employee Name" required>
              <select name="dpt" class="form-select" style="border: 1px solid #ced4da;">
                <option value="" disabled selected>Select Your Department</option>
    <option value="Software Developer">Software Developer</option> 
    <option value="System Administrator">System Administrator</option>
    <option value="Front-end Developer">Front-end Developer</option>
    <option value="Back-end Developer">Back-end Developer</option>
    <option value="Full-stack Developer">Full-stack Developer</option>
    <option value="Mobile App Developer">Mobile App Developer</option>
    <option value="DevOps Engineer">DevOps Engineer</option>
    <option value="Quality Assurance (QA) Engineer">Quality Assurance (QA) Engineer</option>
    <option value="UI/UX Designer">UI/UX Designer</option>
    <option value="Recruiter">Recruiter</option>
    <option value="Project Manager">Project Manager</option>
    <option value="Security Engineer">Security Engineer</option>
            </select>
<select name="gen" class="form-select" style="border: 1px solid #ced4da;">
                <option value="" disabled selected>Select Your Gender</option>
                <option value="Male">Male</option>
                <option value="Female">Female</option>
            </select>            
                           <label style="color:black;">Date Of Birth</label>

            <input type="date" name="DOB" class="form-control" required>

             <input type="email" name="mail" class="form-control" placeholder="Email" onchange="document.getElementById('uname').value=this.value">
              <input type="password" name="pass" class="form-control" placeholder="Password">
                           <p>Upload Profile Picture</p>
              <input type="file" name="image1" class="form-control" >

            </div>
            <div class="col-md-6">
               <input type="text" name="Emp_id" class="form-control" placeholder="Employee ID" required>
               <select name="branch" class="form-select" style="border: 1px solid #ced4da;">
                <option value="" disabled selected>Select Your Branch</option>
                 <option value="Coimbatore">Coimbatore</option>
    <option value="Chennai">Chennai</option>
    <option value="Bengaluru">Bengaluru</option>
    <option value="Delhi">Delhi</option>
    <option value="Mumbai">Mumbai</option>
    <option value="Kolkata">Kolkata</option>
    <option value="Hyderabad">Hyderabad</option>
    <option value="Pune">Pune</option>
    <option value="Ahmedabad">Ahmedabad</option>
    <option value="Kochi">Kochi</option>
    <option value="Lucknow">Lucknow</option>
            </select>
               <input type="number" name="contact" class="form-control" placeholder="Phone Number">
              <label style="margin-left:20px;color:black;">Date Of Joining</label>
            <input type="date" name="DOJ" class="form-control" required>
                         <input type="text" name="Address" class="form-control" placeholder="Address">

             <input type="email" name="username" class="form-control" placeholder="Username" id="uname">
             
 <p>Upload ID Proof</p>
              <input type="file" name="image2" class="form-control" >
             <br><br>
             
            </div>
              
          </div>
          <input type="submit" class="btnSubmit" value="Register" name="sub" style="width:200px;">
          <div class="text-center">Already have an account? <a href="Home.jsp">Login here</a></div>
        </div>
      </div>
    </div>
  </form>
 <footer class="footer">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 text-center">
<img src="image/2.PNG" style="height:80px; width:100px;">
<p class="mt-3">Empowering your financial journey</p>
                    </div>
                    <div class="col-md-4 text-center">
                        <h4>Banking Partners</h4>
                        <p>State Bank of India - Premium lending partner</p>
                        <p>Kotak Bank - Exclusive financial solutions</p>
                    </div>
                    <div class="col-md-4 text-center">
                        <script>
                            document.write("Copyright © " + new Date().getFullYear() + " FinanceEase. All rights reserved.");
                        </script>
                    </div>
                </div>
            </div>
        </footer>
</body>
</html>