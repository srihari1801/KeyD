/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;

	import java.io.FileInputStream;

	import java.io.IOException;

	import java.io.OutputStream;

	import javax.servlet.ServletException;

	import javax.servlet.annotation.WebServlet;

	import javax.servlet.http.HttpServlet;

	import javax.servlet.http.HttpServletRequest;

	import javax.servlet.http.HttpServletResponse;
/**
 *
 * @author Priya
 */
@WebServlet(description = "Download File From The Server", urlPatterns = { "/downloadServlet" })
public class FileDownloadServlet extends HttpServlet {

      private static final long serialVersionUID = 1L;

	 

	    public static int BUFFER_SIZE = 1024 * 100;

	    public static final String UPLOAD_DIR = "uploadedFiles";
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
            out.println("<title>Servlet FileDownloadServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet FileDownloadServlet at " + request.getContextPath() + "</h1>");
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
                handleRequest(request, response);
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

    private void handleRequest(HttpServletRequest request, HttpServletResponse response) throws IOException {
       String fileName = request.getParameter("fileName"),

	                applicationPath = getServletContext().getRealPath(""),

	                downloadPath = applicationPath + File.separator + UPLOAD_DIR,

	                filePath = downloadPath + File.separator + fileName;

	 

	        File file = new File(filePath);

	        OutputStream outStream = null;

	        FileInputStream inputStream = null;

	 

	        if (file.exists()) {

	 

	            /**** Setting The Content Attributes For The Response Object ****/

	            String mimeType = "application/octet-stream";

	            response.setContentType(mimeType);

	 

	            /**** Setting The Headers For The Response Object ****/

	            String headerKey = "Content-Disposition";

	            String headerValue = String.format("attachment; filename=\"%s\"", file.getName());

	            response.setHeader(headerKey, headerValue);

	 

	            try {

	 

	                /**** Get The Output Stream Of The Response ****/

	                outStream = response.getOutputStream();

	                inputStream = new FileInputStream(file);

	                byte[] buffer = new byte[BUFFER_SIZE];

	                int bytesRead = -1;

	 

	                /**** Write Each Byte Of Data Read From The Input Stream Write Each Byte Of Data  Read From The Input Stream Into The Output Stream ****/

	                while ((bytesRead = inputStream.read(buffer)) != -1) {

	                    outStream.write(buffer, 0, bytesRead);

	                }               

	            } catch(IOException ioExObj) {

	                System.out.println("Exception While Performing The I/O Operation?= " + ioExObj.getMessage());

	            } finally {             

	                if (inputStream != null) {

	                    inputStream.close();

	                }

	 

	                outStream.flush();

	                if (outStream != null) {

	                    outStream.close();

	                }

	            }

	        } else {

	 

	            /***** Set Response Content Type *****/

	            response.setContentType("text/html");

	 

	            /***** Print The Response *****/

	            response.getWriter().println("<h3>File "+ fileName +" Is Not Present .....!</h3>");

	        }

	    }
    

}
