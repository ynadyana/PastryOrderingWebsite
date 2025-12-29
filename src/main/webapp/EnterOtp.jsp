<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Enter OTP</title>
<!-- Font Icon -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<!-- Bootstrap CSS -->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom CSS -->
<style>
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
    .form-gap {
        padding-top: 70px;
    }
    .form-group {
        position: relative;
    }
</style>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
</head>
<body class='bg-info vh-100'>

<div class="container vh-100 centered">
    <div class="form-container bg-white rounded">
        <div class="text-center mb-4">
            <h3><i class="fa fa-lock fa-4x"></i></h3>
            <h2 class="text-center">Enter OTP</h2>
            <% if (request.getAttribute("message") != null) { %>
                <p class="text-danger ml-1"><%= request.getAttribute("message") %></p>
            <% } %>
        </div>
        <form id="register-form" action="ValidateOtp" role="form" autocomplete="off" class="form" method="post">
            <div class="form-group">
                <div class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-envelope color-blue"></i></span>
                    <input id="opt" name="otp" placeholder="Enter OTP" class="form-control" type="text" required="required">
                </div>
            </div>
            <div class="form-group">
                <input name="recover-submit" class="btn btn-info btn-block" value="Reset Password" type="submit">
            </div>
            <input type="hidden" class="hide" name="token" id="token" value="">
        </form>
    </div>
</div>

</body>
</html>
