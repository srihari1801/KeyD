
<%@page import="sun.audio.AudioPlayer"%>
<%@page import="sun.audio.AudioStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%
// open the sound file as a Java input stream


  //C:\Users\Priya\AppData\Local\Temp\Enna-Solla-Pogirai.mp3
//    String gongFile = " C:/Users/Priya/AppData/Local/Temp/Enna-Solla-Pogirai.mp3 ";
//    
//      gongFile = gongFile.replace("/", "\\");
//    InputStream in = new FileInputStream(gongFile);
//
//    // create an audiostream from the inputstream
//    AudioStream audioStream = new AudioStream(in);
//
//    // play the audio clip with the audioplayer class
//    AudioPlayer.player.start(audioStream);
    

%>

<%

//** add this into your application code as appropriate
// Open an input stream to the audio file.
//InputStream in = new FileInputStream("C:/Users/Priya/AppData/Local/Temp/Enna-Solla-Pogirai.mp3");
//// Create an AudioStream object from the input stream.
//AudioStream as = new AudioStream(in);
//// Use the static class member "player" from class AudioPlayer to play
//// clip.
//AudioPlayer.player.start(as);
//// Similarly, to stop the audio.
//AudioPlayer.player.stop(as); 
%>
<%
    InputStream in;
         
            in = new FileInputStream(new File("? C:\\Users\\Priya\\Downloads\\Enna-Solla-Pogirai.mp3"));
            
            AudioStream audio = new AudioStream(in);
            AudioPlayer.player.start(audio);
%>