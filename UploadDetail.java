
import java.io.Serializable;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Priya
 */
public class UploadDetail implements Serializable{
   private long fileSize;
   private String fileName,uploadStatus;
   private static final long serialVersionUID=1L;
   
            public long getFileSize() {

	        return fileSize;

	    }

	 

	    public void setFileSize(long fileSize) {

	        this.fileSize = fileSize;

	    }

	 

	    public String getFileName() {

	        return fileName;

	    }

	 

	    public void setFileName(String fileName) {

	        this.fileName = fileName;

	    }

	 

	    public String getUploadStatus() {

	        return uploadStatus;

	    }

	 

	    public void setUploadStatus(String uploadStatus) {

	        this.uploadStatus = uploadStatus;

	    }
   
}
