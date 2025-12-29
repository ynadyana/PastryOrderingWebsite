<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Forgot Password</title>
<!-- Font Icon -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css">
<!-- Bootstrap CSS -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom CSS -->
<style>
    .form-group {
        position: relative;
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
    .forgot {
        padding: 20px;
        border: 1px solid #dfdfdf;
        background-color: #fff;
    }
    .list-unstyled li {
        margin-bottom: 10px;
    }
    .btn-custom {
        font-size: 14px;
    }
</style>
</head>
<body class='bg-info vh-100'>

<div class="container vh-100 centered">
    <div class="form-container bg-white rounded">
        <div class="forgot text-center mb-4">
            <h2>Forgot your password?</h2>
            <p>Change your password in three easy steps. This will help you to secure your password!</p>
            <ol class="list-unstyled">
                <li><span class="text-primary text-medium">1. </span>Enter your email address below.</li>
                <li><span class="text-primary text-medium">2. </span>Our system will send you an OTP to your email.</li>
                <li><span class="text-primary text-medium">3. </span>Enter the OTP on the next page.</li>
            </ol>
        </div>
        <form class="card mt-4" action="ForgotPassServlet1" method="POST">
            <div class="card-body">
                <div class="form-group">
                    <label for="email-for-pass">Enter your email address</label>
                    <input class="form-control border-info" type="email" name="email" id="email-for-pass" required="required">
                    <small class="form-text text-muted">Enter the registered email address. We'll email an OTP to this address.</small>
                </div>
            </div>
            <div class="card-footer text-center">
                <button class="btn btn-info btn-custom" type="submit">Get New Password</button>
                <button class="btn btn-danger btn-custom" type="button" onclick="location.href='signin.jsp'">Back to Login</button>
            </div>
        </form>
    </div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js"></script>
</body>
</html>
