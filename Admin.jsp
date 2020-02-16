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
             <div>
                 <center>
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
                 </center>
             </div>
             <div>
             <p>
                 <form action="AdminLgConn.jsp" method="get">
        <h3><center>Admin Login</center></h3>
                <table align="center" style="margin-top: 50px;font-family: ">
                            
                        
                         <tr>
                           
                                <td><label for="uname" >USER NAME:</label></td>
                            
                          </tr>    

                        
                        <tr>
                               
                            <td>
                                <input type="text" name="uname" placeholder="Enter Your User Name" required style="border-radius: 5pt 5pt;width: 300px; text-align: center;color: black;">
                            </td>
                           
                        </tr> 
                          <tr>
                           
                                <td><label for="pass" >PASSWORD:</label></td>
                            
                          </tr>    

                        
                        <tr>
                               
                            <td>
                                <input type="password" name="pass" placeholder="Enter Your Password" required style="border-radius: 5pt 5pt;width: 300px; text-align: center;color: black;">
                            </td>
                           
                        </tr> 
                        
                       
                        <tr>
                             <td>
                                <input type="submit" name="submit" value="LOGIN" id="submit" style="border-radius: 5pt 5pt;margin-top: 10px;background-color: black;color: white; margin-left: 25px;width: 100px; text-align: center;" />
                                <input type="reset" name="reset" value="RESET"  style="border-radius: 5pt 5pt;margin-top: 10px;background-color: black;color: white; margin-left: 50px;width: 100px; text-align: center;">
                             </td>
                        </tr>
                       
                </table>
            </form>
             </p>
             </div>
            
        </div>
    </body>
</html>
