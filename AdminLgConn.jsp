



<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%-- 
    Document   : validatecaptcha
    Created on : Oct 9, 2015, 10:54:33 AM
    Author     : Aravind Sankaran Nair
--%>


<%
    try
{
   Class.forName("com.mysql.jdbc.Driver");
   Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/duplication","root","root");
         //   Connection con=DriverManager.getConnection("jdbc:mysql://sql12.freemysqlhosting.net:3306/sql12259565","sql12259565","Riyasen$234");
            Statement st=con.createStatement();
            //out.println("Connected");
   ResultSet y,j;
   out.println("Connected");
    
    
            String uname = request.getParameter("uname");
            String pass = request.getParameter("pass");
         
            if(uname.equalsIgnoreCase("Admin")&&pass.equalsIgnoreCase("Admin"))
            {
                response.sendRedirect("AdminHome.jsp");
            }
            else
            {
                response.sendRedirect("Admin.jsp");
            }
     }
catch(Exception ex)
{
    out.println("Hai");
    System.out.printf("Hai",ex.getMessage());
}
    
    %>
