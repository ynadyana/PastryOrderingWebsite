<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Logout Confirmation</title>
<script type="text/javascript">
    function confirmLogout() {
        var confirmation = confirm("Do you want to logout?");
        if (confirmation) {
            window.location.href = "confirmLogout.jsp";
        } else {
            window.history.back();
        }
    }
</script>
</head>
<body onload="confirmLogout()">
</body>
</html>