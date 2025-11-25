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
           
            <%
            
            String carid=(String)session.getAttribute("carid");
            

            %>  
            <h2>PART CHANGES</h2>   
            <form action="PartsAction.jsp" method="post">
            <table>
                 <tr><th>Car ID</th><td><input type="text" name="carid" value="<%=carid%>" readonly=""></td></tr>
                 <tr><th>Select Service</th><td><select name="service" required="">
                                         <option></option>
                                          <option value="3rd_Service">3rd Service</option>
                                           <option value="4th_Service">4th Service</option>
                                           <option value="5th_Service">5th Service</option>
                                           <option value="6th_Service">6th Service</option>
                                           <option value="7th_Service">7th Service</option>
                                       
                         </select></td></tr>
                             
               <tr><th>Normal Engine Oil</th><td><input type="text" name="engoil" required=""></td></tr>
               <tr><th>Oil Filter</th><td><input type="text" name="OilFilter" required=""></td></tr>
                 <tr><th>Air Filter</th><td><input type="text"  name="AirFilter" required=""></td></tr>                 
                          
             <tr><th>Coolant</th><td><input type="text" name="Coolant" required=""></td></tr>
               <tr><th>Fuel Filter</th><td><input type="text" name="FuelFilter" required=""></td></tr>
                 <tr><th>Service Charge</th><td><input type="text"  name="ServiceCharge" required=""></td></tr>                 
                <tr><th>Spark Plug</th><td><input type="text" name="SparkPlug" required=""></td></tr>
                 <tr><th>Brake & Clutch Oil</th><td><input type="text"  name="BrakeClutchOil" required=""></td></tr>                 
                          
            
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
