<%-- 
    Document   : WaverRegAction
    Created on : 9 Apr, 2021, 2:56:57 PM
    Author     : KishanVenky
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.database.Queries"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.database.Dbconnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%
     try{
       
         String carid=request.getParameter("carid");  
         String service=request.getParameter("service"); 
         String engoil=request.getParameter("engoil"); 
         String OilFilter=request.getParameter("OilFilter"); 
         String AirFilter=request.getParameter("AirFilter"); 
         String Coolant=request.getParameter("Coolant"); 
       
           String FuelFilter=request.getParameter("FuelFilter"); 
         String ServiceCharge=request.getParameter("ServiceCharge"); 
         String SparkPlug=request.getParameter("SparkPlug"); 
       String BrakeClutchOil=request.getParameter("BrakeClutchOil");
       
       
         Connection con=Dbconnection.getcon();
           Statement s=con.createStatement();
          
         PreparedStatement pst=con.prepareStatement("insert into partchange values('"+carid+"','"+service+"','"+engoil+"','"+OilFilter+"','"+AirFilter+"','"+Coolant+"','"+FuelFilter+"','"+ServiceCharge+"','"+SparkPlug+"','"+BrakeClutchOil+"')");
         
         int i=pst.executeUpdate();
         if(i>0){
             session.setAttribute("carid",carid);
             response.sendRedirect("AddCarDetails.jsp?msg=Success..!!");
         }else{
               response.sendRedirect("AddCarDetails.jsp?msg=Failed..!!");
         }
        
       }catch(Exception e){
        System.out.println(e);
       }
 %>