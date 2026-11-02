<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
String user = (String) session.getAttribute("user_id");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Advisor Profile</title>
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
            text-decoration:none;
            color:white;
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
            text-decoration:none;
        }
        
        .logout-btn:hover {
            background-color: #e01e79;
            transform: translateY(-2px);
        }
        
        .logout-btn i {
            margin-right: 10px;
            font-size: 1.1rem;
        }
        
        /* Main content area */
        .main-content {
            flex: 1;
            margin-left: var(--sidebar-width);
            padding: 20px;
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
            font-size: 1.8rem;
            font-weight: 700;
            color: var(--dark);
            margin: 0;
        }
        
        .welcome-text {
            font-size: 2.5rem;
            font-weight: 800;
            background: linear-gradient(90deg, var(--primary), var(--accent));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            margin-bottom: 30px;
        }
        
        /* Profile card */
        .profile-card {
            background: var(--card-bg);
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.05);
            padding: 25px;
            position: relative;
            margin-bottom: 30px;
            overflow: hidden;
            transition: all 0.3s ease;
        }
        
        .profile-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
        }
        
        .profile-card::before {
            content: '';
            position: absolute;
            top: 0;
            right: 0;
            width: 150px;
            height: 150px;
            background: linear-gradient(135deg, var(--accent) 0%, transparent 70%);
            border-radius: 0 0 0 150px;
            opacity: 0.2;
        }
        
        .profile-header {
            display: flex;
            align-items: center;
            margin-bottom: 25px;
        }
        
        .profile-image {
            width: 100px;
            height: 100px;
            border-radius: 20px;
            object-fit: cover;
            margin-right: 20px;
            border: 4px solid var(--light);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }
        
        .profile-info h2 {
            margin: 0;
            font-size: 1.8rem;
            color: var(--dark);
        }
        
        .profile-info p {
            margin: 5px 0 0;
            color: #6c757d;
            font-size: 1.1rem;
        }
        
        .profile-details {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
            margin-bottom: 25px;
        }
        
        .detail-item {
            padding: 15px;
            background: rgba(243, 246, 249, 0.7);
            border-radius: 12px;
            transition: all 0.3s ease;
        }
        
        .detail-item:hover {
            background: rgba(243, 246, 249, 1);
            transform: translateY(-3px);
        }
        
        .detail-label {
            font-size: 0.9rem;
            color: #6c757d;
            margin-bottom: 5px;
            display: block;
        }
        
        .detail-value {
            font-size: 1.1rem;
            font-weight: 600;
            color: var(--dark);
        }
        
        .change-password-btn {
            background: linear-gradient(90deg, var(--primary), var(--secondary));
            border: none;
            color: white;
            padding: 12px 25px;
            border-radius: 12px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 5px 15px rgba(67, 97, 238, 0.3);
            display: inline-flex;
            align-items: center;
        }
        
        .change-password-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 20px rgba(67, 97, 238, 0.4);
        }
        
        .change-password-btn i {
            margin-right: 10px;
        }
        
        /* Modal styling */
        .modal-content {
            border-radius: 15px;
            border: none;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }
        
        .modal-header {
            background: linear-gradient(90deg, var(--primary), var(--secondary));
            color: white;
            padding: 20px 25px;
            border: none;
        }
        
        .modal-header .modal-title {
            font-weight: 600;
            font-size: 1.3rem;
        }
        
        .modal-header .btn-close {
            background-color: white;
            opacity: 0.8;
            border-radius: 50%;
            padding: 0.5rem;
        }
        
        .modal-body {
            padding: 25px;
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        .form-group label {
            font-weight: 500;
            margin-bottom: 8px;
            display: block;
            color: var(--dark);
        }
        
        .form-control {
            border: 1px solid #e2e8f0;
            padding: 12px 15px;
            border-radius: 12px;
            transition: all 0.3s ease;
        }
        
        .form-control:focus {
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(67, 97, 238, 0.1);
        }
        
        .btn-submit {
            background: linear-gradient(90deg, var(--primary), var(--secondary));
            border: none;
            color: white;
            padding: 12px 25px;
            border-radius: 12px;
            font-weight: 600;
            width: 100%;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-top: 10px;
        }
        
        .btn-submit:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(67, 97, 238, 0.3);
        }
       
        .profile-container {
            background: white;
            padding: 20px;
            width: 400px;
            box-shadow: 0px 0px 10px gray;
            border-radius: 10px;
            text-align: center;
        }
        .profile-container img {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            border: 3px solid #007bff;
        }
        .profile-container h2 {
            margin: 10px 0;
        }
        .profile-container p {
            font-size: 14px;
            color: #555;
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
        
    </style>
</head>
<body>
    <div class="wrapper">
       <aside class="sidebar" id="sidebar">
            <div class="brand">
<img src="image/2.PNG" style="height:80px; width:100px;">                
               
            </div>
            <div class="sidebar-menu">
                 <a href="Advisor_Dashboard.jsp" class="menu-item ">
                    <i class="fas fa-user-circle"></i>
                    <span>Dashboard</span>
                </a>
                <a href="Advisor_profile.jsp" class="menu-item active">
                    <i class="fas fa-user-circle"></i>
                    <span>Profile</span>
                </a>
                
                <a href="Advisor_Employee.jsp" class="menu-item ">
                    <i class="fas fa-user"></i>
                    <span>Employee</span>
                </a>
                
                <div class="dropdown">
                    <a class="menu-item dropdown-toggle" href="#" role="button" id="loanRequestDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="fas fa-dollar-sign"></i>
                        <span>Loan Request</span>
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="loanRequestDropdown">
                        <li><a class="dropdown-item" href="Advisor_newLoan_Request.jsp">New Loan Request</a></li>
                        <li><a class="dropdown-item" href="Advsior_Existing_Rejected_loan.jsp">Rejected Loan Request</a></li>
                        <li><a class="dropdown-item" href="Advisor_Approved_loan.jsp">Approved Loan Request</a></li>

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
        <main class="main-content" id="main-content">
            <div class="container-fluid">
                <!-- Header Section -->
               

                <%
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/emp_acclaimerj","root","");
                    
                    PreparedStatement ps = con.prepareStatement("SELECT * FROM advisor_register WHERE id=?");
                    ps.setString(1, user);
                    ResultSet rs = ps.executeQuery();
                    
                    if(rs.next()) {
                        String id = rs.getString("id");
                        String name = rs.getString("name");
                        String image = rs.getString("profile");
                        String contact = rs.getString("contact");   
                        String branch= rs.getString("branch");
                        String pro= rs.getString("pro");
                        String mail = rs.getString("mail");
                        String advisor_id = rs.getString("advisorid");
                        String gender= rs.getString("gen");
                        String dob= rs.getString("birth");
                        String doj= rs.getString("doj");
                        String username= rs.getString("uname");
            
                       
                %>
                <center> <div class="profile-container">
                        <img src="Images/<%= image %>" alt="Profile Image" class="profile-image">
    <h2><%= name %></h2>
    <p><strong>Profession:</strong> <%= pro %></p>
    <p><strong>Gender:</strong> <%= gender %></p>
    <p><strong>Branch:</strong> <%= branch %></p>
    <p><strong>Date of Birth:</strong> <%= dob %></p>
    <p><strong>Email:</strong> <%= mail %></p>
    <p><strong>Contact:</strong> <%= contact %></p>
    <p><strong>Date of Joining:</strong> <%= doj %></p>
    <p><strong>Username:</strong> <%= username %></p>
                    </div></center>
                <%
                    } else {
                        out.println("<div class='alert alert-danger'>User not found. User ID: " + user + "</div>");
                    }
                    
                    con.close();
                } catch(Exception e) {
                    out.println("<div class='alert alert-danger'>Error: " + e.getMessage() + "</div>");
                    e.printStackTrace();
                }
                %>
            </div>
        </main>
    </div>

 
