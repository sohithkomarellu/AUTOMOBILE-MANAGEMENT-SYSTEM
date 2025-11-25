<%-- 
    Document   : Delete
    Created on : 5 May, 2021, 11:01:56 PM
    Author     : KishanVenky
--%>

<%@page import="com.database.Queries"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String id=request.getParameter("id");
try{
    
    int i=Queries.getExecuteUpdate("delete from user where id='"+id+"'");
    if(i>0){
        %>
        <script type="text/javascript">
            window.alert("User Deleted...!!");
            window.location="ViewUsers.jsp";
        </script>
        <%
    }else{
 %>
        <script type="text/javascript">
            window.alert("User Deletion Failed...!!");
            window.location="ViewUsers.jsp";
        </script>
        <%
}
    
    
}catch(Exception e){
    out.println(e);
}



%>