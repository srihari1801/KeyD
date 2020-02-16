<%-- 
    Document   : Signup
    Created on : Oct 2, 2018, 3:09:25 PM
    Author     : Priya
--%>
<%!String ip="";%>
<%@page import="java.math.BigInteger"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Signup Page</title>
        <link href="css/style1.css" type="text/css" rel="stylesheet" />
         <link href="https://fonts.googleapis.com/css?family=Mali" rel="stylesheet">
         <style>
           body{
                background-image: url(image/blue.jpg);
                background-repeat: no-repeat;
                background-size:cover;
                 font-family:'Mali', cursive;
            }
        </style>
    </head>
    <body>
        <center>
           <h1><center>CLOUD SERVICE  PROVIDER</center></h1>
           <div>
                 <center>
                    <br><br>
                        <a href="Login.jsp" style="color: #330066;text-decoration: none;margin-left: 50px;">
                         *   USER HOME
                        </a>
                        
                        <a href="Admin.jsp" style="color: #330066;text-decoration: none;margin-left: 50px;">
                         *   ADMIN HOME
                        </a>
                     <a href="MainHome.jsp" style="color: #330066;text-decoration: none;margin-left: 50px;">
                         *   Logout
                        </a>
                        <br><br>
                 </center>
             </div>
           <h3 style="margin-top:100px;"><center>SIGNUP HERE!!!</center></h3>
            <form action="SignupConn.jsp" method="post">
                
                <table align="center" style="margin-top: 10px;font-family: ">
                      
                        <tr>
                           
                                <td><label for="ip" >IP ADDRESS:</label></td>
                            
                        </tr>    

                        
                        <tr>
                                 <%
                                     
                                     
                                    try {
                                        
          Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/duplication","root","root");
            Statement st=con.createStatement();
            //out.println("Connected");
            String i = "192.168.1";
           
 

            ResultSet s = st.executeQuery("SELECT id from register");
		int id=1;
            if(s.last())
    {
      //System.out.print("id");
        id=s.getInt(id)+1;
       //out.println(id);
          ip=i+"."+id;
         
      //out.println("IP Address is"+ip);
    } 
            else
            {
                ip = "192.168.1.1";
            }
       }
       catch(Exception ex)
       { 
            System.out.println("Error Message:"+ex.getMessage());
       }

       %>
    
                            <td>
                                <input type="text" name="ip" value="<%=ip%>" required style="border-radius: 5pt 5pt;width: 300px; text-align: center;color: black;">
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
                           
                                <td><label for="mail" >MAIL ID:</label></td>
                            
                          </tr>    

                        
                        <tr>
                               
                            <td>
                                <input type="text" name="mail" placeholder="Enter Your User Name" required style="border-radius: 5pt 5pt;width: 300px; text-align: center;color: black;">
                            </td>
                           
                        </tr> 
                       <tr>
                           
                                <td><label for="phno" >PHONE NUMBER:</label></td>
                            
                          </tr>    
  
                        
                        <tr>
                            <td>
                                
                                <input type="text" name="phno" required placeholder="Enter Your phone number" style="border-radius: 5pt 5pt;width: 300px; text-align: center;color: black;"/>
                            </td>
                        </tr>
                        <tr>
                             <td>
                                <input type="submit" name="submit" value="SIGN UP" id="submit" style="border-radius: 5pt 5pt;margin-top: 10px;background-color: black;color: white; margin-left: 25px;width: 100px; text-align: center;" />
                                 <input type="reset" name="reset" value="RESET"  style="border-radius: 5pt 5pt;margin-top: 10px;background-color: black;color: white; margin-left: 50px;width: 100px; text-align: center;">
                             </td>
                        </tr>
                </table>
            </form>      
        </center>
    </body>
</html>
