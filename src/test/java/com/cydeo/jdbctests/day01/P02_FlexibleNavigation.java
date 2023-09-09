package com.cydeo.jdbctests.day01;

import org.junit.jupiter.api.Test;

import java.sql.*;

public class P02_FlexibleNavigation {
    //CONNECTION STRING
    String dbUrl = "jdbc:oracle:thin:@44.195.25.11:1521:XE";
    String dbUsername = "hr";
    String dbPassword = "hr";

    @Test
    public void task1() throws SQLException {
        Connection conn = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);

        //Statement statement = conn.createStatement();
        Statement statement = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
            // UPDATE: create statement
            // ResultSet.TYPE_SCROLL_INSENSITIVE --> set to do flexible navigation between rows
            // ResultSet.CONCUR_READ_ONLY --> set to do not update anything from DB, only read

        ResultSet rs = statement.executeQuery("select FIRST_NAME,LAST_NAME from EMPLOYEES");

        //first row
        rs.next();
        System.out.println(rs.getString(1)+" "+rs.getString(2)); // Ellen Abel

        //second row
        rs.next();
        System.out.println(rs.getString(1)+" "+rs.getString(2));// Sundar Ande

        System.out.println("---------last();-----------");
        //to get the last row data
        rs.last();
        System.out.println(rs.getString(1)+" "+rs.getString(2)); // Eleni Zlotkey

        //how many rows we have (last + getRow)
        int rowNumber = rs.getRow(); //the current row number; 0 if there is no current row
        System.out.println("rowNumber = " + rowNumber); // rowNumber = 107

        System.out.println("---------absolute();-----------");
        // to get specific row 
        // using absolute() method= move to any row by using row number
        // true if the cursor is moved to a position in this ResultSet object;
        // false if the cursor is before the first row or after the last row
        rs.absolute(46);
        System.out.println(rs.getString(1)+" "+rs.getString(2)); // Alexandar Hunold

        System.out.println("---------previous();-----------");
        // to go one row back using previous() method
        // true if the cursor is now positioned on a valid row;
        // false if the cursor is positioned before the first row
        rs.previous();
        System.out.println(rs.getString(1)+" "+rs.getString(2)); // Guy Himuro

        System.out.println("---------print the whole table-----------");
        // since the pointer is in the row 45, from the previous execution
        // to be able to get back to the default row again before whileLoop

        rs.first(); // jump into first row
        rs.beforeFirst(); // jump into before first row

        while (rs.next()){
            System.out.println(rs.getString(1)+" "+rs.getString(2));

        }




        rs.close();
        statement.close();
        conn.close();
    }

}
