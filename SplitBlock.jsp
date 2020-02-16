
<%@page import="java.io.InputStream"%>
<%@page import="java.security.DigestInputStream"%>
<%@page import="java.io.IOException"%>
<%@page import="java.security.MessageDigest"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%!String b,c,d;
String e1,e2;
   int a;%>
<%
try
{
   Class.forName("com.mysql.jdbc.Driver");
         
             Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/duplication","root","root");
           Statement st=con.createStatement();
           Statement at=con.createStatement();
            //out.println("Connected");
   ResultSet y,j;
   out.println("Connected");
   
   
   String kk="select * from uploadfile";
   y=at.executeQuery(kk);
   
   if(y.last())
   {
        a=y.getInt(1);
        b=y.getString(2);
        c=y.getString(3);
        d=y.getString(4);
        e1=y.getString(5);
        e2=y.getString(6);
        
       out.println(a);
        out.println(b);
        // out.println(c);
          out.println(d);
          out.println(e1);
          out.println(e2);
   }
  // out.println(c);
   String filename1=config.getServletContext().getRealPath("/")+"image\\kd\\"+e1 ;
   
     String FILE_NAME = c;
	// byte PART_SIZE = 5;
	
     out.println(filename1);
		
     
     
     File inputFile = new File(FILE_NAME);
		FileInputStream inputStream;
		String newFileName;
		FileOutputStream filePart;
		int fileSize = (int) inputFile.length();
		int nChunks = 0, read = 0, readLength = 4096;
		byte[] byteChunkPart;
		try {
			inputStream = new FileInputStream(inputFile);
			while (fileSize > 0) {
				if (fileSize <= 5) {
					readLength = fileSize;
				}
				byteChunkPart = new byte[readLength];
				read = inputStream.read(byteChunkPart, 0, readLength);
				fileSize -= read;
				assert (read == byteChunkPart.length);
				nChunks++;
				newFileName = filename1 + ".block"
						+ Integer.toString(nChunks - 1)+"."+e2;
				filePart = new FileOutputStream(new File(newFileName));
				filePart.write(byteChunkPart);
                                
                                
                                
		
                               int id=a;
                                 String  fname=  e1 +".block"
						+ Integer.toString(nChunks - 1)+"."+e2;
                                 String  filename=  e1 +".block"
						+ Integer.toString(nChunks - 1);
                                String extension= e2;
                               String  path=  filename1 + ".block"
						+ Integer.toString(nChunks - 1)+"."+e2;
                               
                             
    path = path.replace("\\", "/");
                                
                             
        st.executeUpdate("insert into blocks(id,fname,filename,extension,path) values('" + id + "' ,'" + fname + "','" + filename + "','" + extension+ "','" + path + "' )");

				filePart.flush();
				filePart.close();
				byteChunkPart = null;
				filePart = null;
			}
			inputStream.close();
                        
                        
                        response.sendRedirect("blockhash.jsp");
		} 
                catch (Exception ex) {
			ex.printStackTrace();
		}
     
     
     
    
                                 
 
                                 
                                 
				
	

}
catch(Exception ex)
{
    
}

%>
<%--<%!
     private static byte[] checksum(InputStream inputStream, MessageDigest md) throws IOException 
    {

        try (DigestInputStream dis = new DigestInputStream(inputStream, md)) 
        {
            while (dis.read() != -1) ;
            md = dis.getMessageDigest();
        }

        return md.digest();

    }

    private static String bytesToHex(byte[] hashInBytes) 
    {

        StringBuilder sb = new StringBuilder();
        for (byte b : hashInBytes) {
            sb.append(String.format("%02x", b));
        }
        return sb.toString();

    }
%>--%>