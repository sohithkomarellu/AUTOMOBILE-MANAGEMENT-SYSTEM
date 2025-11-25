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
       
         String name=request.getParameter("name");  
         String email=request.getParameter("email"); 
         String mobile=request.getParameter("mobile"); 
         String address=request.getParameter("address"); 
         String uname=request.getParameter("uname"); 
         String pass=request.getParameter("pass"); 
       
       
         Connection con=Dbconnection.getcon();
           Statement s=con.createStatement();
           ResultSet r=Queries.getExecuteQuery("select count(*) from user where email='"+email+"' and mobile='"+mobile+"'");
         int c=0;
         while(r.next())
         {
           c=r.getInt(1);  
         }
         
         if(c==0){
         PreparedStatement pst=con.prepareStatement("insert into user values(null,'"+name+"','"+email+"','"+mobile+"','"+address+"','"+uname+"','"+pass+"')");
         
         int i=pst.executeUpdate();
         if(i>0){
             response.sendRedirect("Register.jsp?msg=Registraion Success..!!");
         }else{
               response.sendRedirect("Register.jsp?msg=Registraion Failed..!!");
         }
         }else{
          response.sendRedirect("Register.jsp?msg=User Already Exist..!!");   
         }
       }catch(Exception e){
        System.out.println(e);
       }
 %>