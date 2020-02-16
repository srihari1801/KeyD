<%-- 
    Document   : empconn
    Created on : Nov 12, 2018, 12:58:42 PM
    Author     : Priya
--%>


<%@page import="java.io.InputStream"%>
<%@page import="java.security.DigestInputStream"%>
<%@page import="java.io.IOException"%>
<%@page import="java.security.MessageDigest"%>
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
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>employee conn Page</title>
    </head>
    <body>
        <center><h1>Your  Profile has been Uploaded</h1></center>
  
 <%
      try {
           Class.forName("com.mysql.jdbc.Driver");
        Connection  conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/duplication", "root","root");
        Statement st=conn.createStatement();
        Statement at=conn.createStatement();
 %>
         <%!
     String emp_name="";	 
	 String emp_c_number="";
	 String emp_emailid="";
     String address1="";
	 String address2="";
         String itemName="";
	 int count1=0,count2=0,count3=0,count4=0,count5=0;
 %>
 <%
 boolean isMultipart = ServletFileUpload.isMultipartContent(request);

 if (!isMultipart) {
     out.print("hai");
 } else {
          
   FileItemFactory factory = new DiskFileItemFactory();
   ServletFileUpload upload = new ServletFileUpload(factory);
   List items = null;
   try 
   {
   items = upload.parseRequest(request);
      
   } 
   catch (FileUploadException e) 
   {
   e.printStackTrace();
   out.print("Error:"+e.getMessage());
   } 
   Iterator itr = items.iterator();
   while (itr.hasNext()) 
	   {
   FileItem item = (FileItem) itr.next();
   if (item.isFormField())
	   { 
              
	      String name = item.getFieldName();
		  String value = item.getString();
                   String itemName = item.getName();
                // out.println(name);
                 // out.println(value);
		  if(name.equals("emp_name"))
	           {
                       
			   emp_name=value;
            		 count1=1;
                         // out.println(emp_name);
			   }
			  if(name.equals("address1"))
	                  {  
				address1=value;            		 
                                count2=2;
                              // out.println(address1);

					  }
			  if(name.equals("address2"))
	                  {  
				address2=value;            		 
                                count5=5;
                                //out.println(address2);
					  }
			  if(name.equals("contact_number"))
	                  {
			         emp_c_number=value;
			         count3=3;
                                 //out.println(emp_c_number);
					  }
            		 
			  if(name.equals("email_id"))
	             {
                                count4=4;
				emp_emailid=value;
                                //out.print(emp_emailid);
				 }	    
		 
		 
		    
   } else
	   {
   
            String name=emp_name;
         String mbl=emp_c_number;
	String addr=address1+address2;
        String mail=emp_emailid;
       // String mail=emp_emailid;
       
   String itemName = item.getName();
   //out.print(itemName);
   File savedFile = new File(config.getServletContext().getRealPath("/")+"image\\"+itemName);
  // out.print(savedFile);
   item.write(savedFile);
    
    String path =savedFile.getPath();
    path = path.replace("\\", "/");
    //String path1="@"+path;
  // out.print(path);
    st.executeUpdate("insert into fupload(addr,mbl,mail,fname,name,floc) values('"+addr+"' ,'"+mbl+"', '"+mail+"' , '"+itemName+"' , '"+name+"', '"+path+"' )");
    
 
  
          %>
          <!--<a href="Download.jsp" >Download</a>-->
          <%
          }

 %>

 <center></table><table ><tr><td width="210"></td><td> <img  alt="not found" border="2" src="image/<%=itemName %>" width="150"  height="150" style="border-radius: 5pt 5pt;"></td></tr></table><table border="2" width="350">
   
   <%     if(count1==1)
      		 out.println("<tr><td align='left'><b>Name:</td><td><b>"+emp_name);
	  if(count2==2)	 
		     out.println("</td><tr><td align='left'><b>Addresss(Line1):</td><td><b>"+address1);
	  if(count5==5)	 
		     out.println("</td><tr><td align='left'><b>Line2:</td><td><b>"+address2);
	  if(count3==3)
		     out.println("</td><tr><td align='left'><b>Contact No</td><td><b>"+emp_c_number);
	  if(count4==4)
		     out.println("</td><tr><td align='left'><b>Email ID</td><td><b>"+emp_emailid);
   
          
         
   }
   }
   }    

 catch (Exception e) {
   e.printStackTrace();
out.print("Error:"+e.getMessage());
   }





   %>
   
   <%
                 
                   
   
   
   %>
     </td></tr></table></center>
	
    </body>
</html>
