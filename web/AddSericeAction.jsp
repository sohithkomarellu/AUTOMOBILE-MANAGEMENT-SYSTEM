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
 <%try{
       
         String sname=request.getParameter("sname");  
         String email=request.getParameter("email"); 
         String mobile=request.getParameter("mobile"); 
         String address=request.getParameter("address"); 
         
       
       
         Connection con=Dbconnection.getcon();
           Statement s=con.createStatement();
           ResultSet r=Queries.getExecuteQuery("select count(*) from service_center where email='"+email+"'");
         int c=0;
         while(r.next())
         {
           c=r.getInt(1);  
         }
         
         if(c==0){
         PreparedStatement pst=con.prepareStatement("insert into service_center values(null,'"+sname+"','"+email+"','"+mobile+"','"+address+"')");
         
         int i=pst.executeUpdate();
         if(i>0){
              %>
        <script type="text/javascript">
            window.alert("Service Added Sucessfully...!!");
            window.location="AddService.jsp";
        </script>
        <%
            // response.sendRedirect(".jsp?msg=Registraion Success..!!");
         }else{
 %>
        <script type="text/javascript">
            window.alert("Service Ading Failes...!!");
            window.location="AddService.jsp";
        </script>
        <%
              // response.sendRedirect("AddService.jsp?msg=Registraion Failed..!!");
         }
         }else{
 %>
        <script type="text/javascript">
            window.alert("Service Already Exist...!!");
            window.location="AddService.jsp";
        </script>
        <%
        //  response.sendRedirect("AddService.jsp?msg=User Already Exist..!!");   
         }
       }catch(Exception e){
        System.out.println(e);
       }
 %>