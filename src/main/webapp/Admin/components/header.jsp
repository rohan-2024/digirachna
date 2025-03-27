<%@page import="com.blog.entity.Admin"%>
<%@page import="jakarta.servlet.http.HttpSession"%>
<%
        Admin admin=(Admin)session.getAttribute("current-user");
      if(admin == null)
    {
    session.setAttribute("message", "Session out ! Please Login");
    response.sendRedirect("../login.jsp");
    return;
    }
    %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Blog Management</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&display=swap" rel="stylesheet">
    <!-- FontAwesome for Icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
     <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.3/font/bootstrap-icons.min.css" rel="stylesheet">
    
    <!-- Custom CSS -->
    <script>
         var check1=true;
        var check2=true;
        
        function currentPasswordCheck(){
        let currentPassword=document.getElementById('currentPassword').value;
        let message=document.getElementById('message');
        console.log("currentPassword= ",currentPassword);
        console.log("message= ",message);
        
        if(currentPassword === "<%= admin.getPassword() %>"){
            message.innerHTML='password matched';
            console.log("If statement message= ",message);
            check1=false;
    }else{
        message.innerHTML='password not matched';
        console.log("Else statement message= ",message);
        check1=true; 
    }
    if(check1 || check2){
        document.getElementById('savePasswordButton').disabled=true;
    }
}

function confirmPasswordCheck(){
    let newPassword=document.getElementById('newPassword').value;
    let confirmPassword=document.getElementById('confirmPassword').value;
    let confirmMessage=document.getElementById('confirmMessage');
    
    if(newPassword===confirmPassword){
        confirmMessage.innerHTML='New password matched';
        document.getElementById('savePasswordButton').disabled=false;
        check2=false;
        }else{
            confirmMessage.innerHTML='New password not matched';
            check2=true;
}
if(check1 || check2){
            document.getElementById('savePasswordButton').disabled=true;
        }
}



    </script>
    