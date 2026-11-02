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
    <title>Advisor Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
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
        .main-content {
            margin-left: 400px;
       
        }
        
        .main-content.expanded {
            margin-left: calc(var(--sidebar-collapsed) + 10px);
        }
      
        /* UPDATED CENTER CONTENT STYLES */
        .header {
            border-radius: 15px;
            padding: 20px;
            margin-bottom: 40px;
            text-align: center;
        }
        
        .header h2 {
            color: black;
            font-size:30px;
            margin-bottom: 10px;
        }
        
        .header h1 {
            color: black;
            font-size:20px;
            margin-bottom: 0;
            border-bottom: none;
        }
        
        .profile-card {
            background-color: white;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
            text-align: center;
            transition: transform 0.3s ease;
        }
        
        .profile-card:hover {
            transform: translateY(-5px);
        }
        
        .profile-image {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            object-fit: cover;
            border: 5px solid black;
            margin: 0 auto 20px;
            display: block;
        }
        
        .profile-info {
            margin-bottom: 30px;
        }
        
        .profile-info h3 {
            color: var(--dark);
            font-weight: 600;
            margin-bottom: 5px;
        }
        
        .profile-info p {
            color: black;
            font-weight: 500;
            font-size: 1.1rem;
            margin-bottom: 15px;
        }
        
        .profile-info .info-item {
            justify-content: space-between;
            padding: 10px 0;
            border-bottom: 1px solid #f0f0f0;
        }
        
        .profile-info .info-label {
            font-weight: 600;
            color:black;
        }
        
        .profile-info .info-value {
            font-weight: 500;
            color: var(--dark);
        }
    </style>
</head>
<body>
    <div class="wrapper">
<!--         SIDEBAR - UNCHANGED -->
        <aside class="sidebar" id="sidebar">
            <div class="brand">
<img src="image/2.PNG" style="height:80px; width:100px;">                
               
            </div>
            <div class="sidebar-menu">
                 <a href="Advisor_Dashboard.jsp" class="menu-item active">
                    <i class="fas fa-user-circle"></i>
                    <span>Dashboard</span>
                </a>
                <a href="Advisor_profile.jsp" class="menu-item ">
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
                        String pro = rs.getString("pro");
                        String advisor_id = rs.getString("advisorid");
            
                         session.setAttribute("user_id", id);
                        session.setAttribute("name",name);
                %>
        <!-- MAIN CmainONTENT - REDESIGNED -->
        <div class="main-content" id="main-content">
            <div class="header">
                <h2>Financial Advisor Dashboard</h2>
                <h1>Welcome, <%= name %></h1>
            </div>
            
                <div class="profile-card">
                        <img src="Images/<%= image %>" alt="Profile Image" class="profile-image">
                    
                    <div class="profile-info">
                        <div class="info-item">
                            <span class="info-label">ID:</span>
                            <span class="info-value"><%=advisor_id%></span>
                        </div>
                        <div class="info-item">
                            <span class="info-label">Name:</span>
                            <span class="info-value"><%= name %></span>
                        </div>
                        <div class="info-item">
                            <span class="info-label">Role:</span>
                            <span class="info-value"><%= pro %></span>
                        </div>
                        
                    </div>
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
            </div>
        </div>
    

   
</body>
</html>