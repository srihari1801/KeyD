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
                 color: white;
            }
        </style>
    </head>
    
    <body>
         <h1><center>CLOUD SERVICE  PROVIDER</center></h1>
          <center>
                    <br><br>
                        
                     <a href="MainHome.jsp" style="color: white;text-decoration: none;margin-left: 50px;">
                         *   Logout
                        </a>
                        <br><br>
                 </center>
           <h1 style="margin-top: 50px;"><center>Level 1:File Level Deduplication</center></h1>
           <div>
        <form method="post" action="UploadFileController1" enctype="multipart/form-data">
            
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
            <a href="Block.jsp" style="margin-left:750px;color: white;">Check with block level</a>
        </div>
        
<!--        <div style="position: relative">
            <div style="position: fixed ; bottom: 0 ; width:100% ; text-align:center ">
                <p><a href="https://www.youtube.com/user/TechWorld3g?sub_confirmation=1">CLICK HERE TO SUBSCRIBE</a></p>
            </div>
        </div>  -->
  
    </body>
</html>