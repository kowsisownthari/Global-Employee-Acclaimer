<%@page contentType="text/html" pageEncoding="UTF-8"%>'
<%
String user = (String) session.getAttribute("user_id");
String uname=(String) session.getAttribute("name");
String contact = (String) session.getAttribute("Contact");
String dpt = (String) session.getAttribute("dpt");
String mail = (String) session.getAttribute("mail");
String Emp_id = (String) session.getAttribute("Emp_id");
String gender = (String) session.getAttribute("gender");%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Loan Application Form</title>
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
        
        
        .form-container {
            margin: 25px auto;
            padding: 30px;
            border-radius: 16px;
            background-color: var(--card-bg);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            margin-left: calc(var(--sidebar-width) + 100px);
            transition: all 0.3s ease;
            height:900px;
        }
        
        .sidebar.collapsed + .form-container {
            margin-left: calc(var(--sidebar-collapsed) + 20px);
        }
        
        .form-container h5 {
            font-size: 1.5rem;
            font-weight: 700;
            margin-bottom: 20px;
            color: var(--primary);
            border-bottom: 2px solid var(--primary);
            padding-bottom: 10px;
        }
        
        .form-container h6 {
            font-size: 1.1rem;
            font-weight: 600;
            margin-top: 20px;
            margin-bottom: 15px;
            color: var(--secondary);
        }
        
        .form-container p {
            font-size: 0.95rem;
            color: var(--dark);
            margin-top: 15px;
            margin-bottom: 10px;
            font-weight: 500;
        }
        
        .form-container input, 
        .form-container select {
            padding: 12px 15px;
            font-size: 0.95rem;
            width: 100%;
            margin-bottom: 15px;
            border-radius: 12px;
            border: 1px solid #e0e0e0;
            transition: all 0.3s ease;
            background-color: #f8f9fa;
        }
        
        .form-container input:focus, 
        .form-container select:focus {
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(67, 97, 238, 0.15);
            outline: none;
        }
        
        .form-container input[type="file"] {
            padding: 10px;
            background-color: #f8f9fa;
        }
        
        .form-container label {
            font-size: 0.95rem;
            font-weight: 500;
            color: var(--dark);
            margin-bottom: 8px;
            display: block;
        }
        
        .form-container .form-row {
            display: flex;
            justify-content: space-between;
            gap: 15px;
            margin-bottom: 5px;
        }
        
        .form-container .form-row input,
        .form-container .form-row select {
            width: calc(50% - 7.5px);
        }
        
        .form-container .small-button {
            background: linear-gradient(135deg, var(--primary) 0%, var(--secondary) 100%);
            color: white;
            border: none;
            padding: 14px 20px;
            font-size: 1rem;
            border-radius: 12px;
            cursor: pointer;
            width: 200px;
            font-weight: 600;
            transition: all 0.3s ease;
            margin-top: 15px;
            box-shadow: 0 4px 10px rgba(67, 97, 238, 0.3);
        }
          .big-button {
            background: red !important;
            color: white;
            border: none;
            padding: 14px 20px;
            font-size: 1rem;
            border-radius: 12px;
            cursor: pointer;
            width: 200px;
            font-weight: 600;
            transition: all 0.3s ease;
            margin-top: 15px;
            box-shadow: 0 4px 10px rgba(67, 97, 238, 0.3);
        }
        
        .form-container .small-button:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 15px rgba(67, 97, 238, 0.4);
        }
         .form-container .big-button:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 15px rgba(67, 97, 238, 0.4);
        }
        
        .form-container .file-upload-container {
            position: relative;
            margin-bottom: 15px;
        }
        
        .form-container .file-upload-container i {
            color: var(--primary);
            margin-right: 8px;
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
                <a href="Employee_Dashboard.jsp" class="menu-item active">
                    <i class="fa fa-tachometer"></i>
                    <span>Dashboard</span>
                </a>
                <a href="Employee_profile.jsp" class="menu-item ">
                    <i class="fas fa-user-circle"></i>
                    <span>Profile</span>
                </a>
                <a href="Employee_new_loan.jsp" class="menu-item">
                    <i class="fas fa-file-invoice-dollar"></i>
                    <span>New Loan</span>
                </a>
                
                <div class="dropdown">
                    <a class="menu-item dropdown-toggle" href="#" role="button" id="employeeDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="fas fa-history"></i>
                        <span>Existing Loan</span>
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="employeeDropdown">
                        <li><a class="dropdown-item " href="Employee_Existing_loan.jsp" >New loan</a></li>
                        <li><a class="dropdown-item" href="Employee_Approved_loan.jsp">Accepted Loan</a></li>
                         <li><a class="dropdown-item" href="Employee_Rejected_loan.jsp">Rejected Loan</a></li>

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


        <form action="Emp_loan_Application" class="form-container" method="post" enctype="multipart/form-data">
            <h5><i class="fas fa-file-invoice-dollar"></i> Loan Application</h5>
            <div class="form-row">
                <input type="hidden"  value="<%=user %>" name="user_id">
                 <input type="hidden"  value="<%=uname %>" name="user_name">
                 <input type="hidden"  value="<%=contact %>" name="contact">
                 <input type="hidden"  value="<%=dpt %>" name="dpt">
                 <input type="hidden"  value="<%=mail %>" name="mail">
                  <input type="hidden"  value="<%= Emp_id %>" name="Emp_id">
                 <input type="hidden" value="<%=gender %>" name="gender">
                <select name="loan_type" required>
                    <option value="">Select a loan type</option>
                    <option value="Family Purpose Loan">Family Purpose Loan</option>
                    <option value="Marriage Loan">Marriage Loan</option>
                    <option value="Vehicle Loan">Vehicle Loan</option>
                    <option value="Education Loan">Education Loan</option>
                </select>
                <input type="number" name="amount" min="1000" placeholder="Loan Amount" required>
            </div>
            <div class="form-row">
                <select name="tenure" required>
                    <option value="">Select Preferred Loan Tenure</option>
                    <option value="12 Months">12 Months</option>
                    <option value="13 Months">13 Months</option>
                    <option value="14 Months">14 Months</option>
                    <option value="15 Months">15 Months</option>
                    <option value="16 Months">16 Months</option>
                    <option value="17 Months">17 Months</option>
                    <option value="18 Months">18 Months</option>
                    <option value="19 Months">19 Months</option>
                    <option value="20 Months">20 Months</option>
                </select>
                <select name="repayment_amount" required>
                    <option value="">Select Repayment Amount</option>
                    <option value="2,000">2,000</option>
                    <option value="3,000">3,000</option>
                    <option value="4,000">4,000</option>
                    <option value="5,000">5,000</option>
                    <option value="6,000">6,000</option>
                    <option value="7,000">7,000</option>
                    <option value="8,000">8,000</option>
                    <option value="9,000">9,000</option>
                    <option value="10,000">10,000</option>
                </select>
            </div>
            <p><i class="far fa-calendar-alt"></i> Select Required date:</p>
            <div class="form-row">
                <input type="date" id="inputDate" name="requiredDate" required>
                <input type="text" name="bank_name" placeholder="Enter Bank Name" required>
            </div>
            <div class="form-row">
                <input type="text" name="acc_number" placeholder="Enter Account Number" required>
                <input type="text" name="bank_branch" placeholder="Enter Branch Name" required>
            </div>
                        <div class="form-row">

            <div class="file-upload-container">
                <label for="bank_statement"><i class="fas fa-file-upload"></i> Upload Last 3 Month Bank Statement:</label>
                <input type="file" class="form-control custom-file-upload" id="bank_statemen" name="bank_statement" multiple>
            </div>
                <div class="file-upload-container">

                <label for="aadhar_card"><i class="fas fa-id-card"></i> Upload Aadhar Card:</label>
                <input type="file" class="form-control custom-file-upload" id="aadhar_card" name="aadhar_card" multiple>
            </div>
                        </div>
            
            
            <div class="file-upload-container">
                <label for="pan_card"><i class="fas fa-credit-card"></i> Upload PAN:</label>
                <input type="file" class="form-control custom-file-upload" id="pan_card" name="pan_card" multiple>
            </div>
            
            <h6><i class="fas fa-history"></i> Any Other Previous Loan (If Yes Fill The Below Details):</h6>
            <div class="form-row">
                <input type="number" name="prev_loan_amount" placeholder="Enter Loan Amount">
                <input type="number" id="monthly_emi" name="monthly_emi" placeholder="Monthly EMI">
            </div>
            
            <p><i class="far fa-calendar-check"></i> Previous Loan Closing date</p>
             <div class="form-row">
                <input type="date" name="closing_date" placeholder="Enter Loan Amount">
            </div>
            <div class="form-row">
                <input type="submit" class="small-button" name="sub" >
                 <input type="button" name="sub" class="big-button" value="Cancel">
            </div>
        </form>
    </div>
</body>
</html>