<%-- 
    Document   : Home
    Created on : Oct 3, 2018, 12:52:28 PM
    Author     : Priya
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Welcome Home ! ! ! </title>
         <link href="https://fonts.googleapis.com/css?family=Mali" rel="stylesheet">
             <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
                        <a href="AdminHome.jsp" style="color: white;text-decoration: none;margin-left: 50px;">
                         *   VIEW ALL USERS
                        </a>
                        
                        <a href="AdminViewFiles.jsp" style="color: white;text-decoration: none;margin-left: 50px;">
                         *  VIEW ALL FILES
                        </a>
                           <a href="AdminViewBlockFile.jsp" style="color: white;text-decoration: none;margin-left: 50px;">
                         *  VIEW BLOCK LEVEL FILES
                        </a>
                        <a href="MainHome.jsp" style="color: white;text-decoration: none;margin-left: 50px;">
                         *   Logout
                        </a>
                        <br><br>
                 </center>
             </div>
             <div>
             <p>
                 <h3 style="text-align: center;font-family: 'Kaushan Script', cursive;font-size: 15px;">
                    VIEW FILES
                 </h3>
                 
                 <br>
                 <br>
               
                     <form  method="get">
                         <center>
                             <table class="table " style="width: 1000px;">
                     
                     <tr>
                          <th>
                            USER ID
                         </th>
                         <th>
                            TITLE
                         </th>
                          
                         
                          <th>
                            HASH VALUE 
                         </th>
                         
                         
                     </tr>
                     
                
                     <%
                         try
{
   Class.forName("com.mysql.jdbc.Driver");
   Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/duplication","root","root");
   Statement st=conn.createStatement();
   Statement at=conn.createStatement();
   ResultSet y,j;
   

       String query="select * from files ";
       y=at.executeQuery(query);
       
  while(y.next())
       {
//          String a=y.getString("fname");
//          String b=y.getString("key1");
//          String c=y.getString("key2");
//          String d=y.getString("key3");
//          String e=y.getString("deckey");
           

          %>
      
                     
          <tr style="font-size: 16px;">
                           <td style="color: white;">
                             <%=y.getInt("id")%>
                         </td>
                            
                         <td style="color: white;">
                             <%=y.getString("title")%>
                         </td>
                          
                       
                         
                          <td style="color: white;">
                              <%=y.getString("hash")%>
                         </td>
                         
                        
                          
                     </tr>
                      <%  }
          
   }
catch(Exception ex)
{
    System.out.printf("Hai",ex.getMessage());
}
                         
                         %>
                     
                 </table>
                         </center>
                     </form>
         
             </p>
             </div>
            
        </div>
    </body>
</html>
