<%-- 
    Document   : Captcha
    Created on : Oct 2, 2018, 12:38:56 PM
    Author     : Priya
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <link href="css/style1.css" type="text/css" rel="stylesheet" />
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
       <center>
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
                        </center>

           <h3 style="margin-top: 50px;"><center>LOGIN HERE!!!</center></h3>
            <form action="LoginConn.jsp" method="get">
               
                <table align="center" style="margin-top: 10px;font-family: ">
                     
                        <tr>
                           
                                <td><label for="ip" >IP ADDRESS:</label></td>
                            
                          </tr>    

                        
                        <tr>
                               
                            <td>
                                <input type="text" name="ip" placeholder="Enter Your IP Address" required style="border-radius: 5pt 5pt;width: 300px; text-align: center;color: black;">
                            </td>
                           
                        </tr> 
                         <tr>
                           
                                <td><label for="uname" >USER NAME:</label></td>
                            
                          </tr>    

                        
                        <tr>
                               
                            <td>
                                <input type="text" name="uname" placeholder="Enter Your User Name" required style="border-radius: 5pt 5pt;width: 300px; text-align: center;color: black;">
                            </td>
                           
                        </tr> 
                        
                         <tr>
                           
                                <td><label for="securitycode" >CAPTCHA CODE:</label></td>
                            
                          </tr>   
                        <tr>
                            <td>
                                <img id="captcha" src="<c:url value="simpleCaptcha.jpg"/>" width="305" height="40"/>
                               
                            </td>
                            
                            
                        </tr>
                        
                        <tr>
                            <td>
                                
                                <input type="text" name="securitycode" required placeholder="Re-Enter Your Captcha" style="border-radius: 5pt 5pt;width: 300px; text-align: center;color: black;"/>
                            
                            </td>
                        </tr>
                        <tr>
                             <td>
                                <input type="submit" name="submit" value="LOGIN" id="submit" style="border-radius: 5pt 5pt;margin-top: 10px;background-color: black;color: white; margin-left: 25px;width: 100px; text-align: center;" />
                                 <input type="reset" name="reset" value="RESET"  style="border-radius: 5pt 5pt;margin-top: 10px;background-color: black;color: white; margin-left: 50px;width: 100px; text-align: center;">
                             </td>
                        </tr>
                         <tr>
                            <td>
                                
                                <a href="Signup.jsp" style="border-radius: 5pt 5pt;width: 300px; text-align: center;color: white;">DO YOU WANT TO CREATE ACCOUNT???</a>
                                    
                            </td>
                        </tr>
                </table>
            </form>      
        </center>
    </body>
</html>
