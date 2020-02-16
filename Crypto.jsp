
<%@page import="javax.crypto.NoSuchPaddingException"%>
<%@page import="javax.crypto.BadPaddingException"%>
<%@page import="javax.crypto.IllegalBlockSizeException"%>
<%@page import="java.io.IOException"%>
<%@page import="java.security.InvalidKeyException"%>
<%@page import="java.security.NoSuchAlgorithmException"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.security.Key"%>
<%@page import="javax.crypto.Cipher"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="javax.crypto.spec.SecretKeySpec"%>

   <%!int id=0;%>   
    <html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <title>Encrypt Files </title>
       
    </head>
    <body>   
   
<%   
          
             id=request.getParameter("id");
            // out.println("hai");
         
       
        %>
        <%=id%>
    

<%!
public static class Crypto 
{
public static void fileProcessor(int cipherMode,String key,File inputFile,File outputFile)
{
 try {
	       Key secretKey = new SecretKeySpec(key.getBytes(), "AES");
	       Cipher cipher = Cipher.getInstance("AES");
	       cipher.init(cipherMode, secretKey);

	       FileInputStream inputStream = new FileInputStream(inputFile);
	       byte[] inputBytes = new byte[(int) inputFile.length()];
	       inputStream.read(inputBytes);

	       byte[] outputBytes = cipher.doFinal(inputBytes);

	       FileOutputStream outputStream = new FileOutputStream(outputFile);
	       outputStream.write(outputBytes);

	       inputStream.close();
	       outputStream.close();

	    } 
catch (NoSuchPaddingException | NoSuchAlgorithmException 
                     | InvalidKeyException | BadPaddingException
	             | IllegalBlockSizeException | IOException e) {
		e.printStackTrace();
            }
     }
 }
 public static void main(String[] args) {
	//Crypto cc=new Crypto()
        String key = "";
	File inputFile = new File("E:\\demo2\\data.txt");
	File encryptedFile = new File("E:\\demo2\\text.encrypted");
	File decryptedFile = new File("E:\\demo2\\decrypted-text.txt");
	
	
	try {
	     Crypto.fileProcessor(Cipher.ENCRYPT_MODE,key,inputFile,encryptedFile);
	     Crypto.fileProcessor(Cipher.DECRYPT_MODE,key,encryptedFile,decryptedFile);
	     System.out.println("Success");
	 } catch (Exception ex) {
	     System.out.println(ex.getMessage());
             ex.printStackTrace();
	 }
     }   
    
}

%>

%>
</body>