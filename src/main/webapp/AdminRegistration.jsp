<%-- 
    Document   : AdminRegistration
    Created on : 09-Sep-2024, 7:00:40 pm
    Author     : snghr
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Admin Registration!</h1>
        <div class="form-control">
            <form action="AdminServlet" method="post" enctype="multipart/form-data">
                <label>Enter name</label><br>
                <input type="text" name="name" /><br>
                
                <label>Enter contact</label><br>
                <input type="text" name="contact" /><br>
                
                <label>Enter email</label><br>
                <input type="email" name="email" /><br>
                
                <label>Enter password</label><br>
                <input type="password" name="password" /><br>
                
                <label>Enter photo</label><br>
                <input type="file" name="photo" /><br>
                
                <button type="submit">Submit</button>
                <button type="reset">Reset</button>
            </form>
        </div>
    </body>
</html>
