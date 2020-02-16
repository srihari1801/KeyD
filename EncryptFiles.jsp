<%-- 
    Document   : EncryptFiles
    Created on : Oct 13, 2018, 11:28:29 AM
    Author     : Priya
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="database.Db_Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <title>Encrypt Files </title>
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
           <h3 style="margin-top: 100px;"><center>VIEW FILES HERE</center></h3>
           <div >
               <center>
                  <table border="1" width="25%" cellpadding="5">
            <thead> 
               <th colspan="3">Encrypt Files</th>        
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

                                String sqlString = "SELECT max(id) FROM files";
                                Statement myStatement = myconnection.createStatement();
                                Statement st= myconnection.createStatement();
                                ResultSet rs=myStatement.executeQuery(sqlString);
                                
                                if(!rs.isBeforeFirst())
                                {
                                   
                                    %>
                                        <tr>
                                        <td colspan="3"><center><%out.print("No Files!"); %></center></td>
                                        </tr>
                                        <%}
 if(rs.next())
                                {   
                                    int id=rs.getInt(1);

                                         rs = st.executeQuery( "SELECT title FROM files where id='"+id+"' ");
                                            if(rs.next())
                                            {
                                            String title=rs.getString("title");
                                           
                                            //out.print(id);
                                            //out.print(title);
                                           
                            %>
                                    <tr>
                                        <td><center><%=id%></center></td>
                                        <td><center><%=title %></center></td>
                                        <td><center><a href="Crypto.java?id=<%=id%>">Encrypt Files</a></center></td>
                                    </tr>
                                     <%
                                          }
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






