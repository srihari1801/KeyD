<%@page import="java.util.Arrays"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.net.URL"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%!String path="";%>
<%
    try
            {
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/duplication","root","root");
    Statement st1=conn.createStatement();
    Statement at1=conn.createStatement();
    ResultSet R;
     String id=request.getParameter("fid");
     int pp=Integer.parseInt(id);
     
     
     
     String sql="select * from uploadfile where fid='"+id+"'";
     
     R=at1.executeQuery(sql);
     while(R.next())
     {
          path=R.getString("path");
         
     }
     
     
        
         
  
  String filename =path;  
//  out.println(f1);
 // String filepath = "C:\\uploads\\";   
  response.setContentType("APPLICATION/OCTET-STREAM");   
  response.setHeader("Content-Disposition","attachment; filename=\"" + filename + "\"");   
  
  java.io.FileInputStream fileInputStream=new java.io.FileInputStream(path);  
            
  int j;
  while ((j=fileInputStream.read()) != -1) {  
    out.write(j);   
  }   
  fileInputStream.close();   
     
         
      }   
    catch(Exception ex)
            {
                out.print("Error:"+ex.getMessage());
            }
%>