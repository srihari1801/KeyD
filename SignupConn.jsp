
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>

   <!DOCTYPE html>
<html>
    <head>
        <title>Signup Connecting</title>
    </head>
    <body>
<%   
try
{
   Class.forName("com.mysql.jdbc.Driver");
           // Connection con=DriverManager.getConnection("jdbc:mysql://sql12.freemysqlhosting.net:3306/sql12259565","sql12259565","Riyasen$234");
             Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/duplication","root","root");
           Statement st=con.createStatement();
            //out.println("Connected");
   ResultSet y,j;
   out.println("Connected");
   
   String ip=request.getParameter("ip"); 
   String uname=request.getParameter("uname");
    String mail=request.getParameter("mail");
     String phno=request.getParameter("phno");
   
   
  st.executeUpdate("insert into register(ip,uname,mail,phno) values('"+ip+"','"+uname+"','"+mail+"','"+phno+"')");
       
  
            response.sendRedirect("Login.jsp");
           
       
   }
catch(Exception ex)
{
    out.println("Hai");
    System.out.printf("Hai",ex.getMessage());
}
%>

    </body></html>