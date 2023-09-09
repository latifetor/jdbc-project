package com.cydeo.jdbctests;

import java.sql.*;

public class TestOracleConnection {

    public static void main(String[] args) throws SQLException {

        // CONNECTION STRING:
        String dbUrl= "jdbc:oracle:thin:@44.195.25.11:1521:XE";
        String dbUsername="hr";
        String dbPassword="hr";

        //Create the connection:
        //DriverManager class getConnection Method will help to connect database
        Connection conn = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);

        //It will help us to execute queries
        Statement statement = conn.createStatement();

        //ResultSet will store data after execution.  ONLY data (no table info)
        ResultSet rs = statement.executeQuery("select * from REGIONS");

        // RETRIEVING DATA:

        rs.next();
        System.out.println("-----FIRST ROW-----");
            // now pointer is in the first row
            // how to retrieve the data from first row? provide which column information needs
            // rs.getInt(index) SQL index starts from 1
        System.out.println(rs.getInt(1)); //1
            // rs.getString(index) get the REGION_NAME 1st row information
        System.out.println(rs.getString(2)); //Europe

        //same information we can get with columnLabel not column index
        System.out.println(rs.getInt("REGION_ID")); // 1
        System.out.println(rs.getString("REGION_NAME")); //Europe

        // get 2nd row result in following format: 2 - Americas
        System.out.println("-----SECOND ROW-----");
        // we need to move pointer to second row
        rs.next();
        System.out.println(rs.getInt(1)+" - "+rs.getString(2)); // 2 - Americas

        // get 3nd row result in following format: 3 - Asia
        System.out.println("-----THIRD ROW-----");
        // we need to move pointer to third row
        rs.next();
        System.out.println(rs.getInt("REGION_ID")+" - "+rs.getString("REGION_NAME")); // 3 - Asia

        // get 4nd row result in following format: 4 - Middle East and Africa
        System.out.println("-----FOURTH ROW-----");
        // we need to move pointer to third row
        rs.next();
        System.out.println(rs.getInt("REGION_ID")+" - "+rs.getString(2));
            // 4 - Middle East and Africa


        // what if we have 100 rows, we want to print first and second column
        while (rs.next()){
            System.out.println(rs.getInt("REGION_ID")+" - "+rs.getString(2));
        }

        // close the connection each time after execution from DB
        // closing the ResultSet, statement, and connection
        rs.close();
        statement.close();
        conn.close();



    }
}
