import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;


public class SplitFileExample {
        private static String FILE_NAME = "E:\\demo1\\ss.txt";
        private static String FILE_NAME1 = "E:\\demo1\\new\\ss.txt";
	//private static byte PART_SIZE =  120;//4MB  5 * 2^10 * 2^3
	public static void main(String[] args) {
            
        }
        void call()
        {
        File inputFile = new File(FILE_NAME);
		FileInputStream inputStream;
		String newFileName;
		FileOutputStream filePart;
		int fileSize = (int) inputFile.length();
		int nChunks = 0, read = 0, readLength = 4096;//4kb
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
				newFileName = FILE_NAME1 + ".part"
						+ Integer.toString(nChunks - 1);
				filePart = new FileOutputStream(new File(newFileName));
				filePart.write(byteChunkPart);
				filePart.flush();
				filePart.close();
				byteChunkPart = null;
				filePart = null;
			}
			inputStream.close();
		}
                catch (IOException exception) 
                {
			exception.printStackTrace();
		}
	}
}
