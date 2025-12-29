<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="paymentProject.*"%>
<%@page import="RegisterModel.*"%>
<%@page import="java.util.*"%>

<%
	UserBean auth = (UserBean) request.getSession().getAttribute("auth");
	session.setAttribute("auth",auth);
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
      <title>Home</title>
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
       
        <!--boxicon cdn link -->
        <link rel="stylesheet"
 		 href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
   </head>
   <!-- body -->
   <body class="main-layout">
      <!-- loader  -->
      <div class="loader_bg">
         <div class="loader"><img src="images/loading.gif" alt="#"/></div>
      </div>
      <!-- end loader -->
      <!-- header -->
    <header class="header">
    <a href="#" class="logo"> <i class="fas fa-shopping-basket"></i>Lyssaa Liciousss</a>

   <nav class="navbar">
        <a href="index.html">Home</a>
        <a href="shop.jsp">Shop</a>
        <a href="gallery.html">Gallery</a>
        <a href="review.html">Review</a>
        <a href="OrderHistoryServlet1">Order History</a>
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
            <!-- end header inner -->
            <!-- end header -->
          
         <!-- <header>
        <div class="header">
            <div class="container-fluid">
                <div class="row d_flex">
                    <div class="col-md-2 col-sm-3 col logo_section">
                        <div class="full">
                            <div class="center-desk">
                                <div class="logo">
                                    <a href="index.html"><img src="images/logo1.png" alt="#"/></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-8 col-sm-9">
                        <nav class="navigation navbar navbar-expand-md navbar-dark ">
                        	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample04" aria-controls="navbarsExample04" aria-expanded="false" aria-label="Toggle navigation">
                        	<span class="navbar-toggler-icon"></span>
                        	</button>
                        <div class="collapse navbar-collapse" id="navbarsExample04">
                            <ul class="navbar-nav mr-auto">
                                <li class="nav-item">
                                    <a class="nav-link" href="index.html">Home</a>
                                </li>
                                <li class="nav-item active">
                                    <a class="nav-link" href="about.html">About</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="shop.html">Menu</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="quality.html">Quality</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="contact.html">Contact Us</a>
                                </li>
                            </ul>
                            </div>
                        </nav>
                    </div>
                    <div class="col-md-2">
                        <div class="icons">
                             <ul class="email text_align_right">
                        			<li class="d_none"><a href="Javascript:void(0)"><i class="fa fa-user" aria-hidden="true"></i></a></li>
                        			<li class="d_none"> <a href="Javascript:void(0)"><i class="fa fa-search" style="cursor: pointer;" aria-hidden="true"></i></a> </li>
                     		</ul>
                        </div>
                    </div>
                </div>
            </div>
        </div> -->
         
      </header> -->
      <!-- home section start -->

<section class="home" id="home">
    <div class="slides-container">

        <div class="slide active">
            <div class="content">
                <span>Have a Cookie-A-Licious</span>
                <h3>up to 50% off</h3>
                <a href="shop.jsp" class="btn">Shop Now</a>
            </div>
            <div class="img">
                <img decoding="async" src="images/susuHome.PNG" alt="">
            </div>
        </div>

        <div class="slide">
            <div class="content">
                <span>Have a Cookie-A-Licious</span>
                <h3>up to 50% off</h3>
                <a href="shop.jsp" class="btn">Shop Now</a>
            </div>
            <div class="img">
                <img decoding="async" src="images/tartHome.PNG" alt="">
            </div>
        </div>

        <div class="slide">
            <div class="content">
                <span>Have a Cookie-A-Licious</span>
                <h3>upto 50% off</h3>
                <a href="shop.jsp" class="btn">Shop Now</a>
            </div>
            <div class="img">
                <img decoding="async" src="images/creamHome.PNG" alt="">
            </div>
        </div>

    </div>
    <div id="next-slide" class="fas fa-angle-right" onclick="next()"></div>
    <div id="prev-slide" class="fas fa-angle-left" onclick="next()"></div>

</section>


<!-- <section class="banner-container">

    <div class="banner">
        <img decoding="async" src="images/banner-1.jpg" alt="">
        <div class="content">
        <span>limited sales</span>
        <h3>up to 50% off</h3>
        <a href="shop.html" class="btn">shop now</a>
    </div>
    </div>

    <div class="banner">
        <img decoding="async" src="img/banner-2.jpg" alt="">
        <div class="content">
        <span>limited sales</span>
        <h3>up to 50% off</h3>
        <a href="shop.html" class="btn">shop now</a>
    </div>
    </div>

    <div class="banner">
        <img decoding="async" src="img/banner-3.jpg" alt="">
        <div class="content">
        <span>limited sales</span>
        <h3>up to 50% off</h3>
        <a href="shop.html" class="btn">shop now</a>
    </div>
    </div>

</section> -->
      <!-- end banner -->
      <<!-- about section start -->
<div class="heading">
    <h1>About us</h1>
    </div>

<section class="about">
    <div class="img">
         <img decoding="async" src="images/abtus2.jpg" alt="">
    </div>

    <div class="content">
        <span>welcome to our products</span>
        <h3>Lyssaa Liciousss Shop, Where Every Cookie Tells a Story.</h3>
        <p>Our journey began with a simple love for baking and a passion for 
        creating delightful, handmade treats that bring joy and warmth to every 
        occasion. Our mission is to create delicious, high-quality cookies that not 
        only satisfy your sweet tooth but also create memorable moments. We take pride 
        in using only the finest ingredients, sourced locally whenever possible, to ensure that 
        every bite is as fresh and flavorful as it can be. From classic favorites to innovative new flavors, 
        our cookies are baked with love and care, just like Grandma used to make.</p>
        <a href="#" class="btn">read more</a>
    </div>
</section>


<!-- number section start -->
<!-- <section class="number section">
   <div class="number-row">
      <div class="num-col">
         <div class="icon">
            <i class="bx bx-star"></i>
         </div>
         <div class="name">
            <h4>our experience</h4>
            <span class="num" data-value="1345">0000</span>
         </div>
      </div>
      <div class="num-col">
         <div class="icon">
            <i class="bx bx-user-plus"></i>
         </div>
         <div class="name">
            <h4>Cookies specialist</h4>
            <span class="num" data-value="1345">0000</span>
         </div>
      </div>
      <div class="num-col">
         <div class="icon">
            <i class="bx bx-check"></i>
         </div>
         <div class="name">
              <h4>Complete project</h4>
            <span class="num" data-value="1345">0000</span>
         </div>
      </div>
      <div class="num-col">
         <div class="icon">
            <i class="bx bx-group"></i>
         </div>
         <div class="name">
            <h4>Happy client</h4>
            <span class="num" data-value="1345">0000</span>
         </div>
      </div>
   </div>
</section> -->
<!-- client section start -->

<div class="heading">
    <h1>client's review</h1>
</div>

<section class="info-container">

    <div class="info">
        <img decoding="async" src="images/fastdelivery.png" alt="">
        <div class="content">
            <h3>fast delivery</h3>
            <span>within 30 minutes</span>
        </div>
    </div>

    <div class="info">
        <img decoding="async" src="images/24hours.png" alt="">
        <div class="content">
            <h3>24 / 7 available</h3>
            <span>call us anytime</span>
        </div>
    </div>

    <div class="info">
        <img decoding="async" src="images/payment.png" alt="">
        <div class="content">
            <h3>easy payments</h3>
            <span>cash or credit</span>
        </div>
    </div>

</section>

<!-- review section start -->

<section class="review">

    <div class="box">
        <div class="user">
            <img decoding="async" src="images/male1.jpeg" alt="">
            <div class="info">
                <h3>edward bey</h3>
                <span>happy client</span>
            </div>
        </div>
        <p>"I recently discovered Lyssaa Liciousss Shop, and I am so glad I did! The rainbow chocolate chip are absolutely divineâcrispy on the edges and perfectly gooey in the middle." </p>
    </div>

    <div class="box">
        <div class="user">
            <img decoding="async" src="images/male2.jpeg" alt="">
            <div class="info">
                <h3>anthony</h3>
                <span>happy client</span>
            </div>
        </div>
        <p>"Lyssaa Liciousss Shop is my go-to place for cookies. I've tried almost every flavor they offer, and I have never been disappointed."</p>
    </div>

    <div class="box">
        <div class="user">
            <img decoding="async" src="images/female1.jpg" alt="">
            <div class="info">
                <h3>airina</h3>
                <span>happy client</span>
            </div>
        </div>
        <p>"I love Lyssaa Liciousss Shop! The variety of cookies they offer is fantastic, and each one is better than the last."</p>
    </div>

    <div class="box">
        <div class="user">
            <img decoding="async" src="images/male3.jpeg" alt="">
            <div class="info">
                <h3>andrew</h3>
                <span>happy client</span>
            </div>
        </div>
        <p>"I can't say enough good things about Lyssaa Liciousss Shop. The cookies are always fresh and delicious, and the staff are so welcoming." </p>
    </div>

    <div class="box">
        <div class="user">
            <img decoding="async" src="images/female2.jpeg" alt="">
            <div class="info">
                <h3>maisarah</h3>
                <span>happy client</span>
            </div>
        </div>
        <p>"Lyssaa Liciousss Shop never fails to impress me. Whether I'm grabbing a quick snack or ordering cookies for an event, the quality is always top-notch."</p>
    </div>

    <div class="box">
        <div class="user">
            <img decoding="async" src="images/female3.jpeg" alt="">
            <div class="info">
                <h3>Aliyaa</h3>
                <span>happy client</span>
            </div>
        </div>
        <p>"Lyssaa Liciousss Shop is simply the best! Their snickerdoodle cookies are my all-time favorite."</p>
    </div>

</section>
      
          <!-- products section -->


     
      <!-- contact -->
<section class="contact">
      <div class="row">
         <form action="">
             <h3>get in touch</h3>
             <div class="inputBox">
             <input type="text" placeholder="enter your name" class="box">
             <input type="text" placeholder="enter your email" class="box">
            </div>
            <div class="inputBox">
                <input type="number" placeholder="enter your number" class="box">
                <input type="text" placeholder="enter your subject" class="box">
               </div>
               <textarea placeholder=" your message" cols="30" rows="10"></textarea>
               <input type="submit" value="send message" class="btn">
         </form>
         <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d127486.28730195966!2d101.59796612336426!3d3.108862638639237!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31cc4d8b932abdc7%3A0x6e65e085abb091c5!2sShah%20Alam%2C%20Selangor!5e0!3m2!1sen!2smy!4v1720744790323!5m2!1sen!2smy" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
     </div>

</section>
      <!-- end contact -->
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
                        <p>Â© 2020 All Rights Reserved. <a href="https://html.design/">Free html Templates</a></p>
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
      <script src="js/main1.js"></script>
   </body>
</html>
>