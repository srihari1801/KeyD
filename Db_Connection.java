package database;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Db_Connection 
{
    public Connection Connection()
    {
        try 
        {
            Class.forName("com.mysql.jdbc.Driver");
            //String TechWorld = "jdbc:mysql://localhost:3306/duplication";
           // Connection myConnection = DriverManager.getConnection("jdbc:mysql://sql12.freemysqlhosting.net:3306/sql12259565","sql12259565","Riyasen$234");
             Connection myConnection=DriverManager.getConnection("jdbc:mysql://localhost:3306/duplication","root","root");
            return myConnection;
        } 
        catch (ClassNotFoundException | SQLException ex) 
            {
                Logger.getLogger(Db_Connection.class.getName()).log(Level.SEVERE, null, ex);
            }
        return null;
    }
}
