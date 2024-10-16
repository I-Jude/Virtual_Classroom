<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Virtual Classroom</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="manifest" href="site.webmanifest">
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

    <!-- CSS here -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/owl.carousel.min.css">
    <link rel="stylesheet" href="assets/css/slicknav.css">
    <link rel="stylesheet" href="assets/css/flaticon.css">
    <link rel="stylesheet" href="assets/css/progressbar_barfiller.css">
    <link rel="stylesheet" href="assets/css/gijgo.css">
    <link rel="stylesheet" href="assets/css/animate.min.css">
    <link rel="stylesheet" href="assets/css/animated-headline.css">
    <link rel="stylesheet" href="assets/css/magnific-popup.css">
    <link rel="stylesheet" href="assets/css/fontawesome-all.min.css">
    <link rel="stylesheet" href="assets/css/themify-icons.css">
    <link rel="stylesheet" href="assets/css/slick.css">
    <link rel="stylesheet" href="assets/css/nice-select.css">
    <link rel="stylesheet" href="assets/css/style.css">

</head>

<body>
    <!-- Preloader Start -->
    <div id="preloader-active">
        <div class="preloader d-flex align-items-center justify-content-center">
            <div class="preloader-inner position-relative">
                <div class="preloader-circle"></div>
                <div class="preloader-img pere-text">
                    <img src="assets/img/logo/loder.png" alt="">
                </div>
            </div>
        </div>
    </div>
    <!-- Preloader End -->

    <header>
        <!-- Header Start -->
        <div class="header-area header-transparent">
            <div class="main-header ">
                <div class="header-bottom  header-sticky">
                    <div class="container-fluid">
                        <div class="row align-items-center">
                            <!-- Logo -->
                            <div class="col-xl-2 col-lg-2">
                                <div class="logo">
                                    <a href="index.jsp"><img src="assets/img/logo/logo.png" alt=""></a>
                                </div>
                            </div>
                            <div class="col-xl-10 col-lg-10">
                                <div class="menu-wrapper d-flex align-items-center justify-content-end">
                                    <!-- Main-menu -->
                                    <div class="main-menu d-none d-lg-block">
                                        <nav>
                                            <ul id="navigation">
                                                <li class="active"><a href="admin_dashboard.jsp"> Home </a></li>
                                                <li><a href="#">Student</a>
                                                    <ul class="submenu">
                                                        <li><a href="">Manage</a></li>
                                                        <li><a href="admin_student_requests.jsp"> Requests </a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="#">Faculty</a>
                                                    <ul class="submenu">
                                                        <li><a href="">Manage</a></li>
                                                        <li><a href="admin_faculty_requests.jsp"> Requests </a></li>
                                                    </ul>
                                                </li>
                                                <!-- Button -->
                                                <li class="button-header"><a href="admin_logout.jsp" class="btn btn3"> Log Out </a></li>
                                            </ul>
                                        </nav>
                                    </div>
                                </div>
                            </div>
                            <!-- Mobile Menu -->
                            <div class="col-12">
                                <div class="mobile_menu d-block d-lg-none"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Header End -->
    </header>

    <main>
        <!-- Slider Area Start -->
        <section class="slider-area ">
            <div class="slider-active">
                <!-- Single Slider -->
                <div class="single-slider slider-height d-flex align-items-center">
                    <div class="container">
                        <div class="row">
                            <div class="col-xl-6 col-lg-7 col-md-12">
                                <div class="hero__caption">
                                    <h1 data-animation="fadeInLeft" data-delay="0.2s">Faculty<br>Requests</h1>
                                    <p data-animation="fadeInLeft" data-delay="0.4s">Accept or Decline Faculty Registration Requests.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>

    <main class="main2">
        <section>
            <h3 class="mb-30">Faculty Requests</h3>
            <form action="admin_faculty_requests_action.jsp" method="POST">
                <div class="progress-table">
                    <div class="table-head1">
                        <div class="name1">Name</div>
                        <div class="name1">Degree</div>
                        <div class="name1">Subject</div>
                        <div class="accept1">Action</div>
                    </div>
    
                    <%
                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "");
                            Statement stmt = con.createStatement();
                            String sql = "SELECT name, degree, subject FROM faculty WHERE is_approved = 0";
                            ResultSet rs = stmt.executeQuery(sql);
    
                            if (!rs.isBeforeFirst()) {
                    %>
                                <div class="table-row1">
                                    <div class="name1">No pending requests.</div>
                                </div>
                    <%
                            } else {
                                while (rs.next()) {
                    %>            
                                    <div class="table-row1">
                                        <div class="name1"><%= rs.getString("name") %></div>
                                        <div class="name1"><%= rs.getString("degree") %></div>
                                        <div class="name1"><%= rs.getString("subject") %></div>
                                        <div class="accept1">
                                            <input type="radio" name="decision_<%= rs.getString("subject") %>" value="accept_<%= rs.getString("subject") %>"> Accept
                                            <input type="radio" style="margin-left: 10px;" name="decision_<%= rs.getString("subject") %>" value="decline_<%= rs.getString("subject") %>"> Decline
                                        </div>
                                    </div>
                    <%
                                }
                            }
                            rs.close();
                            stmt.close();
                            con.close();
                        } catch (Exception e) {
                            out.println(e);
                        }
                    %>
                </div>
                <input type="submit" value="Submit">
            </form>
        </section>
    </main>
    
    <style>

.main2 section {
    background-color: #4854a4;
    padding: 40px 20px;
    color: white;
    max-width: 100%;
    /* margin: 30px auto; */
}

.main2 section h3 {
    text-align: center;
    font-size: 32px;
    margin-bottom: 40px;
    color: white;
}

.progress-table {
    width: 100%;
    background-color: #ffffff;
    border-radius: 8px;
    border-collapse: collapse; /* Collapse table borders for more structure */
    overflow: hidden;
    display: table; /* Ensures a proper table layout */
}

.table-head1, .table-row1 {
    display: table-row; /* Sets the rows in table layout */
    background-color: #4e5bc2;
    color: white;
    font-weight: bold;
    text-align: left;
}

.table-row1 {
    background-color: #f9f9f9; /* Alternate light background for rows */
}

.table-row1:nth-child(even) {
    background-color: #ececec; /* Alternating row color */
}

.name1, .accept1 {
    display: table-cell;
    padding: 15px;
    border: 1px solid #ddd; /* Adds borders to table cells for clarity */
    color: #333333; /* Text color for row content */
}

.table-head1 .name1, .table-head1 .accept1 {
    background-color: #4e5bc2; /* Darker header background for visibility */
    color: white;
    font-weight: bold;
    padding: 15px;
}

.accept1 {
    text-align: center; /* Center the action buttons */
}

/* Styling for radio buttons */
input[type="radio"] {
    margin-right: 10px;
    cursor: pointer;
}

input[type="submit"] {
    display: block;
    margin: 30px auto;
    padding: 12px 40px;
    background-color: #ffffff;
    color: #4854a4;
    border: none;
    border-radius: 5px;
    font-size: 18px;
    font-weight: bold;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

input[type="submit"]:hover {
    background-color: #d1d1d1;
}
</style>
<footer>
    <div class="footer-wrappper footer-bg">
        <!-- Footer Start-->
        <div class="footer-area footer-padding">
            <div class="container">
                <div class="row justify-content-between">
                    <div class="col-xl-4 col-lg-5 col-md-4 col-sm-6">
                        <div class="single-footer-caption mb-50">
                            <div class="single-footer-caption mb-30">
                                <!-- logo -->
                                <div class="footer-logo mb-25">
                                    <a href="index.jsp"><img src="assets/img/logo/logo2_footer.png" alt=""></a>
                                </div>
                                <div class="footer-tittle">
                                    <div class="footer-pera">
                                        <p>The automated process starts here.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- footer-bottom area -->
                    <div class="footer-bottom-area">
                        <div class="container">
                            <div class="footer-border">
                                <div class="row d-flex align-items-center">
                                    <div class="col-xl-12 ">
                                        <div class="footer-copy-right text-center">
                                            <p>
                                                Copyright &copy;
                                                <script>
                                                    document.write(new Date().getFullYear());
                                                </script> All rights reserved
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Footer End-->
                </div>
</footer>

    <script src="./assets/js/vendor/modernizr-3.5.0.min.js"></script>
    <!-- Jquery, Popper, Bootstrap -->
    <script src="./assets/js/vendor/jquery-1.12.4.min.js"></script>
    <script src="./assets/js/popper.min.js"></script>
    <script src="./assets/js/bootstrap.min.js"></script>
    <!-- Jquery Plugins, main Jquery -->
    <script src="./assets/js/plugins.js"></script>
    <script src="./assets/js/main.js"></script>

</body>
</html>
