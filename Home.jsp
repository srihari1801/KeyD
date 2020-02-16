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
         
           <h1><center>CLOUD SERVICE  PROVIDER</center></h1>
           
            <center>
                    <br><br>
                       <a href="upload_form.jsp" style="color: white;text-decoration: none;margin-left: 50px;">
                         *   Upload Files
                        </a>  
                     <a href="ViewFiles.jsp" style="color: white;text-decoration: none;margin-left: 50px;">
                         *   View Files
                        </a>
                     <a href="MainHome.jsp" style="color: white;text-decoration: none;margin-left: 50px;">
                         *   Logout
                        </a>
                        <br><br>
                 </center>
           
           <h3 style="margin-top:20px;"><center>Welcome <%//String display=session.getAttribute("username").toString();
  //out.println(display);%>!!!</center></h3>
  <div style="margin-top:20px;color:white;background-color:#0066cc;margin-left:350px;margin-right:300px;height: 550px;">
               <br>
               <p style="font-size: 30px;margin-left: 50px;margin-top: 20px;">AVOIDING DEDUPLICATION PROCESSES </p>
           
               <ul style="margin-left: 30px;font-size: 20px;">
                   <li>PROCESS 1 : User Authentication.</li>
                   <li>PROCESS 2 : File Upload.</li>
               </ul>
           <p style="font-size: 25px;margin-left: 30px;margin-top: 20px;">FILE UPLOAD:</p>
           <ul style="margin-left: 50px;font-size: 20px;text-align: justify;margin-right: 30PX;">
                  
                   <li>Categorized data into File level and Block level splitting. </li>
                   <li>Data Convergent Encryption and Convergent Key Intialization.</li>
                   <li>Hash key Generated with SHA and then Performs Identity Based Broadcast Encryption.</li>
                   <li>Checking with Cloud Server,either the file is already have Ownership or not.</li>
                   <li>If the file is already uploaded with another owner, now the file is not uploaded with this new owner. </li>
                    <li>Or Otherwise it will be upload into Cloud Space. </li>
               </ul>
           <a href="upload_form.jsp" style="border-radius: 5pt 5pt;width: 300px;margin-left: 480px;color: #ff9999;"> >>> START  THE PROCESS </a>
           </div>
        
    </body>
</html>
