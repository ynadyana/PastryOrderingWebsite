<%@page import="paymentProject.*"%>
<%@page import="RegisterModel.*"%>

<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
  pageEncoding="ISO-8859-1"%>

<%
UserBean auth = (UserBean) request.getSession().getAttribute("auth");
if (auth != null) {
    request.setAttribute("person", auth);
}
ProductDao pd = new ProductDao(DbCon.getConnection());
List<Product> products = pd.getAllProducts();
ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
if (cart_list != null) {
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
       
   </head>
   <!-- body -->
   <body class="main-layout inner_page">
      <!-- loader  -->
      
      <!-- end loader -->
      <!-- header -->
      
      <!-- body -->
   <body class="main-layout inner_page">
      <!-- loader  -->
      
      <!-- end loader -->
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
    
    document.getElementById('login-btn').addEventListener('click', function() {
        // Redirect to cart.jsp
        window.location.href = 'logout.jsp';
    });
    </script>


</header>
      
      
      
      <!-- <header>
         <div class="header">
            <div class="container-fluid">
               <div class="row d_flex">
                  <div class=" col-md-2 col-sm-3 col logo_section">
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
                              <li class="nav-item ">
                                 <a class="nav-link" href="index.html">Home</a>
                              </li>
                              <li class="nav-item">
                                 <a class="nav-link" href="about.html">About</a>
                              </li>
                              <li class="nav-item active">
                                 <a class="nav-link" href="shop.html">menu</a>
                              </li>
                              <li class="nav-item">
                                 <a class="nav-link" href="quality.html">quality</a>
                              </li>
                              <li class="nav-item">
                                 <a class="nav-link" href="contact.html">Contact Us</a>
                              </li>
                           </ul>
                        </div>
                     </nav>
                  </div>
                  <div class="col-md-2">
                     <ul class="email text_align_right">
                        <li class="d_none"><a href="Javascript:void(0)"><i class="fa fa-user" aria-hidden="true"></i></a></li>
                        <li class="d_none"> <a href="Javascript:void(0)"><i class="fa fa-search" style="cursor: pointer;" aria-hidden="true"></i></a> </li>
                     </ul>
                  </div>
               </div>
            </div>
         </div>
      </header> -->
      <!-- end banner -->
      <!-- honey_bg -->
      <div class="honey_bg">
         <div class="container">
            <div class="row">
               <div class="col-md-12">
                  <div class="titlepage text_align_center">
                  </div>
               </div>
               <!-- <div class="col-sm-12">
                  <figure><img class="img_responsive" src="images/honet_img.png" alt="#"/></figure>
               </div> -->
            </div>
         </div>
      </div>
      <!-- end honey_bg -->
      
      <!-- products section -->

<section class="products">
    <h1 class="title"> our <span>products</span> <a href="#">view all >></a> </h1>
    <div class="box-container">
        <%
            if (!products.isEmpty()) {
                for (Product p : products) {
        %>
        <div class="box">
            <div class="icons">
                <a href="add-to-cart?id=<%=p.getId()%>" class="fas fa-shopping-cart"></a>
                <a href="#" class="fas fa-heart"></a>
                <a href="#" class="fas fa-eye"></a>
            </div>
            <div class="img">
                <img decoding="async" src="images/<%=p.getName().replace(" ", "").toLowerCase()%>.jpg" alt="<%=p.getName()%>">
            </div>
            <div class="content">
                <h3><%=p.getName()%></h3>
                <div class="price">RM <%=p.getPrice()%></div>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="far fa-star"></i>
                </div>
            </div>
        </div>
        <%
                }
            } else {
                out.println("There are no products available.");
            }
        %>
    </div>
</section>
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