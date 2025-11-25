<%-- 
    Document   : Admin
    Created on : 13 Apr, 2021, 12:08:42 PM
    Author     : KishanVenky
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="com.database.Queries"%>
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
                                 <a href="AdminHome.jsp">Home</a>
                              </li>
                              <li>
                                 <a href="ViewUsers.jsp">View All Users</a>
                              </li>
                               <li>
                                 <a href="AddService.jsp">Add Services</a>
                              </li>
                               <li class="active">
                                 <a href="ViewService_Center.jsp">View All Services</a>
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
      <!-- end header -->
      <!-- revolution slider -->
      <div class="banner-slider">
         <div class="container-fluid">
            <div class="row">
              
               </div>
               <div class="col-md-5">
                  <div class="full slider_cont_section">
                      <center>
                     <h4>View All Service Center Details</h4>
                     <table>
                         <tr>
                             <th>Service Name</th>
                               <th>Email</th>
                                 <th>Mobile</th>
                                   <th>Address</th>
                                    <th>Delete</th>
                         </tr>
                         <%try{
                          ResultSet r=Queries.getExecuteQuery("select * from service_center");
                          while(r.next()){
                           %>
                           <tr>
                               <td><%=r.getString("name")%></td>
                               <td><%=r.getString("email")%></td>
                               <td><%=r.getString("mobile")%></td>
                               <td><%=r.getString("address")%></td>
                               <td><a href="SDelete.jsp?id=<%=r.getString("id")%>">Delete</a></td>
                           </tr>
                           <%
                          }
                         }catch(Exception e){
                             out.println(e);
}%>
                     </table>
                     
                     
                      </center>   
                  
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
