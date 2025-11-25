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
    <script type="text/javascript">
var citiesByState = {
MARUTISUZUIKI: ["Swift LXI","Swift VXI","Swift VXI AGS","Swift ZXI"],
TATA: ["TIAGO XZA","TIAGO XZA+","TIAGO XZA+DT","ALTROZ XE"],
KIA: ["SONET HTK","SONET HTK+","SONET HTX","SONET HTX+"],
TOYOTA: ["GLANZA","Urban Cruiser","Yaris","Innova Crysta","Fortuner"]
}
function makeSubmenu(value) {
if(value.length==0) document.getElementById("citySelect").innerHTML = "<option></option>";
else {
var citiesOptions = "";
for(cityId in citiesByState[value]) {
citiesOptions+="<option>"+citiesByState[value][cityId]+"</option>";
}
document.getElementById("citySelect").innerHTML = citiesOptions;
}
}
function displaySelected() { var country = document.getElementById("countrySelect").value;
var city = document.getElementById("citySelect").value;
alert(country+"\n"+city);
}
function resetSelection() {
document.getElementById("countrySelect").selectedIndex = 0;
document.getElementById("citySelect").selectedIndex = 0;
}
</script>
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
                              <li >
                                 <a href="UserHome.jsp">Home</a>
                              </li>
                              <li class="active">
                                 <a href="SearchCarDetails.jsp">Search Car</a>
                              </li>
                               
                              <li>
                                 <a href="User.jsp">Logout</a>
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
      <div id="user">
        
          <%
          
          String id=(String)session.getAttribute("id");
String name=(String)session.getAttribute("name");
String email=(String)session.getAttribute("email");
String mobile=(String)session.getAttribute("mobile");




String company=request.getParameter("company");
String varient=request.getParameter("varient");
String cid=request.getParameter("cid");
          %>
          
          <h1>Welcome To : <%=name%></h1>      
          
          
           <center>
               <h3>Car Details</h3>
               <table>
                   <tr>
                       
                       <th>Card Company</th><th>Car Variant</th> <th>Car Type</th>
                       <th>View Pricing Details</th> <th>View Service Details</th> <th>View Parts Change Details</th>
                   </tr>     
                  <%
                  try{
                  String query="select * from pricing where company='"+company+"'and variant='"+varient+"' or cardid='"+cid+"'";
                 ResultSet r=Queries.getExecuteQuery(query);
                 while(r.next()){
                     %>
                     <td><%=r.getString("company")%></tD>
                      <td><%=r.getString("variant")%></tD>
                      <td><%=r.getString("type")%></tD>
                      <td><a href="ViewPricing.jsp?cid=<%=r.getString("cardid")%>">Get Details</a></tD>
                      <td><a href="ViewService.jsp?cid=<%=r.getString("cardid")%>">Get Details</a></tD>
                      <td><a href="ViewPartsChange.jsp?cid=<%=r.getString("cardid")%>">Get Details</a></tD>
                     <%
                 }
                  
                  
                  }catch(Exception e){
                    out.println(e);  
                  }
                  %> 
               </table>  
                
          </center>      
          
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
