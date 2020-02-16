<%-- 
    Document   : Block
    Created on : Feb 14, 2019, 3:25:09 PM
    Author     : Priya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
                <div style="margin-top:50px;">
                     <center> 
                          <br>
                         <h1> KEY-D DEDUPLICATION</h1>
                         <br><br>

                     </center>
                </div>
            
                 <div  class="col-md-8" style="background-color:transparent;margin-left: 250px;">
                      <h1><center>Level 2:Block Level Deduplication </center></h1>
       <form action="AddConn.jsp" method="post" enctype="multipart/form-data" name="form1" id="form1" style="color: white;margin-top:50px;">
  
        <center>
            <h3><center>Splitting Files </center></h3>
            <table >
            <tr>
                           
                 <td><label for="name" > File Name:</label></td>
                            
             </tr>    

            <tr>
		   <td ><input type="text" name="fname" placeholder="Enter Your File name" required style="color:black;border-radius: 5pt 5pt;width: 300px; text-align: center;"></td>
	   </tr>
	   
          
           <tr>
               <td align="left"> <b>Upload Song </b></td>
           </tr>
           
           <tr>
	           <td>
		       <input name="file" type="file" id="file" style="color: black;border-radius: 5pt 5pt;margin-left: -20px;width: 300px; text-align: center;">
		   <td>
	    </tr>
	   
		 <tr>
                               
                             <td>
                                 <input type="submit" name="submit" value="Submit"  style="border-radius: 5pt 5pt;margin-top: 10px;background-color: white;color: black; margin-left: 25px;width: 100px; text-align: center;">
                                 <input type="reset" name="reset" value="Reset"  style="border-radius: 5pt 5pt;margin-top: 10px;background-color: white;color: black; margin-left: 50px;width: 100px; text-align: center;">
                             </td>
                            
                 </tr>
    </table>
	</center>   
 </form>
                </div>
                
            </div>
        </div>
   
     
    </body>
</html>
