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
        <title>Admin Existing Employee</title>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
       <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
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
                font-family: 'Poppins', sans-serif;
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
             .table {
                background-color: white;
                border-radius: 10px;
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
                margin-top: 20px;
                margin-left:250px;
                width: 900px;
            }

            .table th {
                background-color: #292826;
                color: white;
                font-weight: 600;
                border-bottom: none;
            }

            .table tr:hover {
                background-color: rgba(67, 97, 238, 0.05);
            }

            .modal-content {
                background-color: #f5f5f5;
                color: black;
                border-radius: 15px;
                overflow: hidden;
            }

            .modal-header {
                border-bottom: 2px solid teal;
                background-color: gray;
                color: white;
            }
           
            .modal-title {
                color: white;
            }

            .details-label {
                font-weight: bold;
                color: black;
            }
            
            .product-image {
                margin: 10px auto;
                display: block;
                border: 10px;
            }
            
            .btn {
                background-color: gray;
                color: white;
            }
            
            .btn:hover {
                background-color: white;
                border-color: black;
                color: black;
            }
            h1 {
                color: var(--primary);
                margin-bottom: 20px;
                padding-bottom: 10px;
                border-bottom: 2px solid var(--primary);
                font-size:25px;
            }
            
            h4 {
                color: black;
                margin-bottom: 20px;
                padding-bottom: 10px;
                border-bottom: 2px solid black;
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

        <div class="container">
            <table class="table">
                <h4 align="center">Advisor Details</h4>
                <tr>
                    <th>S.No</th>
                    <th>ID</th>
                    <th>NAME</th>
                    <th>Contact No</th>
                    <th>Email</th>
                    <th>Department</th>
                    <th>Action</th>
                </tr>
                <%
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/emp_acclaimerj","root","");
                    Statement st = con.createStatement();
                    ResultSet rs=st.executeQuery("select * from advisor_register");
                    int serialNo = 1;
                    while(rs.next()) {
                        String advisor_id = rs.getString(1);
                        String Name = rs.getString(2);
                        String Contact = rs.getString(5);
                        String Email = rs.getString(4);
                        String DOB = rs.getString(6);
                        String DOJ = rs.getString(7);
                        String Street = rs.getString(8);
                        String City = rs.getString(9);
                        String State = rs.getString(10);
                        String Country = rs.getString(11);
                        String Education = rs.getString(12);
                        String Profession = rs.getString(13);
                        String Gender = rs.getString(14);
                        String Experience = rs.getString(15);
                        String profile = rs.getString(19);
                        String proof = rs.getString(19);
                        
                        
                        out.print("<tr><td>" + serialNo + "</td>"
                                + "<td>"+advisor_id+"</td>"
                                + "<td>"+Name+"</td>"
                                + "<td>"+Contact+"</td>"
                                + "<td>"+Email+"</td>"
                                + "<td>"+Profession+"</td>"
                                + "<td><button type='button' class='btn' data-bs-toggle='modal' data-bs-target='#productModal"+advisor_id+"'>View Details</button></td></tr>");
                       out.print("<div class='modal fade' id='productModal"+advisor_id+"' tabindex='-1' aria-labelledby='productModalLabel"+advisor_id+"' aria-hidden='true'>"
        + "<div class='modal-dialog '>"
        + "<div class='modal-content' style='font-family: \"Poppins\", sans-serif;'>"
        + "<div class='modal-header'>"
        + "<h5 class='modal-title' id='productModalLabel"+advisor_id+"'>Advisor Details</h5>"
        + "<button type='button' class='btn-close' data-bs-dismiss='modal' aria-label='Close'></button>"
        + "</div>"
        + "<div class='modal-body'>"
        + "<div class='row'>"
        + "<div class='col-md-6'>"
                              
                                + "<p><span class='details-label'>Advisor ID:</span> "+advisor_id+"</p>"
                                + "<p><span class='details-label'>Name:</span> "+Name+"</p>"
                                + "<p><span class='details-label'>Date of Birth:</span> "+DOB+"</p>"
                                + "<p><span class='details-label'>Street:</span> "+Street+"</p>"
                                + "<p><span class='details-label'>City:</span> "+City+"</p>"
                                    + "<p><span class='details-label'>State:</span> "+State+"</p>"
                                + "<p><span class='details-label'>Country:</span> "+Country+"</p>"
                                         + "<p><span class='details-label'>Education:</span> "+Education+"</p>"
                                    + "<p><span class='details-label'>Profession:</span> "+Profession+"</p>"
                                + "<p><span class='details-label'>Gender:</span> "+Gender+"</p>"
                                         + "<p><span class='details-label'>Experience:</span> "+Experience+"</p>"
                                + "</div>"
                                + "<div class='col-md-6'>"
                                + "<img src='./Images/"+profile+"' class='img-responsive img-circle product-image' style='height: 150px; width: 150px;'>"
                                + "</div>"
                                + "</div>"
                                + "</div>"
                                + "<div class='modal-footer'>"
                                + "</div>"
                                + "</div>"
                                + "</div>"
                                + "</div>");
                        serialNo++;
                    }
                    con.close();
                %>
            </table>
        </div>
    </body>
</html>