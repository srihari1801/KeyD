/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Priya
 */

import java.io.FileInputStream;
import java.io.IOException;
import java.security.DigestInputStream;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class FileCheckSum {
    public static void main(String[] args) throws NoSuchAlgorithmException, IOException {

        MessageDigest md = MessageDigest.getInstance("SHA-256");
        byte[] hashInBytes = checksum("E:\\hai.pdf", md);
        System.out.println(bytesToHex(hashInBytes));

    }

  
    @SuppressWarnings("empty-statement")
    
    private static byte[] checksum(String filepath, MessageDigest md) throws IOException 
    {

        try (DigestInputStream dis = new DigestInputStream(new FileInputStream(filepath), md)) 
        {
            while (dis.read() != -1) ; //empty loop to clear the data
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
}
