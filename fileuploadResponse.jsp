<%-- 
    Document   : fileuploadResponse
    Created on : Nov 10, 2018, 3:40:00 PM
    Author     : Priya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="panel">

	            <h1>File Upload Status</h1>

	            <table class="bordered_table">

	                <thead>

	                    <tr align="center"><th>File Name</th><th>File Size</th><th>Upload Status</th><th>Action</th></tr>

	                </thead>

	                <tbody>

	                    <% List<UploadDetail> uploadDetails = (List<UploadDetail>)request.getAttribute("uploadedFiles");

	                        for(int i=0; i<uploadDetails.size(); i++) {

	                    %>

	                    <tr>

	                        <td align="center"><span id="fileName"><%=uploadDetails.get(i).getFileName() %></span></td>

	                        <td align="center"><span id="fileSize"><%=uploadDetails.get(i).getFileSize() %> KB</span></td>

	                        <td align="center"><span id="fileuploadStatus"><%=uploadDetails.get(i).getUploadStatus() %></span></td>

	                        <td align="center"><span id="fileDownload"><a id="downloadLink" class="hyperLink" href="<%=request.getContextPath()%>/downloadServlet?fileName=<%=uploadDetails.get(i).getFileName() %>">Download</a></span></td>                                       

	                    </tr>

	                    <% } %>

	                </tbody>

	            </table>

	            <div class="margin_top_15px">

	                <a id="fileUpload" class="hyperLink" href="<%=request.getContextPath()%>/fileupload.jsp">Back</a>

	            </div>

	        </div>
    </body>
</html>
