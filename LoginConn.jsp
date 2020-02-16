



<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%-- 
    Document   : validatecaptcha
    Created on : Oct 9, 2015, 10:54:33 AM
    Author     : Aravind Sankaran Nair
--%>

<%@ page import="nl.captcha.Captcha"%>
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
    
    
            String ip = request.getParameter("ip");
            String uname = request.getParameter("uname");
           
            String query="select * from register where ip='"+ip+"' and uname='"+uname+"'";
            y=st.executeQuery(query);
       if(y.next())
       {
Captcha captcha=(Captcha)session.getAttribute(Captcha.NAME);
String securitycode = request.getParameter("securitycode");
if (captcha.isCorrect(securitycode)) {
    %>
    <center><font color="red">
        <% session.setAttribute("username", uname);
        response.sendRedirect("Home.jsp");%>
    <script>alert("Security code Matching");</script></font></center>
    <%}else {%>
    <center><font color="red"><%response.sendRedirect("Login.jsp");
        out.print("Incorrect Login");%><script>alert("Security code Mismatch");</script></font></center>
    <%}
}
else
{
response.sendRedirect("Login.jsp");
}
     }
catch(Exception ex)
{
    out.println("Hai");
    System.out.printf("Hai",ex.getMessage());
}
    
    %>
