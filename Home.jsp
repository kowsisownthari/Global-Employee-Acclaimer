<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Loan Hub</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <style>
                body {
                    font-family: 'Poppins', sans-serif;
                    background-color: #f8f9fa;
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
.features-section {
    padding: 50px 0;
    background: #ffffff;
}

.feature-box {
    background: #ffffff;
    padding: 40px;
    margin-bottom: 30px;
    position: relative;
    border-left: 5px solid #1e3c72;
    box-shadow: 0 5px 20px rgba(0, 0, 0, 0.05);
}

.feature-box::before {
    content: '';
    position: absolute;
    top: 0;
    left: -5px;
    width: 5px;
    height: 30%;
    background: #2a5298;
}

.feature-box::after {
    content: '';
    position: absolute;
    bottom: 0;
    left: -5px;
    width: 5px;
    height: 30%;
    background: #4a90e2;
}

.feature-icon-wrapper {
    position: relative;
    margin-bottom: 25px;
    display: inline-block;
}

.feature-icon-wrapper::before {
    content: '';
    position: absolute;
    width: 60px;
    height: 60px;
    background: rgba(30, 60, 114, 0.1);
    border-radius: 12px;
    transform: rotate(-10deg);
    z-index: 1;
}

.feature-icon {
    width: 60px;
    height: 60px;
    object-fit: contain;
    position: relative;
    z-index: 2;
    padding: 12px;
}

.feature-title {
    font-size: 24px;
    font-weight: 700;
    color: #1e3c72;
    margin-bottom: 15px;
    display: flex;
    align-items: center;
}

.feature-title::before {
    content: '';
    display: inline-block;
    width: 20px;
    height: 2px;
    background: #1e3c72;
    margin-right: 10px;
}

.feature-text {
    color: #666;
    font-size: 16px;
    line-height: 1.7;
    margin: 0;
    padding-left: 30px;
    border-left: 1px solid #eee;
}

.feature-box:hover {
    background: linear-gradient(to right, rgba(30, 60, 114, 0.02), #ffffff);
}

.feature-box:hover .feature-title::before {
    width: 30px;
    transition: width 0.3s ease;
}

.feature-box:hover .feature-icon-wrapper::before {
    transform: rotate(0deg);
    transition: transform 0.3s ease;
}
.testimonial-card {
    position: relative;
    border: none;
    border-radius: 20px;
    overflow: hidden;
    margin-bottom: -20px;
    box-shadow: 0 10px 20px rgba(0,0,0,0.1);
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.testimonial-card:hover {
    transform: translateY(-10px);
    box-shadow: 0 15px 30px rgba(0,0,0,0.15);
}

.testimonial-image {
    width: 100%;
    height: 300px;
    object-fit: cover;
}

.testimonial-overlay {
    position: absolute;
    bottom: 0;
    left: 0;
    right: 0;
    background: linear-gradient(
        to top,
        rgba(0, 0, 0, 0.9) 0%,
        rgba(0, 0, 0, 0.7) 50%,
        rgba(0, 0, 0, 0) 100%
    );
    padding: 30px 20px;
    color: white;
    transform: translateY(70px);
    transition: transform 0.3s ease;
}

.testimonial-card:hover .testimonial-overlay {
    transform: translateY(0);
}

.testimonial-name {
    font-size: 24px;
    font-weight: 600;
    margin-bottom: 10px;
    position: relative;
    padding-bottom: 10px;
}

.testimonial-name::after {
    content: '';
    position: absolute;
    bottom: 0;
    left: 0;
    width: 50px;
    height: 3px;
    background-color: #4CAF50;
}

.testimonial-text {
    font-size: 16px;
    line-height: 1.6;
    opacity: 0.9;
    margin-bottom: 0;
    display: -webkit-box;
    -webkit-line-clamp: 4;
    -webkit-box-orient: vertical;
    overflow: hidden;
}

.testimonial-rating {
    color: #FFD700;
    font-size: 20px;
    margin-bottom: 10px;
}
        
        
            .footer {
                background: #222121;
                color: #ffffff;
                padding: 10px 0;
                margin-top: 50px;
            }
            .hero-section {
                position: relative;
                height: 600px;
                overflow: hidden;
            }
            .hero-section img {
                width: 100%;
                height: 100%;
                object-fit: cover;
            }
            .hero-overlay {
                position: absolute;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                background: rgba(0, 0, 0, 0.5);
                display: flex;
                align-items: center;
                justify-content: center;
                text-align: center;
                color: #ffffff;
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
  .note {
      text-align: center;
      color: black;
      font-weight: bold;
    }
 a:link {
      text-decoration: none;
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
      <div class="note">
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
      <div class="note">
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
        
         <div class="modal fade" id="adminLoginModal" tabindex="-1" aria-labelledby="adminLoginModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    
                    <div class="modal-body">
                       <form action="Advisor_Login.jsp" method="post" >
    <div class="form">
      <div class="note">
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
        
        <div class="hero-section">
            <img src="./image/carloan1.jpg" alt="Hero Image">
            <div class="hero-overlay">
                <div class="container">
                    <h1 class="display-4 fw-bold mb-4">Your Financial Freedom Starts Here</h1>
                    <p class="lead mb-4">Experience hassle-free loans with competitive rates and exceptional service</p>
                </div>
            </div>
        </div>
<div class="features-section">
    <div class="container">
        <div class="row">
            <div class="col-lg-4">
                <div class="feature-box">
                    <div class="feature-accent"></div>
                    <div class="feature-icon-wrapper">
                        <img src="image/fast_reliable_serice.png" alt="Quick Processing" class="feature-icon">
                    </div>
                    <h3 class="feature-title">Lightning-Fast Processing</h3>
                    <p class="feature-text">
                        Experience our streamlined digital process with instant approvals and quick disbursals. 
                        Minimal paperwork, maximum efficiency for your convenience.
                    </p>
                </div>
            </div>

            <div class="col-lg-4">
                <div class="feature-box">
                    <div class="feature-accent"></div>
                    <div class="feature-icon-wrapper">
                        <img src="image/transparent_terms.png" alt="Transparent Terms" class="feature-icon">
                    </div>
                    <h3 class="feature-title">Crystal Clear Terms</h3>
                    <p class="feature-text">
                        We believe in complete transparency with no hidden charges. 
                        Our terms are straightforward and designed with your best interests in mind.
                    </p>
                </div>
            </div>

            <div class="col-lg-4">
                <div class="feature-box">
                    <div class="feature-accent"></div>
                    <div class="feature-icon-wrapper">
                        <img src="image/easy_renewal.png" alt="Smart Benefits" class="feature-icon">
                    </div>
                    <h3 class="feature-title">Smart Benefits</h3>
                    <p class="feature-text">
                        Enjoy exclusive rewards, early repayment benefits, and special rates. 
                        Track your loan journey easily through our intuitive mobile app.
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>
      <div class="container mt-5">
    <div class="row">
        <div class="col-lg-4 col-md-6">
            <div class="testimonial-card">
                <img src="./image/360_F_302884605_actpipOdPOQHDTnFtp4zg4RtlWzhOASp.jpg" 
                     class="testimonial-image" alt="Michael">
                <div class="testimonial-overlay">
                    <div class="testimonial-rating">
                        ★★★★★
                    </div>
                    <h4 class="testimonial-name">Michael Chen</h4>
                    <p class="testimonial-text">
                        "The loan process was incredibly smooth and efficient. The team at FinanceEase provided exceptional 
                        support throughout my journey. Their digital platform made everything convenient, and the quick 
                        approval process exceeded my expectations."
                    </p>
                </div>
            </div>
        </div>
        
        <div class="col-lg-4 col-md-6">
            <div class="testimonial-card">
                <img src="./image/istockphoto-1262283010-612x612.jpg" 
                     class="testimonial-image" alt="Sarah">
                <div class="testimonial-overlay">
                    <div class="testimonial-rating">
                        ★★★★★
                    </div>
                    <h4 class="testimonial-name">Sarah Williams</h4>
                    <p class="testimonial-text">
                        "What impressed me most was the transparency and professional guidance. The team was always 
                        available to answer my questions, and their competitive rates made a significant difference. 
                        I couldn't be happier with my choice."
                    </p>
                </div>
            </div>
        </div>
        
        <div class="col-lg-4 col-md-6">
            <div class="testimonial-card">
                <img src="./image/istockphoto-1369101429-612x612.jpg" 
                     class="testimonial-image" alt="David">
                <div class="testimonial-overlay">
                    <div class="testimonial-rating">
                        ★★★★★
                    </div>
                    <h4 class="testimonial-name">David Thompson</h4>
                    <p class="testimonial-text">
                        "FinanceEase made my home loan journey seamless. Their quick processing and flexible terms 
                        helped me achieve my dream home faster than I expected. The customer service team was 
                        exceptional throughout the process."
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>
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
