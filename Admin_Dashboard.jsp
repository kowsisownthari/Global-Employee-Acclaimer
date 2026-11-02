<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
    int employee_count = 0;
    int advisor_count = 0;
    int loan_count = 0;
    
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/emp_acclaimerj", "root", "");
        
        // Get advisor count
        String AdvisorQuery = "SELECT COUNT(*) AS total FROM advisor_register";
        Statement adStmt = con.createStatement();
        ResultSet adRs = adStmt.executeQuery(AdvisorQuery);
        if(adRs.next()) {
            advisor_count = adRs.getInt("total");
        }
        
        // Get employee count
        String employeeQuery = "SELECT COUNT(*) AS total FROM employee_register";
        Statement empStmt = con.createStatement();
        ResultSet empRs = empStmt.executeQuery(employeeQuery);
        if(empRs.next()) {
            employee_count = empRs.getInt("total");
        }
        
        // Get loan count
        String loanQuery = "SELECT COUNT(*) AS total FROM loan_application";
        Statement loanStmt = con.createStatement();
        ResultSet loanRs = loanStmt.executeQuery(loanQuery);
        if(loanRs.next()) {
            loan_count = loanRs.getInt("total");
        }
        
        // Close connections
        adRs.close();
        empRs.close();
        loanRs.close();
        adStmt.close();
        empStmt.close();
        loanStmt.close();
        con.close();
    } catch (Exception e) {
        out.println("<div class='alert alert-danger'>Error: " + e.getMessage() + "</div>");
        e.printStackTrace(); // This will print the full error stack trace to your server logs
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
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
            background: #292826;
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
            background: gray;
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
            font-size: 1.5rem;
            font-weight: 800;
            background: black;
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            margin-bottom: 30px;
            text-align: center;
        }
        
        /* Dashboard cards */
        .dashboard-cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
            gap: 25px;
            margin-top: 30px;
            height:300px;
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
            text-align: center;
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
            width: 80px;
            height: 80px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 32px;
            color: white;
            margin: 0 auto 20px;
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
        
        .count-number {
            font-size: 2.5rem;
            font-weight: 700;
            color: var(--dark);
            margin: 10px 0;
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
        
        .card-footer {
            margin-top: 20px;
            padding-top: 15px;
            border-top: 1px solid #f0f0f0;
        }
        
        .view-details {
            color: var(--primary);
            font-weight: 600;
            text-decoration: none;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: all 0.3s ease;
        }
        
        .view-details:hover {
            color: var(--secondary);
        }
        
        .view-details i {
            margin-left: 5px;
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
                <a href="Admin_Dashboard.jsp" class="menu-item active">
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

        <main class="main-content" id="main-content">
            <div class="container-fluid">
                <header class="header">
                    <h1>Admin Dashboard</h1>
                </header>
                <h1 class="welcome-text">Welcome, Admin!</h1>
                
                               <div class="dashboard-cards">
                    <div class="card">
                        <div class="card-icon employee">
                            <i class="fas fa-users"></i>
                        </div>
                        <h3>Total Employee</h3>
                        <div class="count-number"><%=employee_count%></div>
                       
                    </div>
                                        <div class="card">
                        <div class="card-icon advisor">
                            <i class="fas fa-briefcase"></i>
                        </div>
                        <h3>Financial Advisors</h3>
                        <div class="count-number"><%=advisor_count%></div>
                       
                    </div>
                                        <div class="card">
                        <div class="card-icon loan">
                            <i class="fas fa-dollar-sign"></i>
                        </div>
                        <h3>Loan Requests</h3>
                        <div class="count-number"><%=loan_count%></div>
                        
                    </div>
                </div>
            </div>
        </main>
    </div>

</body>
</html>