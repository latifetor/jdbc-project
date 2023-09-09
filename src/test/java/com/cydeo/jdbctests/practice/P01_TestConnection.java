package com.cydeo.jdbctests.practice;

import java.sql.*;

public class P01_TestConnection {

    public static void main(String[] args) throws SQLException {

        // Connection String
        String dbUrl= "jdbc:oracle:thin:@44.195.25.11:1521:XE";
        String dbPassword="hr";
        String dbUsername="hr";

        // DriverManager will help us to create Connection
         Connection conn = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);

         // create statement method will create statement to execute queries
        Statement stmnt = conn.createStatement();

        // We store all information in ResultSet
        ResultSet rs = stmnt.executeQuery("select COUNTRY_ID,COUNTRY_NAME from countries");

    /*
        // RETRIEVE DATA
        // As a default it shows beforeFirst()
        // use next() method to jump in first row

        rs.next(); // true if the new current row is valid; false if there are no more rows

        // Print COUNTRY_ID from first column (COUNTRY_ID)
        System.out.println("rs.getString(1) = " + rs.getString(1));
            // rs.getString(1) = AR
        System.out.println("rs.getString(\"country_id\") = " + rs.getString("country_id"));
            // rs.getString("country_id") = AR

        // Print COUNTRY_NAME from second column (COUNTRY_NAME)
        System.out.println("rs.getString(2) = " + rs.getString(2));
            // rs.getString(2) = Argentina
        System.out.println("rs.getString(\"country_name\") = " + rs.getString("country_name"));
            // rs.getString("country_name") = Argentina


        rs.next();
        // Print country-id and country_name in following format
        // COUNTRY_ID - COUNTRY_NAME
        // AR - Argentina

        System.out.println(rs.getString(1)+" - "+rs.getString(2)); // AU - Australia

        rs.next();
        System.out.println(rs.getString(1)+" - "+rs.getString(2));  //BE - Belgium

        rs.next();
        System.out.println(rs.getString(1)+" - "+rs.getString(2));  //BR - Brazil

     */
        // what if we have 1000 rows
        while (rs.next()){
            System.out.println(rs.getString(1)+" - "+rs.getString(2));
        }

        rs.close();
        stmnt.close();
        conn.close();


    }
}
