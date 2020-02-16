<%-- 
    Document   : Home
    Created on : Oct 3, 2018, 12:52:28 PM
    Author     : Priya
--%>

<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Welcome Home ! ! ! </title>
         <link href="https://fonts.googleapis.com/css?family=Mali" rel="stylesheet">
         <style>
           body{
                background-image: url(image/blue.jpg);
                background-repeat: no-repeat;
                background-size:cover;
                font-family:'Mali', cursive;
                color: white;
            }
        </style>
    </head>
    <body>
         
        <div>
            <h1><center>CLOUD SERVICE  PROVIDER</center></h1>
            <center> 
            <div>
<br><br>
                        <a href="Login.jsp" style="color: white;text-decoration: none;margin-left: 50px;">
                         *   USER HOME
                        </a>
                        
                        <a href="Admin.jsp" style="color: white;text-decoration: none;margin-left: 50px;">
                         *   ADMIN HOME
                        </a>
 <a href="MainHome.jsp" style="color: white;text-decoration: none;margin-left: 50px;">
                         *   Logout
                        </a>
                        <br><br>
             </div>
             <div>
             <p>
                 <img src="image/p1.png" alt="not found" style="width:600px;height: 400px;">
             </p>
             </div>
            </center>
        </div>
    </body>
</html>
