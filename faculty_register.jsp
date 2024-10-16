<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="java.sql.*, java.lang.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Faculty Registration</title>
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

    <script>
        var check = function() {
            if (document.getElementById("password").value == document.getElementById("confirm_password").value) {
                document.getElementById("message").style.color = "green";
                document.getElementById("message").innerHTML = "Password matching";
            } else {
                document.getElementById("message").style.color = "red";
                document.getElementById("message").innerHTML = "Password not matching";
            }
        }
    </script>
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

    <!-- Register -->
    <main class="login-body">
        <form class="form-default" name="myform" action="faculty_register.jsp" method="POST">
            <div class="login-form reg">
                <!-- logo-login -->
                <div class="logo-login">
                    <a href="index.jsp"><img src="assets/img/logo/loder.png" alt=""></a>
                </div>
                <h2>Register Here</h2>
                <p>*All fields are mandatory</p>

                <div class="form-input">
                    <input type="text" name="name" placeholder="Full name" required>
                </div>
                <div class="form-input">
                    <input type="text" name="username" placeholder="Username" required>
                </div>
                <div class="form-input">
                    <input name="email" placeholder="Email ID" required>
                </div>
                <div class="form-input">
                    <input type="password" id="password" name="password" placeholder="Password" required>
                </div>
                <div class="form-input">
                    <input type="password" id="confirm_password" name="confirm_password" placeholder="Confirm Password" onkeyup="check();" required>
                    <span id="message"></span>
                </div>
                <div class="form-input">
                    <input type="text" name="degree" placeholder="Degree" required>
                </div>
                <div class="form-input">
                    <input type="text" name="subject" placeholder="Specialized Subject" required>
                </div>
                <div class="form-input pt-30">
                    <input type="submit" name="submit" value="Send Request">
                </div>
                <!-- Forget Password -->
                <a href="faculty_login.jsp" class="registration">Already have an account?<b> Login here </b> </a>
            </div>

            <%
            // Getting all required fields of registration for validation
            String name = request.getParameter("name");
            String username = request.getParameter("username");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String degree = request.getParameter("degree");
            String subject = request.getParameter("subject");

            try {
                // Register the driver
                Class.forName("com.mysql.cj.jdbc.Driver");

                // Establish the connection
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","");

                // Create a SQL statement
                Statement stmt = con.createStatement();
                String sql = "INSERT INTO faculty (name, username, email_id, password, degree, subject, is_approved) VALUES('" + name + "','" + username + "','" + email + "',SHA1('" + password + "'),'" + degree + "','" + subject + "', false)"; 

                // Execute the SQL statement
                stmt.executeUpdate(sql);

                // Close the connection
                stmt.close();
                con.close();

                // Redirects to home page
                response.sendRedirect("index.jsp");
            } catch(Exception e) {
                out.println(e);
            }
            %>
        </form>
        <!-- /end login form -->
    </main>

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
