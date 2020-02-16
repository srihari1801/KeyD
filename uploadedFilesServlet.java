/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Priya
 */
//@WebServlet(description = "List The Already Uploaded Files", urlPatterns = { "/uploadedFilesServlet" })
@WebServlet(description = "List The Already Uploaded Files", urlPatterns = { "/uploadedFilesServlet" })
public class uploadedFilesServlet extends HttpServlet {

    
    private static final long serialVersionUID = 1L;
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
            out.println("<title>Servlet uploadedFilesServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet uploadedFilesServlet at " + request.getContextPath() + "</h1>");
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

    private void handleRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         String applicationPath = getServletContext().getRealPath(""),

	                uploadPath = applicationPath + File.separator + UPLOAD_DIR;

	 

	        File fileUploadDirectory = new File(uploadPath);

	        if (!fileUploadDirectory.exists()) {

	            fileUploadDirectory.mkdirs();

	        }

	 

	        UploadDetail details = null;

	        File[] allFiles = fileUploadDirectory.listFiles();

	        List<UploadDetail> fileList = new ArrayList<UploadDetail>();        

	 

	        for (File file : allFiles) {

	            details = new UploadDetail();

	            details.setFileName(file.getName());

	            details.setFileSize(file.length() / 1024);

	            fileList.add(details);

	        }

	 

	        request.setAttribute("uploadedFiles", fileList);
  RequestDispatcher dispatcher = request.getRequestDispatcher("/allfiles.jsp");

	        dispatcher.forward(request, response); 
	       // RequestDispatcher dispatcher = request.getRequestDispatcher("/allfiles.jsp");

	        //dispatcher.forward(request, response);

	    }
        

}
