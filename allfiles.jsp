<%-- 
    Document   : allfiles
    Created on : Nov 10, 2018, 3:41:34 PM
    Author     : Priya
--%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <div class="panel">

	            <h1>Uploaded Files</h1>15
	            <table class="bordered_table">

	               <thead>

	                  <tr align="center"><th>File Name</th><th>File Size</th><th>Action</th></tr>

	               </thead>

	               <tbody>

	                  <% List<UploadDetail> uploadDetails = (List<UploadDetail>)request.getAttribute("uploadedFiles");

	                     if(uploadDetails != null && uploadDetails.size() > 0) {

	                     for(int i=0; i<uploadDetails.size(); i++) {

	                  %>

	                  <tr>

	                     <td align="center"><span id="fileName"><%=uploadDetails.get(i).getFileName() %></span></td>

	                     <td align="center"><span id="fileSize"><%=uploadDetails.get(i).getFileSize() %> KB</span></td>

	                     <td align="center"><span id="fileDownload"><a id="downloadLink" class="hyperLink" href="<%=request.getContextPath()%>/downloadServlet?fileName=<%=uploadDetails.get(i).getFileName() %>">Download</a></span></td>

	                  </tr>

	                  <% }

	                   } else { %>
31
	                  <tr>
32
	                     <td colspan="3" align="center"><span id="noFiles">No Files Uploaded.....!</span></td>
33
	                  </tr>
34
	                  <% } %>
35
	               </tbody>
36
	            </table>
37
	            <div class="margin_top_15px">
38
	               <a id="fileUpload" class="hyperLink" href="<%=request.getContextPath()%>/fileupload.jsp">Back</a>
39
	            </div>
40
	         </div>
    </body>
</html>
