
<%@page import="java.io.IOException"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.BufferedWriter"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.BufferedReader"%>
<%
try
{
 ArrayList<String> list = new ArrayList<String>();
        BufferedReader br = null;
        BufferedReader r = null;
        try
        {
            for(int i=0;i<3;i++)
            {
               String b="block";
               b=b+Integer.toString(i);
               out.println(b);
               String path="C:\\Users\\Priya\\Desktop\\2012."+b+".csv";
                 out.println(path);
            br = new BufferedReader(new FileReader(path));
           
            String s1 =null;
            String s2 = null;

            while ((s1 = br.readLine()) != null){                         
                list.add(s1);        
            }
            }
            
        }
        catch (IOException e){
            e.printStackTrace();
            int FLAG =1; 
        }finally{
            br.close();
            r.close();
        }


        BufferedWriter writer=null;
        writer = new BufferedWriter(new FileWriter("C:\\Users\\Priya\\Desktop\\pt.xlsv"));
        String listWord;              
        for (int i = 0; i< list.size(); i++){
            listWord = list.get(i);
            writer.write(listWord);
            writer.write("\n");
        }

        writer.close();    
    }
//config.getServletContext().getRealPath("/");

catch(Exception ex)
{

}
%>