<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="database.Db_Connection"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Upload File</title>
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
         <h1><center>CLOUD SERVICE  PROVIDER</center></h1>
           <h3 style="margin-top: 100px;"><center>UPLOAD FILES</center></h3>
           <div>
                <jsp:useBean id="test" class="SplitFileExample" />
  <%
   SplitFileExample tc = new SplitFileExample();
   tc.call();
  %>
        <form method="post" action="Upload" enctype="multipart/form-data">
            
            <center>
                <table border="1" width="25%" cellpadding="5" >
                    <thead> 
                            <th colspan="3">Upload File</th>        
                    </thead>
                    <tbody>
                        <tr>    
                            <td>Title : </td>
                            <td><input type="text" name="title" size="30"></td>
                        </tr>
                        <tr>
                            <td>Choose File : </td>
                            <td><input type="file" name="file_uploaded" /></td>
                        </tr>
                        <tr>
                            <td colspan="3"><center><input type="submit" value="Upload"></center></td>
                        </tr>
                    </tbody>             
                </table>
            </center>
           
        </form>
         </div>
        <br><br>
        <div>
            <a href="ViewFiles.jsp" style="margin-left:750px;color: black;">View Files</a>
        </div>
        
<!--        <div style="position: relative">
            <div style="position: fixed ; bottom: 0 ; width:100% ; text-align:center ">
                <p><a href="https://www.youtube.com/user/TechWorld3g?sub_confirmation=1">CLICK HERE TO SUBSCRIBE</a></p>
            </div>
        </div>  -->
  
    </body>
</html>