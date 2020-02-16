<%-- 
    Document   : emp
    Created on : Nov 12, 2018, 10:32:00 AM
    Author     : Priya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Upload your File</title>
         <link href="https://fonts.googleapis.com/css?family=Mali" rel="stylesheet">
         <style>
           body{
                background-image: url(image/cmd.jpg);
                background-repeat: no-repeat;
                background-size:cover;
                font-family:'Mali', cursive;
            }
        </style>
    </head>
    <body>
        
            <h1><center>CLOUD SERVICE  PROVIDER</center></h1>
       <form action="econn.jsp" method="post" enctype="multipart/form-data" name="form1" id="form1"  style="margin-top:100px;">
   <center>
   <table border="2">
       <tr>
	       <td align="right"><b>Ownership Name:</td>
		   <td ><input type="text" name="emp_name"></td>
	   </tr>
	   
           <tr>
	       <td align="right"><b>Ownership File ID:</td>
		   <td ><input type="text" name="email_id"></td>
	   </tr>
	   
           <tr>
               <td align="right"> <b>Choose Your File </b></td>
	           <td>
		       <input name="file" type="file" id="file">
		   <td>
	     </tr>
	   
		 <tr>
		   
                     <td align="center">
               <input type="submit" name="Submit" value="Submit"/>
               <input type="reset" name="Reset" value="Reset"/>

		    </td>
                    
		 </tr>
    </table>
	</center>   
 </form>
    </body>
</html>
