<%-- 
    Document   : empconn
    Created on : Nov 12, 2018, 12:58:42 PM
    Author     : Priya
--%>


<%@page import="javafx.scene.control.Alert"%>
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

    <center><h1></h1></center>

    <%
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/duplication", "root", "root");
            Statement st = conn.createStatement();
            Statement at = conn.createStatement();
            ResultSet rs;
    %>
    <%!
        String fname = "";

        String itemName = "";
        int count1 = 0, count2 = 0, count3 = 0, count4 = 0, count5 = 0;
    %>
    <%
            boolean isMultipart = ServletFileUpload.isMultipartContent(request);

            if (!isMultipart) {
                out.print("hai");
            } else {

                FileItemFactory factory = new DiskFileItemFactory();
                ServletFileUpload upload = new ServletFileUpload(factory);
                List items = null;
                try {
                    items = upload.parseRequest(request);

                } catch (FileUploadException e) {
                    e.printStackTrace();
                    out.print("Error:" + e.getMessage());
                }
                Iterator itr = items.iterator();
                while (itr.hasNext()) {
                    FileItem item = (FileItem) itr.next();
                    if (item.isFormField()) {

                        String name = item.getFieldName();
                        String value = item.getString();
                        String itemName = item.getName();
                        out.println(name);
                        out.println(value);
                        if (name.equals("fname")) {

                            fname = value;
                            count1 = 1;
                            // out.println(emp_name);
                        }

                    } else {

                        String file = fname;

                        String itemName = item.getName();
                        out.println(itemName);
                      String filename = itemName.split("\\.")[0];
                        String extension = itemName.split("\\.")[1];
                       out.println(filename);
                       
                        out.println(extension);

                        File savedFile = new File(config.getServletContext().getRealPath("/") + "image\\files\\" + itemName);

                        item.write(savedFile);

                         String path =savedFile.getPath();
    path = path.replace("\\", "/");
                     out.println(path);
                        out.println(itemName);
                       // out.println("extension"+fn[0]);
                        // out.println("hai");
                        //  String by="admin";
                        st.executeUpdate("insert into uploadfile(fname,path,imgname,filename,extension) values('" + file + "' ,'" + path + "','" + itemName + "','" + filename + "','" + extension+ "' )");
out.println("Inserted");
                response.sendRedirect("SplitBlock.jsp");
                    }
                }
            }
        } catch (Exception ex) {
            out.println("Error");
        }

    %>

</td></tr></table></center>


</html>
