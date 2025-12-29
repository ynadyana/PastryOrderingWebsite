<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Register page</title>

<!-- Font Icon -->
<link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet" href="css/style3.css">
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
        <!-- Sign up form -->
        <section class="signup">
            <div class="container">
                <div class="signup-content">
                    <div class="signup-form">
                        <h2 class="form-title">Sign up</h2>
                    
                        <form method="post" action="SignUpServlet1" class="register-form" id="register-form">
                            <div class="form-group">
                                <label for="name">
                                <i class="zmdi zmdi-face material-icons-name"></i>
                                </label> 
                                <input type="text" name="name" id="name" placeholder="Your Name" />
                            </div>
                            
                            <div class="form-group">
                                <label for="username">
                                <i class="zmdi zmdi-account material-icons-name"></i>
                                </label> 
                                <input type="text" name="username" id="username" placeholder="Your Username" onfocus="showHint('username-hint')" onblur="hideHint('username-hint')" />
                            </div>
                            <div id="username-hint" class="password-hint">
                                Username must not contain the word "admin".
                            </div>
                            
                            <div class="form-group">
                                <label for="email">
                                <i class="zmdi zmdi-email"></i>
                                </label> 
                                <input type="email" name="email" id="email" placeholder="Your Email" />
                            </div>
                            
                            <div class="form-group">
                                <label for="pass">
                                <i class="zmdi zmdi-lock"></i>
                                </label> 
                                <input type="password" name="pass" id="pass" placeholder="Password" onfocus="showHint('password-hint')" onblur="hideHint('password-hint')" />
                                <i class="zmdi zmdi-eye-off toggle-password" onclick="togglePassword('pass', this)"></i>
                            </div>
                            <div id="password-hint" class="password-hint">
                                Password must be 8-10 characters long, contain at least one uppercase letter, one number, and one special character.
                            </div>
                            
                            <div class="form-group">
                                <label for="re-pass">
                                <i class="zmdi zmdi-lock-outline"></i>
                                </label>
                                <input type="password" name="re_pass" id="re_pass" placeholder="Repeat your password" onfocus="showHint('repassword-hint')" onblur="hideHint('repassword-hint')" />
                                <i class="zmdi zmdi-eye-off toggle-password" onclick="togglePassword('re_pass', this)"></i>
                            </div>
                            <div id="repassword-hint" class="password-hint">
                                Password must match the above criteria.
                            </div>
                            
                            <div class="form-group">
                                <label for="contact"><i class="zmdi zmdi-phone"></i>
                                </label>
                                <input type="text" name="contact" id="contact" placeholder="Contact no" />
                            </div>
                            
                            <div class="form-group">
                                <input type="checkbox" name="agree-term" id="agree-term"
                                    class="agree-term" /> 
                                    <label for="agree-term" class="label-agree-term">
                                    <span><span></span></span>I
                                    agree all statements in 
                                    <a href="termsOfService.html" class="term-service"> Terms of service</a>
                                    </label>
                            </div>
                            
                            <div class="form-group form-button">
                                <input type="submit" name="signup" id="signup" class="form-submit" value="Register" />
                                <input type="reset" name="reset" id="reset" class="form-submit" value="Reset" />
                            </div>
                            
                        </form>
                    </div>
                    
                    <div class="signup-image">
                        <figure>
                            <img src="images/logoshop.png" alt="sing up image">
                        </figure>
                        <a href="signin.jsp" class="signup-image-link">I am already member</a>
                    </div>
                    
                </div>
            </div>
        </section>
    </div>
    
    <!-- JS -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="js/main.js"></script>
    
    <script>
        document.getElementById('register-form').addEventListener('submit', function(event) {
            var username = document.getElementById('username').value;
            var pass = document.getElementById('pass').value;
            var rePass = document.getElementById('re_pass').value;
            var name = document.getElementById('name').value;
            var email = document.getElementById('email').value;
            var contact = document.getElementById('contact').value;
            var agreeTerm = document.getElementById('agree-term').checked;

            var passCriteria = /^(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,10}$/;

            if (username.toLowerCase().includes('admin')) {
                event.preventDefault();
                alert('Username must not contain the word "admin".');
                return;
            }

            if (pass !== "" && !passCriteria.test(pass)) {
                event.preventDefault();
                alert('Password must be 8-10 characters long, contain at least one uppercase letter, one number, and one special character.');
                return;
            }

            if (pass !== rePass) {
                event.preventDefault();
                alert('Passwords do not match.');
                return;
            }
            
            if(name != "" && username !="" && email != "" && pass !="" && rePass != "" && contact !="" && !agreeTerm){
            	 event.preventDefault();
                 alert('You must agree to the terms of service.');
                 return;
            }
        });

        function togglePassword(fieldId, icon) {
            var field = document.getElementById(fieldId);
            if (field.type === 'password') {
                field.type = 'text';
                icon.classList.remove('zmdi-eye-off');
                icon.classList.add('zmdi-eye');
            } else {
                field.type = 'password';
                icon.classList.remove('zmdi-eye');
                icon.classList.add('zmdi-eye-off');
            }
        }

        function showHint(hintId) {
            document.getElementById(hintId).style.display = 'block';
        }

        function hideHint(hintId) {
            document.getElementById(hintId).style.display = 'none';
        }
    </script>
    
</body>
</html>
