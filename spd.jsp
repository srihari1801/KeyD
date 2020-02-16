<%@page import="java.io.OutputStreamWriter"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.BufferedWriter"%>
<%!String line = "";%>
<%

         
        try {
            FileInputStream fs = new FileInputStream("C:\\Users\\Priya\\Desktop\\ss.txt");
            BufferedReader br = new BufferedReader(new InputStreamReader(fs));
            
            int count = 0;
            FileOutputStream fos = new FileOutputStream("C:\\Users\\Priya\\Desktop\\" + count + ".txt");
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(fos));             
            while ((line = br.readLine()) != null) {
                String mine = line.trim();              
                if (mine.startsWith("_")) 
                   break;                                        
                bw.write(mine);
                bw.newLine();
                bw.flush();
                count++;
                
    
                 
            }
 
        } catch (Exception e) {
            System.out.println("Exception: " + e);
        }%>