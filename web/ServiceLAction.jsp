<%-- 
    Document   : Delete
    Created on : 5 May, 2021, 11:01:56 PM
    Author     : KishanVenky
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="com.database.Queries"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String email=request.getParameter("email");
try{
    
    ResultSet i=Queries.getExecuteQuery("select * from service_center where email='"+email+"'");
    if(i.next()){
           session.setAttribute("id",i.getString("id"));
            session.setAttribute("name",i.getString("name"));
        session.setAttribute("email",email);
        %>
        <script type="text/javascript">
            window.alert("Service Login Successful...!!");
            window.location="ServiceHome.jsp";
        </script>
        <%
    }else{
  %>
        <script type="text/javascript">
            window.alert("Service Login Failes...!!");
            window.location="Service.jsp";
        </script>
        <%
}
    
    
}catch(Exception e){
    out.println(e);
}



%>