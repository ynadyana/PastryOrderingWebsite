<%@page import="paymentProject.DbCon"%>
<%@page import="paymentProject.ProductDao"%>
<%@page import="paymentProject.*"%>
<%@page import="java.util.*"%>
<%@page import="RegisterModel.*"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
  pageEncoding="ISO-8859-1"%>
<%
DecimalFormat dcf = new DecimalFormat("#.##");
request.setAttribute("dcf", dcf);
UserBean auth = (UserBean) request.getSession().getAttribute("auth");
if (auth != null) {
    request.setAttribute("person", auth);
}
ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
List<Cart> cartProduct = null;
if (cart_list != null) {
  ProductDao pDao = new ProductDao(DbCon.getConnection());
  cartProduct = pDao.getCartProducts(cart_list);
  double total = pDao.getTotalCartPrice(cart_list);
  request.setAttribute("total", total);
  request.setAttribute("cart_list", cart_list);
}
%>

<!DOCTYPE html>
<html lang="en">
   <head>
      <!-- basic -->
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <!-- mobile metas -->
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="viewport" content="initial-scale=1, maximum-scale=1">
      <!-- site metas -->
      <title>Shop</title>
      <meta name="keywords" content="">
      <meta name="description" content="">
      <meta name="author" content="">
      <!-- bootstrap css -->
      <link rel="stylesheet" href="css/bootstrap.min.css">
      <!-- style css -->
      <link rel="stylesheet" href="css/style.css">
      <!-- Responsive-->
      <link rel="stylesheet" href="css/responsive.css">
      <!-- fevicon -->
      <link rel="icon" href="images/fevicon.png" type="image/gif" />
      <!-- Tweaks for older IEs-->
      <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
      <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
      
      <!-- font awesome cdn link -->
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

      <!-- custom css file link -->
      <link rel="stylesheet" href="style.css">

      <!-- custom styles -->
      <style type="text/css">
        .btn-custom {
            font-size: 16px;
            border-radius: 5px;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            color: #fff;
            background-color: #007bff;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .btn-custom:hover {
            background-color: #0056b3;
        }
        .btn-incre, .btn-decre {
            font-size: 25px;
            box-shadow: none;
        }
        .btn-incre {
            background-color: #28a745;
        }
        .btn-decre {
            background-color: #dc3545;
        }
        .btn-remove {
            background-color: #dc3545;
            font-size: 16px;
        }
        .btn-checkout {
            background-color: #007bff;
        }
        .navbar a, .email a {
            color: #fff;
        }
        .footer {
            background-color: #833517;
            color: #fff;
        }
        .footer .infoma h3, .footer .infoma p, .footer .infoma ul, .footer .infoma li {
            color: #fff;
        }
        .footer .infoma a {
            color: #fff;
        }
        .footer .infoma a:hover {
            color: #ddd;
        }
        .copyright p {
            color: #ccc;
        }
        
         /* The Modal (background) */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }

        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 80%; /* Could be more or less, depending on screen size */
            text-align: center;
        }

        /* Close Button */
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
      </style>
   </head>
   <!-- body -->
   <body class="main-layout inner_page">
   <div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <span class="close">&times;</span>
    <h3 style="color:crimson;">Item Already in Cart.</h3>
    <a href="cart.jsp">GO to Cart Page</a>
  </div>
	<script>
    // Get the modal
    var modal = document.getElementById("myModal");

    // Get the <span> element that closes the modal
    var span = document.getElementsByClassName("close")[0];

    // When the user clicks on <span> (x), close the modal
    span.onclick = function() {
        modal.style.display = "none";
    }

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }

    // Function to show the modal
    function showModal() {
        modal.style.display = "block";
    }

    // Check if the modal should be shown
    <% 
        session = request.getSession(false);
        if (session != null && session.getAttribute("itemAlreadyInCart") != null && (boolean) session.getAttribute("itemAlreadyInCart")) {
    %>
        window.onload = showModal;
        <% session.removeAttribute("itemAlreadyInCart"); %> <!-- Remove the attribute to prevent showing the modal on refresh -->
    <% } %>
</script>
	</div>
      <!-- header -->
      <header class="header">
        <a href="#" class="logo"> <i class="fas fa-shopping-basket"></i>Lyssaa Liciousss</a>

        <nav class="navbar">
            <a href="index.jsp">Home</a>
            <a href="shop.jsp">Shop</a>
            <a href="gallery.html">Gallery</a>
            <a href="review.html">Review</a>
            <a href="">Order History</a>
            <a href="contactUs.jsp">Contact Us</a>
        </nav>

        <div class="icons">
            <div id="menu-btn" class="fas fa-bars"></div>
            <div id="search-btn" class="fas fa-search"></div>
            <div id="cart-btn" class="fas fa-shopping-cart"></div>
            <div id="login-btn" class="fas fa-user"></div>
        </div>
         <script>
    document.getElementById('cart-btn').addEventListener('click', function() {
        // Redirect to cart.jsp
        window.location.href = 'cart.jsp';
    });
    
    document.getElementById('login-btn').addEventListener('click', function() {
        // Redirect to cart.jsp
        window.location.href = 'logout.jsp';
    });
    </script>
        
      </header>
      <!-- end header -->
      <!-- honey_bg -->
      <div class="honey_bg">
         <div class="container">
            <div class="row">
               <div class="col-md-12">
                  <div class="titlepage text_align_center">
                  </div>
               </div>
            </div>
         </div>
      </div>
      <!-- end honey_bg -->
      <!-- products section -->
      <%@include file="head.jsp"%>
      <title>E-Commerce Cart</title>
      <div class="container my-3">
          <div class="d-flex py-3"><h3>Total Price: RM ${(total>0)?dcf.format(total):0} </h3> <a class="mx-3 btn btn-checkout" href="cart-check-out1">Check Out</a></div>
          <table class="table table-light">
            <thead>
              <tr>
                <th scope="col"><h5><b>Name</h5></b></th>
                <th scope="col"><h5><b>Price</h5></b></th>
                <th scope="col"><h5><b>Quantity</h5></b></th>
                <th scope="col"><h5><b>Cancel</h5></b></th>
              </tr>
            </thead>
            <tbody>
              <%
              if (cart_list != null) {
                for (Cart c : cartProduct) {
              %>
              <tr>
                <td><h5><%=c.getName()%></h5></td>
                <td><h5><%= dcf.format(c.getPrice())%></h5></td>
                <td>
                  <form action="order-now" method="post" class="form-inline">
                    <input type="hidden" name="id" value="<%= c.getId()%>" class="form-input">
                    <div class="form-group d-flex justify-content-between">
                      <a class="btn btn-incre" href="quantity-inc-dec?action=inc&id=<%=c.getId()%>"><i class="fas fa-plus-square"></i></a> 
                      <input type="text" name="quantity" class="form-control"  value="<%=c.getQuantity()%>" readonly> 
                      <a class="btn btn-decre" href="quantity-inc-dec?action=dec&id=<%=c.getId()%>"><i class="fas fa-minus-square"></i></a>
                    </div>
                  </form>
                </td>
                <td><a href="remove-from-cart?id=<%=c.getId() %>" class="btn btn-remove">Remove</a></td>
              </tr>
              <%
              }}%>
            </tbody>
          </table>
        </div>
      <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
      <!-- footer -->
      <footer>
          <div class="footer">
             <div class="container">
                <div class="row">
                   <div class="col-md-3 col-sm-6">
                      <div class="infoma text_align_left">
                         <h3>About</h3>
                         <p class="ipsum">Lyssaa Liciousss Shop has something to satisfy every craving. Visit us and experience the joy of our delightful cookies today!</p>
                      </div>
                   </div>
                   <div class="col-md-3 col-sm-6">
                      <div class="infoma">
                         <h3>Address</h3>
                         <ul class="conta">
                            <li>No. 12, Jalan Anggerik Vanilla 31/AF,<br>
                      Kota Kemuning,<br>
                      40460 Shah Alam,<br>
                      Selangor, Malaysia</li>
                            <li>+60 12-345 6789 <br> +60 13-987 6543</li>
                            <li><a href="Javascript:void(0)">LyssaaLiciousss@gmail.com</a></li>
                         </ul>
                      </div>
                   </div>
                   <div class="col-md-3 pad_lrft col-sm-6">
                      <div class="infoma">
                         <h3>Links</h3>
                         <ul class="fullink">
                            <li><a href="index.html">Home</a></li>
                            <li><a href="shop.html">Shop</a></li>
                            <li><a href="gallery.html">Gallery</a></li>
                            <li><a href="review.html">Review</a></li>
                            <li><a href="contactUs.jsp">Contact</a></li>
                         </ul>
                      </div>
                   </div>
                   <div class="col-md-3 col-sm-6">
                      <div class="infoma">
                         <h3>Newsletter</h3>
                         <form class="form_subscri">
                            <div class="row">
                               <div class="col-md-12">
                                  <input class="newsl" placeholder="Your Name" type="text" name="Your Name">
                               </div>
                               <div class="col-md-12">
                                  <input class="newsl" placeholder="Email" type="email" name="Email">
                               </div>
                               <div class="col-md-12">
                                  <button class="subsci_btn">subscribe</button>
                               </div>
                            </div>
                         </form>
                      </div>
                   </div>
                </div>
             </div>
             <div class="copyright">
                <div class="container">
                   <div class="row">
                      <div class="col-md-12">
                         <p>© 2024 All Rights Reserved. Design by <a href="https://www.example.com">Your Company</a></p>
                      </div>
                   </div>
                </div>
             </div>
          </div>
      </footer>
      <!-- end footer -->
      <!-- Javascript files-->
      <script src="js/jquery.min.js"></script>
      <script src="js/bootstrap.bundle.min.js"></script>
      <script src="js/jquery-3.0.0.min.js"></script>
      <!-- sidebar -->
      <script src="js/custom.js"></script>
      <script src="main.js"></script>
   </body>
</html>
