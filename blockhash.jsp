<%@page import="org.apache.commons.codec.digest.DigestUtils"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.security.MessageDigest"%>
<%@page import="java.security.DigestInputStream"%>
<%@page import="java.io.IOException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%!String fname,path;
String filename,extension,checksum;
   int id;%>
<%
try
{
     Class.forName("com.mysql.jdbc.Driver");
         
             Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/duplication","root","root");
           Statement st=con.createStatement();
           Statement at=con.createStatement();
            //out.println("Connected");
   ResultSet y,t;
   out.println("Connected");
   
   
   String kk="select * from blocks";
   y=at.executeQuery(kk);
   
   while(y.next())
   {
       id=y.getInt(1);
        fname=y.getString(2);
        filename=y.getString(3);
       extension=y.getString(4);
        path=y.getString(5);
    
        
          checksum = DigestUtils.sha256Hex(new FileInputStream(path));
          out.println("checksumSHA256 : " + fname + "is"+ checksum);
        

   
  String ad="select * from blocks2 where hash1='"+checksum+"' ";
  
  t=at.executeQuery(ad);
  
  if(t.next())
  {
     out.println("already exists");
      // response.sendRedirect("Home.jsp");
       response.setIntHeader("Refresh", 1);
  }
    else
  {
    int i=st.executeUpdate("DELETE FROM blocks WHERE filename='"+filename+"' " );
 st.executeUpdate("insert into blocks2(id,fname,filename,extension,path1,hash1) values('" + id + "' ,'" + fname + "','" + filename + "','" + extension+ "','" + path + "','" + checksum + "' )");
   
   out.println("Inserted");
    response.setIntHeader("Refresh", 1);
            
  }
   
   } 
    response.sendRedirect("Home.jsp");
}
catch(Exception ex)
{
    
}
%>
