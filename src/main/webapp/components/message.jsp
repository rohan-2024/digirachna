<%-- 
    Document   : message
    Created on : 09-Sep-2024, 7:32:13 pm
    Author     : snghr
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String message=(String)session.getAttribute("message");
    if(message!=null){
%>
  <div style="padding: 10px; margin: 10px 0; border: 1px solid #4CAF50; background-color: #d4edda; color: #155724; border-radius: 5px; text-align: center;">
     
    <h1><%= message %></h1>
</div>

<%
    session.removeAttribute("message");
}
%>
