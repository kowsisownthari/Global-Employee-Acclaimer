<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Financial Advisor Registration</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        :root {
            --primary-color: #3a6ea5;
            --secondary-color: #6a93cb;
            --accent-color: #c0d6df;
            --dark-color: #293241;
            --light-color: #f8f9fa;
            --primary: #4361ee;
            --secondary: #3f37c9;
            --accent: #4cc9f0;
            --light: #f8f9fa;
            --dark: #212529;
            --success: #4caf50;
            --danger: #f72585;
            --warning: #ff9e00;
            --card-bg: #ffffff;
            --sidebar-width: 280px;
            --sidebar-collapsed: 80px;
        }
        
        body {
            background-color: #f5f7fa;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
      
        
        .login-form-wrapper {
            background: white;
            border-radius: 12px;
            padding: 2rem;
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.05);
            margin: 2rem auto;
            max-width: 800px;
            border-top: 5px solid black;
            width: 90%;
        }
        
        .login-form h4 {
            color: black;
            font-size: 1.8rem;
            text-align: center;
            margin-bottom: 2rem;
            font-weight: 600;
            position: relative;
            padding-bottom: 1rem;
        }
        
     
        
        .form-row {
            display: flex;
            flex-wrap: wrap;
            gap: 1rem;
            margin-bottom: 1.2rem;
        }
        
        .form-group {
            flex: 1;
            min-width: 250px;
            position: relative;
            margin-bottom: 1rem;
        }
        
        .form-group input,
        .form-group select {
            width: 100%;
            padding: 0.8rem 1rem;
            border: 1px solid #e0e0e0;
            border-radius: 8px;
            background-color: #fff;
            transition: all 0.3s ease;
            font-size: 0.95rem;
            color: #495057;
            box-shadow: inset 0 1px 2px rgba(0,0,0,0.05);
        }
        
        .form-group input:focus,
        .form-group select:focus {
            border-color: var(--secondary-color);
            box-shadow: 0 0 0 3px rgba(106, 147, 203, 0.15);
            outline: none;
        }
        
        .form-group p {
            font-size: 0.9rem;
            color: var(--dark-color);
            margin-bottom: 0.5rem;
            font-weight: 500;
        }
        
        .form-group input[type="submit"],
        .form-group input[type="reset"] {
            padding: 0.8rem 2rem;
            border: none;
            border-radius: 8px;
            font-weight: 600;
            letter-spacing: 0.5px;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        
        .form-group input[type="submit"] {
            background: linear-gradient(135deg, var(--primary-color) 0%, var(--secondary-color) 100%);
            color: white;
        }
        
        .form-group input[type="button"] {
            background: linear-gradient(135deg, #e74c3c 0%, #c0392b 100%);
            color: white;
        }
        
        .form-group input[type="submit"]:hover,
        .form-group input[type="button"]:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.15);
        }
        
        .form-group input::placeholder {
            color: #adb5bd;
            font-size: 0.9rem;
        }
        
        select {
            appearance: none;
            -webkit-appearance: none;
            -moz-appearance: none;
            background-image: url("data:image/svg+xml;charset=UTF-8,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='none' stroke='%23495057' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3e%3cpolyline points='6 9 12 15 18 9'%3e%3c/polyline%3e%3c/svg%3e");
            background-repeat: no-repeat;
            background-position: right 1rem center;
            background-size: 1em;
        }
        
        .footer {
            background: linear-gradient(135deg, var(--primary-color) 0%, var(--secondary-color) 100%);
            color: #ffffff;
            padding: 2rem 0;
            margin-top: 3rem;
        }
        
        .section-title {
            position: relative;
            display: inline-block;
            margin-bottom: 1rem;
            font-weight: 600;
        }
        
        .section-title:after {
            content: '';
            position: absolute;
            bottom: -8px;
            left: 0;
            width: 50px;
            height: 2px;
            background-color: #fff;
        }
        .wrapper {
            display: flex;
            width: 100%;
            min-height: 100vh;
        }
        
        /* Sidebar styling */
        .sidebar {
            width: var(--sidebar-width);
            height: 100vh;
            background:  #292826;
            color: var(--light);
            position: fixed;
            left: 0;
            top: 0;
            z-index: 100;
            transition: all 0.3s ease;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            display: flex;
            flex-direction: column;
            overflow: hidden;
        }
        
        .main-content {
            flex: 1;
            margin-left: var(--sidebar-width);
            padding: 20px;
            transition: all 0.3s ease;
        }
        
        .sidebar.collapsed + .main-content {
            margin-left: var(--sidebar-collapsed);
        }
        
        .sidebar.collapsed {
            width: var(--sidebar-collapsed);
        }
        
        .brand {
            padding: 25px 20px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }
        
        .brand h2 {
            font-size: 1.8rem;
            font-weight: 700;
            margin: 0;
            color: var(--light);
            white-space: nowrap;
        }
       
        
        .sidebar-menu {
            padding: 20px 0;
            flex: 1;
            overflow-y: auto;
        }
        
        .menu-item {
            padding: 14px 20px;
            display: flex;
            align-items: center;
            position: relative;
            cursor: pointer;
            transition: all 0.3s ease;
            margin: 8px 15px;
            border-radius: 12px;
            color: var(--light);
            text-decoration: none;
            
        }
        
        .menu-item:hover, .menu-item.active {
            background: rgba(255, 255, 255, 0.1);
        }
        
        .menu-item i {
            font-size: 1.2rem;
            min-width: 30px;
            margin-right: 10px;
            text-align: center;
        }
        
        .menu-item span {
            white-space: nowrap;
            opacity: 1;
            transition: opacity 0.3s ease;
        }
        
        .sidebar.collapsed .menu-item span {
            opacity: 0;
            width: 0;
        }
        
        .dropdown-menu {
            background: gray;
            border: none;
            border-radius: 12px;
            padding: 5px;
            margin-top: 5px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            width: 90%;
            transition: all 0.3s ease;
        }
        
        .dropdown-item {
            color: var(--light);
            padding: 12px 15px;
            border-radius: 8px;
            transition: all 0.3s ease;
            margin: 5px 0;
            
        }
        
        .dropdown-item:hover {
            background: rgba(255, 255, 255, 0.1);
            color: var(--light);
        }
        
        .dropdown-toggle::after {
            margin-left: auto;
            margin-right: 5px;
        }
        
        .logout {
            margin-top: auto;
            padding: 20px;
            border-top: 1px solid rgba(255, 255, 255, 0.1);
        }
        
        .logout-btn {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 100%;
            padding: 12px;
            background-color: var(--danger);
            border: none;
            border-radius: 12px;
            color: white;
            font-weight: 600;
            transition: all 0.3s ease;
            cursor: pointer;
            text-decoration: none;
        }
        
        .logout-btn:hover {
            background-color: #e01e79;
            transform: translateY(-2px);
            color: white;
        }
        
        .logout-btn i {
            margin-right: 10px;
            font-size: 1.1rem;
        }

       
    </style>
</head>
<body>
   <div class="wrapper">
        <aside class="sidebar" id="sidebar">
            <div class="brand">
                <img src="image/2.PNG" style="height:80px; width:100px;">                
            </div>
            <div class="sidebar-menu">
                <a href="Admin_Dashboard.jsp" class="menu-item ">
                    <i class="fas fa-user-circle"></i>
                    <span>Dashboard</span>
                </a>
                
                <div class="dropdown">
                    <a class="menu-item dropdown-toggle" href="#" role="button" id="employeeDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="fas fa-user"></i>
                        <span>Employee</span>
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="employeeDropdown">
                        <li><a class="dropdown-item" href="Admin_Add_Employee.jsp">New Employee</a></li>
                        <li><a class="dropdown-item" href="Admin_Existing_Employee.jsp">Existing Employee</a></li>
                    </ul>
                </div>
                
                <div class="dropdown">
                    <a class="menu-item dropdown-toggle" href="#" role="button" id="advisorDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="fas fa-briefcase"></i>
                        <span>Financial Advisor</span>
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="advisorDropdown">
                        <li><a class="dropdown-item" href="Advisor_Register.jsp">New</a></li>
                        <li><a class="dropdown-item" href="Admin_Existing_Advisor.jsp">Existing</a></li>
                    </ul>
                </div>
                
                <div class="dropdown dropup">
                    <a class="menu-item dropdown-toggle" href="#" role="button" id="loanRequestDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="fas fa-dollar-sign"></i>
                        <span>Loan Request</span>
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="loanRequestDropdown">
                        <li><a class="dropdown-item" href="Admin_new_loan.jsp">New Loan Request</a></li>
                        <li><a class="dropdown-item" href="Admin_Approved_loan.jsp">Approved Loan</a></li>
                        <li><a class="dropdown-item" href="Admin_Rejected_loan.jsp">Rejected Loan</a></li>
                            <li><a class="dropdown-item" href="Admin_Forwarded_loan.jsp">Forwarded Loan</a></li>

                    </ul>
                </div>
                 <div class="dropdown">
                    <a class="menu-item dropdown-toggle" href="#" role="button" id="loanRequestDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="fas fa-file-invoice-dollar"></i>
                        <span>Advisor loan Response</span>
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="loanRequestDropdown">
                        <li><a class="dropdown-item" href="Admin_Rejected_loan_byAdvisor.jsp">Advisor Rejected Loan</a></li>
                        <li>
                            <li><a class="dropdown-item" href="Admin_Accepted_loan_byAdvisor.jsp">Advisor Approved Loan</a></li>
                    </ul>
                </div>
            </div>
            <div class="logout">
                <a href="Home.jsp" class="logout-btn">
                    <i class="fas fa-sign-out-alt"></i>
                    <span>Logout</span>
                </a>
            </div>
        </aside>
   
        <!-- Main Content -->
        <div class="main-content">
            <div class="login-form-wrapper">
                <div class="login-form">
                    <h4>Financial Advisor Registration</h4>
                    <form action="Advisor_Register" method="post"enctype="multipart/form-data">
                        <div class="form-row">
                            <div class="form-group">
                                <input type="text" name="name" id="name" placeholder="Full Name" required>
                            </div>
                            <div class="form-group">
                                <input type="text" name="advisorid" id="advisorid" placeholder="Advisor ID" required>
                            </div>
                        </div>
                        
                        <div class="form-row">
                            <div class="form-group">
                                <input type="email" name="mail" id="mail" placeholder="Email Address" required onchange="document.getElementById('uname').value=this.value">
                            </div>
                            <div class="form-group">
                                <input type="number" name="contact" id="contact" placeholder="Phone Number">
                            </div>
                        </div>
                        
                        <div class="form-row">
                            <div class="form-group">
                                <p>Date of Birth</p>
                                <input type="date" name="birth" id="birth">
                            </div>
                            <div class="form-group">
                                <p>Date of Joining</p>
                                <input type="date" name="doj" id="doj">
                            </div>
                        </div>
                        
                        <div class="form-row">
                            <div class="form-group">
                                <p>Address</p>
                                <input type="text" name="street" id="street" placeholder="Street">
                            </div>
                            <div class="form-group" style="margin-top: 35px;">
                                <input type="text" name="city" placeholder="City">
                            </div>
                        </div>
                        
                        <div class="form-row">
                            <div class="form-group">
                                <input type="text" name="State" placeholder="State">
                            </div>
                            <div class="form-group">
                                <input type="text" name="Country" placeholder="Country">
                            </div>
                        </div>
                        
                        <div class="form-row">
                            <div class="form-group">
                                <select name="educate" id="educate">
                                    <option value="" disabled selected>Select Your Qualification</option>
                                    <option value="High School">High School</option>
                                    <option value="Associate Degree">Associate Degree</option>
                                    <option value="Bachelors Degree">Bachelors Degree</option>
                                    <option value="Masters Degree">Masters Degree</option>
                                    <option value="Doctorate">Doctorate</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <select name="pro" id="pro">
                                    <option value="" disabled selected>Select Your Profession</option>
                                    <option value="Behavioral Financial Advisor">Behavioral Financial Advisor</option>
                                    <option value="Insurance Advisor">Insurance Advisor</option>
                                    <option value="Tax Advisor">Tax Advisor</option>
                                    <option value="Financial Planner">Financial Planner</option>
                                    <option value="Investment Advisor">Investment Advisor</option>
                                    <option value="Corporate Financial Advisor">Corporate Financial Advisor</option>
                                    <option value="Philanthropic Advisor">Philanthropic Advisor</option>
                                </select>
                            </div>
                        </div>
                        
                        <div class="form-row">
                            <div class="form-group">
                                <select name="gen" id="gen">
                                    <option value="" disabled selected>Select Your Gender</option>
                                    <option value="Male">Male</option>
                                    <option value="Female">Female</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <input type="text" name="year" id="year" placeholder="Years of Experience">
                            </div>
                        </div>
                         <div class="form-row">
                           
                            <div class="form-group">

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
                                </select></div>
                                                         <div class="form-group">

                                <input type="text" name="uname" id="uname" id="uname" placeholder="username" readonly>
                            </div>
                        </div>
                        
                          <div class="form-row">
                            <div class="form-group">
                                <p>Upload Profile Picture</p>
                                <input type="file" name="profile" id="profile">
                            </div>
                            <div class="form-group">                         
                                <p>Upload ID Proof</p>
                                <input type="file" name="proof" id="profile">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group">
                                <input type="submit" name="sub" value="Submit">
                            </div>
                            <div class="form-group">
                                <a href="Admin_Dashboard.jsp"><input type="button" name="can"  value="Cancel" class="btn btn-danger"></a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>


</body>
</html>