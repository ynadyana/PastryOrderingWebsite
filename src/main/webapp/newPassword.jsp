<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Reset Password</title>
<!-- Font Icon -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css">
<!-- Bootstrap CSS -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom CSS -->
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
    .bg-info {
        background-color: #B43F11 !important;
    }
    .bg-white {
        background-color: #fff !important;
    }
    .vh-100 {
        height: 100vh;
    }
    .centered {
        display: flex;
        align-items: center;
        justify-content: center;
    }
    .form-container {
        max-width: 500px;
        width: 100%;
        padding: 20px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
    }
</style>
</head>
<body class='bg-info vh-100'>

<div class="container vh-100 centered">
    <div class="form-container bg-white rounded">
        <div class="text-center mb-4">
            <h1><strong>Reset Password</strong></h1>
        </div>
        <form class="form-horizontal" action="NewPassword1" method="POST" id="reset-form">
            <div class="form-group">
                <input type="password" name="password" id="password" placeholder="&#xf084; &nbsp; New Password" class="form-control border-info placeicon" onfocus="showHint('password-hint')" onblur="hideHint('password-hint')">
                <i class="fa fa-eye-slash toggle-password" onclick="togglePassword('password', this)"></i>
            </div>
            <div id="password-hint" class="password-hint">
                Password must be 8-10 characters long, contain at least one uppercase letter, one number, and one special character.
            </div>
            <div class="form-group mt-3">
                <input type="password" name="confPassword" id="confPassword" placeholder="&#xf084; &nbsp; Confirm New Password" class="form-control border-info placeicon" onfocus="showHint('confpassword-hint')" onblur="hideHint('confpassword-hint')">
                <i class="fa fa-eye-slash toggle-password" onclick="togglePassword('confPassword', this)"></i>
            </div>
            <div id="confpassword-hint" class="password-hint">
                Password must match the above criteria.
            </div>
            <div class="form-group mt-4">
                <input type="submit" value="Reset" class="btn btn-info btn-block">
            </div>
        </form>
        <div class="text-center mt-4">
            <hr>
            <h5>Don't have an Account? <span><a href="signup.jsp" class="text-danger"> Register Now!</a></span></h5>
        </div>
    </div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js"></script>

<script>
    document.getElementById('reset-form').addEventListener('submit', function(event) {
        var pass = document.getElementById('password').value;
        var confPass = document.getElementById('confPassword').value;

        var passCriteria = /^(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,10}$/;

        if (!passCriteria.test(pass)) {
            event.preventDefault();
            alert('Password must be 8-10 characters long, contain at least one uppercase letter, one number, and one special character.');
            return;
        }

        if (pass !== confPass) {
            event.preventDefault();
            alert('Passwords do not match');
        }
    });

    function togglePassword(fieldId, icon) {
        var field = document.getElementById(fieldId);
        if (field.type === 'password') {
            field.type = 'text';
            icon.classList.remove('fa-eye-slash');
            icon.classList.add('fa-eye');
        } else {
            field.type = 'password';
            icon.classList.remove('fa-eye');
            icon.classList.add('fa-eye-slash');
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
