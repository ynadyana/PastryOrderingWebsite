<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Confirmation</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #fffaf0; 
        color: black; 
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
        background-color: rgba(0, 0, 0, 0.5); 
        padding-top: 60px;
    }
    .modal-content {
        background-color: #f9f3e7; 
        margin: 5% auto;
        padding: 20px;
        border: 1px solid #888;
        border-radius: 10px;
        width: 80%;
        max-width: 500px;
        text-align: center;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); 
    }
    .modal-content h2 {
        margin: 0 0 20px 0;
        color: #d2691e; 
    }
    .modal-content p {
        margin: 0 0 20px 0;
    }
    .modal-content button {
        margin: 10px;
        padding: 10px 20px;
        font-size: 16px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        color: white; 
    }
    .modal-content button.yes {
        background-color: #d2691e; 
    }
    .modal-content button.no {
        background-color: #808080; 
    }
</style>
<script type="text/javascript">
    function showOrderConfirmation() {
        document.getElementById('confirmationModal').style.display = 'block';
    }

    function handleUserChoice(getReceipt) {
        if (getReceipt) {
            window.location.href = "/payment/receipt-get";
        } else {
            window.location.href = "index.jsp"; 
        }
    }
</script>
</head>
<body onload="showOrderConfirmation()">
    <h1>Order Confirmation</h1>
    <p>Your order has been successfully placed.</p>

    <div id="confirmationModal" class="modal">
        <div class="modal-content">
            <h2>Order Successful</h2>
            <img src="images/done.png" alt="success" width="150">
            <p>You have successfully ordered. Do you want to get the receipt?</p>
            <button class="yes" onclick="handleUserChoice(true)">Yes</button>
            <button class="no" onclick="handleUserChoice(false)">No</button>
        </div>
    </div>
</body>
</html>
