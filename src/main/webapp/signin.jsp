<%@page import="RegisterModel.*"%>
<%@page import="paymentProject.Cart" %>
<%@page import="java.util.*"%>

<%
	UserBean auth = (UserBean) request.getSession().getAttribute("auth");
	if (auth != null) {
		
		request.setAttribute("auth", auth);
	}
	ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
	if (cart_list != null) {
		request.setAttribute("cart_list", cart_list);
	}
%>
<%
	AdminBean aut = (AdminBean) request.getSession().getAttribute("aut");
	if (aut != null) {
		response.sendRedirect("admin.jsp");
		
	}
	ArrayList ad_list = (ArrayList) session.getAttribute("ad-list");
	if (cart_list != null) {
		request.setAttribute("ad_list", ad_list);
	}
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Login page</title>

<!-- Font Icon -->
<link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet" href="css/style3.css">
<!-- SweetAlert CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css">

<style>
    .form-group {
        position: relative;
    }
    .toggle-password {
        position: absolute;
        right: 10px;
        top: 50%;
        transform: translateY(-50%);
        cursor: pointer;
    }
    .modal {
        display: none;
        position: fixed;
        z-index: 1;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        overflow: auto;
        background-color: rgb(0,0,0);
        background-color: rgba(0,0,0,0.4);
        padding-top: 60px;
    }
    .modal-content {
        background-color: #fefefe;
        margin: 5% auto;
        padding: 20px;
        border: 1px solid #888;
        width: 80%;
        max-width: 500px;
        position: relative;
        text-align: center; /* Center the text */
    }
    .close {
        color: #aaa;
        float: right;
        font-size: 28px;
        font-weight: bold;
    }
    .close:hover,
    .close:focus {
        color: black;
        text-decoration: none;
        cursor: pointer;
    }
    .form-title-center {
        text-align: center; /* Center the title */
    }
    .form-button-center {
        display: flex;
        justify-content: center; /* Center the button */
    }
    .password-hint {
        font-size: 0.9em;
        color: #999;
        margin-top: 5px;
        display: none; /* Initially hidden */
    }
</style>
</head>
<body>

    <div class="main">

        <!-- Sign in Form -->
        <section class="sign-in">
            <div class="container">
                <div class="signin-content">
                
                    <div class="signin-image">
                        <figure>
                            <img src="images/logoshop.png" alt="logoshop image">
                        </figure>
                        <a href="signup.jsp" class="signup-image-link">Create an account</a>
                    </div>

                    <div class="signin-form">
                        <h2 class="form-title">Sign in</h2>
                        <form method="post" action="SignInServlet1" class="register-form" id="login-form">
                        
                            <div class="form-group">
                                <label for="username">
                                <i class="zmdi zmdi-account material-icons-name"></i>
                                </label> 
                                <input type="text" name="username" id="username" placeholder="Username" required="required" />
                            </div>
                            
                            <div class="form-group">
                                <label for="password">
                                <i class="zmdi zmdi-lock"></i>
                                </label> 
                                <input type="password" name="password" id="password" placeholder="Password" required="required" />
                                <i class="zmdi zmdi-eye-off toggle-password" onclick="togglePassword('password', this)"></i>
                            </div>
                            
                            <div class="form-group">
                                <input type="checkbox" name="remember-me" id="remember-me" class="agree-term" /> 
                                <label for="remember-me" class="label-agree-term">
                                <span><span></span></span>Remember me</label>
                            </div>

                            <div class="form-group">
                                <a href="forgotPassword.jsp" id="forgot-password-link">Forgot Password?</a>
                            </div>
                            
                            <div class="form-group form-button">
                                <input type="submit" name="signin" id="signin" class="form-submit" value="Log in" />
                                <input type="reset" name="reset" id="reset" class="form-submit" value="Reset" />
                            </div>
                            
                        </form>
                        
                    </div>
                </div>
            </div>
        </section>

        
    </div>

    <!-- JS -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="js/main.js"></script>
    <!-- SweetAlert JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>

    <script type="text/javascript">
    document.getElementById("reset-password-form").addEventListener("submit", function(event) {
        var newPassword = document.getElementById("new-password").value;
        var confirmNewPassword = document.getElementById("confirm-password").value;

        var passCriteria = /^(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,10}$/;

        if (!passCriteria.test(newPassword)) {
            event.preventDefault();
            alert("Password must be 8-10 characters long, contain at least one uppercase letter, one number, and one special character.");
            return;
        }

        if (newPassword != confirmNewPassword) {
            event.preventDefault();
            alert("Passwords do not match");
        } else {
            event.preventDefault(); // Prevent the form from submitting for demonstration purposes
            swal({
                title: "Success!",
                text: "Your password has been changed.",
                type: "success"
            });
            document.getElementById("reset-password-modal").style.display = "none";
        }
    });

    function togglePassword(fieldId, icon) {
        var field = document.getElementById(fieldId);
        if (field.type == "password") {
            field.type = "text";
            icon.classList.remove("zmdi-eye-off");
            icon.classList.add('zmdi-eye');
        } else {
            field.type = "password";
            icon.classList.remove("zmdi-eye");
            icon.classList.add("zmdi-eye-off");
        }
    }

    function showHint(hintId) {
        document.getElementById(hintId).style.display = "block";
    }

    function hideHint(hintId) {
        document.getElementById(hintId).style.display = "none";
    }

    // Get the modals
    var forgotPasswordModal = document.getElementById("forgot-password-modal");
    var resetPasswordModal = document.getElementById("reset-password-modal");

    // Get the buttons that open the modals
    var forgotPasswordBtn = document.getElementById("forgot-password-link");

    // Get the <span> elements that close the modals
    var closeForgotModal = document.getElementById("close-modal");
    var closeResetModal = document.getElementById("close-reset-modal");

    // When the user clicks on the button, open the forgot password modal
    forgotPasswordBtn.onclick = function() {
        forgotPasswordModal.style.display = "block";
    }

    // When the user clicks on <span> (x), close the modals
    closeForgotModal.onclick = function() {
        forgotPasswordModal.style.display = "none";
    }

    closeResetModal.onclick = function() {
        resetPasswordModal.style.display = "none";
    }

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
        if (event.target == forgotPasswordModal) {
            forgotPasswordModal.style.display = "none";
        }
        if (event.target == resetPasswordModal) {
            resetPasswordModal.style.display = "none";
        }
    }
</script>

    
</body>
</html>
