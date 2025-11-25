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
                              <li>
                                 <a href="SearchCarDetails.jsp">Search Car</a>
                              </li>
                              <li  class="active">
                                 <a href="AnalysisGraph.jsp">Analysis Graph</a>
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


ResultSet r=Queries.getExecuteQuery("select * from pricing where company='"+company+"'and variant='"+varient+"'");
String cid=null;
if(r.next()){
   cid=r.getString("cardid"); 
}
session.setAttribute("cardid",cid);
          %>
          
          <h1>Welcome To : <%=name%></h1>      
          
          
           <center>
              <h2 STYLE="MARGIN-TOP:30PX;">SELECT CARS</h2>
              <form action="AnalysisGraphAction2.jsp" method="post">
                  <table>
                     <tr><th>Company Name</th><tD><input type="text" name="company" value="<%=company%>" required=""></tD></tr>
                     <tr><th>Variant</th><tD><input type="text" name="variant" value="<%=varient%>" required=""></tD></tr>
                     <tr><th>Price Graph</th><tD><a href="ViewPriceGraph?cid=<%=cid%>">Pricing Analysis in Graph</a></tD></tr>
                     <tr><th>Select Service</th><td><select name="service" >
                                         <option></option>
                                          <option value="3rd_Service">3rd Service</option>
                                           <option value="4th_Service">4th Service</option>
                                           <option value="5th_Service">5th Service</option>
                                           <option value="6th_Service">6th Service</option>
                                           <option value="7th_Service">7th Service</option>
                                       
                         </select>
                             <input type="submit" value="ViewAnalysis"></td></tr>
                  </table>
                       </form>
                     <table>
                     <form action="PartAction.jsp" method="post">
                      <tr><th>Part Change</th><td><select name="part">
                                         <option></option>
                                          <option value="3rd_Service">3rd Service</option>
                                           <option value="4th_Service">4th Service</option>
                                           <option value="5th_Service">5th Service</option>
                                           <option value="6th_Service">6th Service</option>
                                           <option value="7th_Service">7th Service</option>
                                       
                         </select>
                             <input type="submit" value="PartAnalysis"></td></tr>
                     </form>
                
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
