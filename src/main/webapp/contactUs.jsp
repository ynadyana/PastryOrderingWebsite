<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- basic -->
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <!-- mobile metas -->
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="viewport" content="initial-scale=1, maximum-scale=1">
      <!-- site metas -->
      <title>Contact Us</title>
      <meta name="keywords" content="">
      <meta name="description" content="">
      <meta name="author" content="">
      <!-- bootstrap css -->
      <link rel="stylesheet" href="css/bootstrap.min.css">
      <!-- style css -->
      <link rel="stylesheet" href="css/styleCon.css">
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
       
        <!--boxicon cdn link -->
        <link rel="stylesheet"
 		 href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
<meta charset="UTF-8">
<title>Contact Us</title>
</head>
<body class="main-layout inner_page">
<!-- loader  -->
      <div class="loader_bg">
         <div class="loader"><img src="images/loading.gif" alt="#"/></div>
      </div>
      <!-- end loader -->
      <!-- header -->
<header class="header">
    <a href="#" class="logo"> <i class="fas fa-shopping-basket"></i>Lyssaa Liciousss</a>

    <nav class="navbar">
        <a href="index.jsp">Home</a>
        <a href="shop.jsp">Shop</a>
        <a href="gallery.html">Gallery</a>
        <a href="review.html">Review</a>
        <a href="OrderHistory.jsp">Order History</a>
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
    </script>
</header>
      <!-- contact -->
      <div class="contact">
         <div class="container">
            <div class="row ">
               <div class="col-md-12">
                  <div class="titlepage text_align_center">
                     <h2>Contact Us</h2>
                  </div>
               </div>
               <div class="col-md-10 offset-md-1 ">
                  <form class="main_form" action="ControllerContactUs" method="get">
                     <div class="row">
                        <div class="col-md-6 ">
                           <input class="contactus" placeholder="Full Name" type=text name="Name"> 
                        </div>
                        <div class="col-md-6">
                           <input class="contactus" placeholder="Email" type=text name="Email">                          
                        </div>
                        <div class="col-md-6">
                           <input class="contactus" placeholder="Phone Number" type=text name="Phone Number">                          
                        </div>
                        <div class="col-md-6">
                           <textarea class="textarea" name="message" id=message placeholder="Message" rows=4 cols=4></textarea>
                        </div>
                        <div class="col-md-12">
                           <input type=submit class="send_btn" value=Send>
                        </div>
                     </div>
                  </form>
               </div>
            </div>
         </div>
      </div>
      <!-- contact -->  
      <!--  footer -->
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
                           <li><a href="Javascript:void(0)"> LyssaaLiciousss@gmail.com</li>
                        </ul>
                     </div>
                  </div>
                  <div class="col-md-3 pad_lrft col-sm-6">
                     <div class="infoma">
                        <h3>Links</h3>
                        <ul class="fullink">
                          <li><a href="index.jsp">Home</a></li>
                           <li><a href="shop.jsp">Shop</a></li>
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
                        <p>© 2020 All Rights Reserved. <a href="https://html.design/">Free html Templates</a></p>
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