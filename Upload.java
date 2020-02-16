/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import database.Db_Connection;

import java.io.FileInputStream;
import java.io.PrintWriter;
import java.security.DigestInputStream;
import java.security.MessageDigest;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Random;
import javax.servlet.RequestDispatcher;



//@MultipartConfig(maxFileSize = 131072000 )
@MultipartConfig(maxFileSize = 16177215)
@WebServlet(urlPatterns = {"/Upload"})
public class Upload extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Upload</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Upload at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          PrintWriter out = response.getWriter();        
                InputStream inputStream = null;
           
                Db_Connection dbconn=new Db_Connection();
                    Connection conn= dbconn.Connection();
                //Random rand = new Random();
                //int  n = rand.nextInt(9999) + 1;
               // String idTemp=(String.valueOf(n));
               int idTemp;
              //  out.println("hai");

                 try 
                {
                    
                Statement st1=conn.createStatement();
                 Statement st=conn.createStatement();
                String mk="select max(id) from files ";
                ResultSet j=st1.executeQuery(mk);
                
                if(j.next())
                {
                int id=j.getInt(1);
                idTemp=++id; 
               // out.println(idTemp);
                }
                else
                {
                     idTemp=1;
                }
                    
                String title=(request.getParameter("title"));
                //String fileName=(request.getParameter("file_uploaded"));
                Part filePart = request.getPart("file_uploaded");
                
                 if (filePart != null) 
                {
                    System.out.println(filePart.getName());
                    System.out.println(filePart.getSize());
                    System.out.println(filePart.getContentType());
                    
                    inputStream = filePart.getInputStream();
                }
        
        
                  MessageDigest md = MessageDigest.getInstance("SHA-256");
                    byte[] hashInBytes = checksum(filePart.getInputStream(), md);
                    String hashValue=bytesToHex(hashInBytes);
                  //  out.println(hashValue);
       out.println("Unchecked!!!");
       String sql1 = "select * from files where hash='"+hashValue+"' ";
                ResultSet s=st.executeQuery(sql1);
                
                if(s.next())
                {
                    out.println("file already exists!!!");
                    //response.sendRedirect("upload_form1.jsp");
                     conn.close(); 
                     
                    
                    
                    RequestDispatcher rs = request.getRequestDispatcher("upload_form.jsp");
                    rs.include(request, response);
                        
                }
                else{
                    out.println("checked!!!");
                    String sql = "INSERT INTO files (id, title, file,hash) values (?, ?, ?, ?)";
                    PreparedStatement statement = conn.prepareStatement(sql);
                    statement.setInt(1, idTemp);
                    statement.setString(2, title);
             
                    if (inputStream != null) 
                    {
                        statement.setBinaryStream(3, inputStream, (int) filePart.getSize());
                    }
                     statement.setString(4, hashValue);
                    int row = statement.executeUpdate();
                    if (row > 0) 
                    {
                        out.println("File uploaded!!!");
                        
                        conn.close();
                          
// File myTestFile= new File(Api.CONTEXT_PATH+fileName);
//String path = myTestFile.getAbsoluteFile().toString();
//System.out.println(path);
                        
                   
                    RequestDispatcher rt=request.getRequestDispatcher("upload_form1.jsp");
                    rt.include(request, response);
                    
                 
                    }
                    else
                    {
                        out.println("Couldn't upload your file!!!");
                        conn.close();
                        
                        RequestDispatcher rs = request.getRequestDispatcher("upload_form1.jsp");
                        rs.include(request, response);
                    }
                    
                    
                    
                   }
                }
                 catch(Exception e)
                {
                    e.printStackTrace();
                }     
   
    }

     @SuppressWarnings("empty-statement")
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
    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
