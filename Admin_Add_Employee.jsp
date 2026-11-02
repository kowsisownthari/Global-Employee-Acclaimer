<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin New Employee</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
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
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Montserrat', sans-serif;
        }
        
        body {
            background: linear-gradient(135deg, #f6f8fb 0%, #e9f0f8 100%);
            min-height: 100vh;
            position: relative;
            overflow-x: hidden;
        }
        
        .wrapper {
            display: flex;
            width: 100%;
            height: 100vh;
        }
        
        /* Sidebar styling */
        .sidebar {
            width: var(--sidebar-width);
            height: 100vh;
            background:#292826;
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
        
        .toggle-btn {
            background: transparent;
            border: none;
            color: var(--light);
            cursor: pointer;
            font-size: 1.2rem;
            transition: all 0.3s ease;
        }
        
        .toggle-btn:hover {
            transform: scale(1.1);
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
            background:gray;
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
            background: blue
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
        
        /* Main content area */
        .main-content {
            flex: 1;
            margin-left: var(--sidebar-width);
            padding: 30px;
            transition: all 0.3s ease;
            height: 100vh;
            overflow-y: auto;
        }
        
        .main-content.expanded {
            margin-left: var(--sidebar-collapsed);
        }
        
        /* Header */
        .header {
            background: transparent;
            padding: 10px 0;
            margin-bottom: 30px;
        }
        
        .header h1 {
            font-size: 2rem;
            font-weight: 700;
            color: var(--dark);
            margin: 0;
        }
        
        .welcome-text {
            font-size: 3rem;
            font-weight: 800;
            background: linear-gradient(90deg, var(--primary), var(--accent));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            margin-bottom: 30px;
            text-align: center;
        }
        
        /* Dashboard cards */
        .dashboard-cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 25px;
            margin-top: 30px;
        }
        
        .card {
            background-color: var(--card-bg);
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.05);
            padding: 25px;
            transition: all 0.3s ease;
            border: none;
            position: relative;
            overflow: hidden;
        }
        
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
        }
        
        .card::before {
            content: '';
            position: absolute;
            top: 0;
            right: 0;
            width: 100px;
            height: 100px;
            background: linear-gradient(135deg, var(--accent) 0%, transparent 70%);
            border-radius: 0 0 0 100px;
            opacity: 0.2;
        }
        
        .card-icon {
            width: 60px;
            height: 60px;
            border-radius: 15px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 24px;
            color: white;
            margin-bottom: 20px;
        }
        
        .card-icon.employee {
            background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
        }
        
        .card-icon.advisor {
            background: linear-gradient(135deg, #43e97b 0%, #38f9d7 100%);
        }
        
        .card-icon.loan {
            background: linear-gradient(135deg, #fa709a 0%, #fee140 100%);
        }
        
        .card h3 {
            font-size: 1.5rem;
            margin-bottom: 10px;
            color: var(--dark);
        }
        
        .card p {
            color: #6c757d;
            margin-bottom: 20px;
        }
        
        .card-buttons {
            display: flex;
            gap: 10px;
        }
        
        .card-btn {
            padding: 10px 15px;
            border-radius: 10px;
            border: none;
            font-weight: 600;
            font-size: 0.9rem;
            cursor: pointer;
            transition: all 0.3s ease;
            flex: 1;
            display: flex;
            align-items: center;
            justify-content: center;
            text-decoration: none;
        }
        
        .card-btn.primary {
            background-color: var(--primary);
            color: white;
        }
        
        .card-btn.secondary {
            background-color: #e9f0f8;
            color: var(--dark);
        }
        
        .card-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }
        
        .card-btn i {
            margin-right: 8px;
        }
        
       
        a:link{
      text-decoration: none;
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
    form{
        margin-left:300px;
 color: #aa082e;
      font-family: 'Roboto', sans-serif;

    }
    </style>
</head>
<body>
    <div class="wrapper">
        <!-- Sidebar -->
        <aside class="sidebar" id="sidebar">
            <div class="brand">
                <img src="image/2.PNG" style="height:80px; width:100px;">                
            </div>
            <div class="sidebar-menu">
                <a href="Admin_Dashboard.jsp" class="menu-item">
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
        <form action="AddRegister" method="post" enctype="multipart/form-data" >
    <div class="container register-form">
      <div class="form">
        <div class="note">
          <p >Employee Register</p>
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
                <option value="MALE">MALE</option>
                <option value="FEMALE">FEMALE</option>
            </select>            
                           <label style="color:black;">Date Of Birth</label>

            <input type="date" name="DOB" class="form-control" required>

             <input type="email" name="mail" class="form-control" placeholder="Email">
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

             <input type="email" name="username" class="form-control" placeholder="Username">
             
 <p>Upload ID Proof</p>
              <input type="file" name="image2" class="form-control" >
             <br><br>
             
            </div>
              
          </div>
          <input type="submit" class="btnSubmit" value="Register" name="sub">
        </div>
      </div>
    </div>
  </form>
        
    </div>
        
</body>
</html>