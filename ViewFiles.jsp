<%-- 
    Document   : ViewFiles
    Created on : Oct 11, 2018, 4:38:14 PM
    Author     : Priya
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="database.Db_Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Files </title>
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
           <h3 style="margin-top: 50px;"><center>VIEW FILES HERE</center></h3>
           <div >
               <center>
                  <table border="1" width="25%" cellpadding="5">
            <thead> 
               <th colspan="3">Uploaded Files</th>        
            </thead>
                <tbody>
                    <tr>
                        <td><center><b>Id</b></center><td><center><b>Title</b></center></td><td><center><b>File</b></center></td>
                    </tr>
                     <%
                        try
                        {
                                Db_Connection dbconn=new Db_Connection();
                                Connection myconnection= dbconn.Connection();

                                String sqlString = "SELECT * FROM uploadfile";
                                Statement myStatement = myconnection.createStatement();
                                ResultSet rs=myStatement.executeQuery(sqlString);
                                
                                if(!rs.isBeforeFirst())
                                {
                                    %>
                                        <tr>
                                        <td colspan="3"><center><%out.print("No Files!"); %></center></td>
                                        </tr>
                                        <%}
 while(rs.next())
                                {   
                            %>
                                    <tr>
                                        <td><center><%out.print(rs.getString("fid")); %></center></td>
                                        <td><center><%out.print(rs.getString("imgname")); %></center></td>
                  
                  <td ><center><a href="Download.jsp?fid=<%out.print(rs.getString("fid"));%>" style="text-decoration: none;color: greenyellow">View</a></center></td>
                                    </tr>
                            <%
                                }
                                }
                                catch(Exception ex)
                                    {
                                        ex.printStackTrace();
                                    }
                            %>
</tbody>
               </center>
                  </table>
           </div>
    </body>
</html>
