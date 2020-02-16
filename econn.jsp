<%-- 
    Document   : econn
    Created on : Nov 16, 2018, 11:08:40 AM
    Author     : Priya
--%>

<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.FileUploadException"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
     
        <%!
     String emp_name="";	 
	// String emp_c_number="";
	 String emp_emailid="";
     
	 int count1=0,count2=0,count3=0,count4=0,count5=0;
 %>
 <%
     try
     {
     Class.forName("com.mysql.jdbc.Driver");
        Connection  conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/duplication", "root","root");
        Statement st=conn.createStatement();
        Statement at=conn.createStatement();
 boolean isMultipart = ServletFileUpload.isMultipartContent(request);
 if (!isMultipart) {
 } else {
   FileItemFactory factory = new DiskFileItemFactory();
   ServletFileUpload upload = new ServletFileUpload(factory);
   List items = null;
   try {
   items = upload.parseRequest(request);
   } catch (FileUploadException e) {
   e.printStackTrace();
   }
   Iterator itr = items.iterator();
   while (itr.hasNext()) 
	   {
   FileItem item = (FileItem) itr.next();
   if (item.isFormField())
	   {
	      String name = item.getFieldName();
		  String value = item.getString();
		  if(name.equals("emp_name"))
	           {
			   emp_name=value;
            		 count1=1;
			   }
                  
			 
                          
			  
            		if(name.equals("email_id"))
	                 {
			      count4=4;
				  emp_emailid=value;
			}	    
		 		 
		       } else
	   {
               
    try {
          String name=emp_name;
         //String mbl=emp_c_number;
	
        String mail=emp_emailid;
	   String itemName = item.getName();
   File savedFile = new File(config.getServletContext().getRealPath("/")+"image\\"+itemName);
   item.write(savedFile);
   

  String path =savedFile.getPath();
    path = path.replace("\\", "/");
    //String path1="@"+path;
  // out.print(path);
    st.executeUpdate("insert into fupload1(o_fid,o_fname,o_name,o_floc) values( '"+mail+"' , '"+itemName+"' , '"+name+"', '"+path+"' )");
    
 
     %><center></table><table ><tr><td width="210"></td><td> 
                <img  border="2" src=image/<%=itemName %> width="100"  height="100" style="border-radius: 50pt 50pt;"></td></tr>
    </table>
    <table border="2" width="350">
      <% if(count1==1)
      		 out.println("<tr><td align='left'><b>Name:</td><td><b>"+emp_name);
	
	  if(count4==4)
		     out.println("</td><tr><td align='left'><b>Email ID</td><td><b>"+emp_emailid);
   } 
catch (Exception e) 
{
e.printStackTrace();
 }
                }
   }
   }
      %>
 </td></tr></table></center>
 <%
 String iii="select * from fupload1";
          ResultSet k=at.executeQuery(iii);
          
while(k.next())
          {
 String a=k.getString(2);
 String b=k.getString(3);
 
 String d=k.getString(4);
String e=k.getString(5);

        
         
          e = e.replace("/", "\\");
          
          out.println(e);
          %>
<!-- <img  border="2" src=image/<%=e%> width="100"  height="100" > -->
           
    <a href="Download.jsp?name=<%=e%>">Download</a> <br>
    <%
          }



}
catch(Exception ex)
{
out.println("Error:"+ex.getMessage());
}
   %>
    
    </body>
</html>
