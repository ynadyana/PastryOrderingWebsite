<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="RegisterModel.UserBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Failed Sign in</title>
</head>
<body>

	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" ></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">

	<script type="text/javascript">
	swal("Sorry","Wrong Username or Password","error");
		
	</script>
	<%@ include file="signin.jsp" %>
</body>
</html>