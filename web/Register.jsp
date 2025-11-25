<%-- 
    Document   : Admin
    Created on : 13 Apr, 2021, 12:08:42 PM
    Author     : KishanVenky
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
      <title>AUTOMOBILE MANAGEMENT SYSTEM</title>
      <meta name="keywords" content="">
      <meta name="description" content="">
      <meta name="author" content="">
      <!-- bootstrap css -->
      <link rel="stylesheet" href="css/bootstrap.min.css">
      <!-- style css -->
      <link rel="stylesheet" href="css/style.css">
       <link rel="stylesheet" href="table.css">
      <!-- Responsive-->
      <link rel="stylesheet" href="css/responsive.css">
      <!-- fevicon -->
     <!-- Scrollbar Custom CSS -->
      <link rel="stylesheet" href="css/jquery.mCustomScrollbar.min.css">
    
   </head>
   <!-- body -->
   <body class="main-layout">
      <!-- loader  -->
      <div class="loader_bg">
       
      </div>
      <!-- end loader -->
      <!-- header -->
      <header>
         <!-- header inner -->
         <div class="container-fluid">
            <div class="row">
               <div class="col-lg-3 logo_section">
                  <div class="full">
                     <div class="center-desk">
                         <div class="logo"> <h1>AUTOMOBILE MANAGEMENT</h1></div>
                     </div>
                  </div>
               </div>
               <div class="col-lg-9">
                  <div class="menu-area">
                     <div class="limit-box">
                        <nav class="main-menu">
                           <ul class="menu-area-main">
                              <li>
                                 <a href="index.html">Home</a>
                              </li>
                              <li>
                                 <a href="Admin.jsp">Admin</a>
                              </li>
                              <li class="active">
                                 <a href="User.jsp">User</a>
                              </li>
                           
                           
                           </ul>
                        </nav>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         <!-- end header inner -->
      </header>
      <!-- end header -->
      <!-- revolution slider -->
      <div class="banner-slider">
         <div class="container-fluid">
            <div class="row">
               <div class="col-md-7">
                  <div id="slider_main" class="carousel slide" data-ride="carousel">
                 
                       <center>
              <h1 style="color:whitesmoke">User Registration</h1>
            <%String msg=request.getParameter("msg");
            if(msg!=null){
                %>
                <%=msg%>
                <%
}%>
          <form action="UserRegAction.jsp" method="post">
          <table>
            
               <tr><th>Name</th><td><input type="text" name="name" required=""></tD></tr>
              <tr><th>Email</th><td><input type="email" name="email" required=""></tD></tr>
              <tr><th>Mobile</th><td><input type="number" name="mobile" required=""></tD></tr>
              <tr><th>Address</th><td><input type="text" name="address" required=""></tD></tr>
               <tr><th>UserName</th><td><input type="text" name="uname" required=""></tD></tr>
              <tr><th>Password</th><td><input type="password" name="pass" required=""></tD></tr>
               <tr><th></th><td><input type="submit" value="Register">
                  
                      <a href="User.jsp">Login</a>
                  </tD></tr>
          </table>
      </form>
        </center> 
            
                      
                      
                  </div>
               </div>
               <div class="col-md-5">
                  <div class="full slider_cont_section">
                     <h4>Vehicle</h4>
                     <h3>Maintenance</h3>
                     <p>
                         Inspecting vehicle engine and mechanical/electrical components to diagnose issues accurately
Inspecting vehicle computer and electronic systems to repair, maintain and upgrade
Conducting routine maintenance work aiming to vehicle functionality and longevity
                     </p>
                     
                     
                     <div class="button_section">
                        <a href="about.html">Read More</a>
                        <a href="contact.html">Contact Us</a>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <!-- end revolution slider -->
     
     
      <!-- end footer -->
      <!-- Javascript files-->
      <script src="js/jquery.min.js"></script>
      <script src="js/popper.min.js"></script>
      <script src="js/bootstrap.bundle.min.js"></script>
      <script src="js/jquery-3.0.0.min.js"></script>
      <script src="js/plugin.js"></script>
      <!-- Scrollbar Js Files -->
      <script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
      <script src="js/custom.js"></script>
   </body>
</html>
