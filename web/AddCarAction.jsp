<%-- 
    Document   : Admin
    Created on : 13 Apr, 2021, 12:08:42 PM
    Author     : KishanVenky
--%>

<%@page import="java.util.Random"%>
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
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

   </head>
   <!-- body -->
   <body class="main-layout" onload="resetSelection()">
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
                                 <a href="AdminHome.jsp">Home</a>
                              </li>
                              <li class="active">
                                 <a href="AddCarDetails.jsp">Add Car Details</a>
                              </li>
                             
                              <li>
                                 <a href="Admin.jsp">Logout</a>
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
      <div id="main">
          <center>
           
            <%String email=(String)session.getAttribute("email");
            String id=(String)session.getAttribute("id");
            String name=(String)session.getAttribute("name");
            
            String company=request.getParameter("company");
            String variant=request.getParameter("varient");
            
Random r=new Random();
int ii=r.nextInt(100000-500)+50000;
String carid=""+ii;
            %>  
            <h2>UPLOAD PRICE DETAILS</h2>   
            <form action="UploadAction" method="post" enctype="multipart/form-data">
            <table>
                 <tr><th>Service ID</th><td><input type="text" name="sid" value="<%=id%>" readonly=""></td></tr>
               <tr><th>Service Name</th><td><input type="text" name="sname" value="<%=name%>" readonly=""></td></tr>
               
                 <tr><th>Car ID</th><td><input type="text" name="carid" value="<%=carid%>" readonly=""></td></tr>
                 <tr><th>Company Name</th><td><input type="text" name="company" value="<%=company%>" readonly=""></td></tr>
                 <tr><th>Variant Name</th><td><input type="text" name="variant" value="<%=variant%>" readonly=""></td></tr>
                             <tr><th>Car Type</th><td><select name="type" required="">
                                         <option></option>
                                          <option value="Petrol">Petrol</option>
                                           <option value="Diesel">Diesel</option>
                         </select></td></tr>
                             
               <tr><th>Ex_Showroom Price</th><td><input type="text" name="exshowroomprice" required=""></td></tr>
               <tr><th>RTO + Others</th><td><input type="text" name="rto" required=""></td></tr>
                 <tr><th>Insurance</th><td><input type="text"  name="Insurance" required=""></td></tr>                 
               <tr><th>Image</th><td><input type="file"  name="image" required=""></td></tr>                 
            
                 <tr><th></th><td><input type="submit" value="Upload"></td></tr>                 
        
                
            </table>
            </form>
            
          </center>      
          
          
          
      </div>
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
