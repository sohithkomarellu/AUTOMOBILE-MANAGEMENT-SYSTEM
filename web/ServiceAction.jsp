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
         String total=request.getParameter("total"); 
         String kms=request.getParameter("kms"); 
         String month=request.getParameter("month"); 
         String FreeorPaid=request.getParameter("FreeorPaid"); 
       
       
         Connection con=Dbconnection.getcon();
           Statement s=con.createStatement();
          
         PreparedStatement pst=con.prepareStatement("insert into service values('"+carid+"','"+service+"','"+total+"','"+kms+"','"+month+"','"+FreeorPaid+"')");
         
         int i=pst.executeUpdate();
         if(i>0){
             session.setAttribute("carid",carid);
             response.sendRedirect("PartChange.jsp?msg=Success..!!");
         }else{
               response.sendRedirect("PartChange.jsp?msg=Failed..!!");
         }
        
       }catch(Exception e){
        System.out.println(e);
       }
 %>