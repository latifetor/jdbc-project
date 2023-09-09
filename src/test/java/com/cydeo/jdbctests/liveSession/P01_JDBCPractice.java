package com.cydeo.jdbctests.liveSession;

import org.junit.jupiter.api.Test;

import java.sql.*;

public class P01_JDBCPractice {

    String dbUrl="jdbc:oracle:thin:@54.237.226.155:1521:XE";
    String dbPassword="hr";
    String dbUsername="hr";

    @Test
    public void jdbcPractice() throws SQLException {

        //Driver Manager class will help us to create conn with provided database connection String
        Connection conn = DriverManager.getConnection(dbUrl, dbPassword, dbUsername);

        //It will create statement object to execute queries
        Statement stmnt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);

        // It will store all data that we are getting after execution
        ResultSet rs = stmnt.executeQuery("select COUNTRY_ID,CITY from LOCATIONS");

        ResultSetMetaData rsmd = rs.getMetaData();
        

        /*
            RETRIEVING DATA
         */
        System.out.println("---------FIRST ROW-------");
        rs.next();
        System.out.println(rs.getString(1)+" - "+rs.getString(2));

        System.out.println("---------2nd ROW-------");
        rs.next();
        System.out.println(rs.getString(1)+" - "+rs.getString(2));

        System.out.println("---------10th ROW-------");
        rs.absolute(10);
        System.out.println(rs.getString(1)+" - "+rs.getString(2));

        System.out.println("---------getROW-------");
        System.out.println(rs.getRow());

        System.out.println("---------How many row we have-------");
        rs.last();
        System.out.println(rs.getRow());

        System.out.println("---------PREVIOUS ROW-------");
        rs.previous();
        System.out.println(rs.getString(1)+" - "+rs.getString(2));

        // PRINT ALL DATA DYNAMICALLY
        System.out.println("--------PRINT ALL DATA DYNAMICALLY--------");
        rs.beforeFirst();
        while (rs.next()){
            System.out.println(rs.getString(1)+" - "+rs.getString(2));
        }
        
        System.out.println("--------HOW MANY COLUMN --------");
        int columnCount = rsmd.getColumnCount();
        System.out.println(columnCount);

        System.out.println("--------COLUMN_NAME --------");
        System.out.println(rsmd.getColumnName(1));

        System.out.println("-------PRINT ALL THE COLUMN_NAME DYNAMICALLY--------");
        for (int i = 1; i <= columnCount; i++) {
            System.out.println(rsmd.getColumnName(i));
        }

        System.out.println("-------PRINT ALL DATA DYNAMICALLY--------");
        // COUNTRY_ID- IT CITY - Roma
        // COUNTRY_ID- IT CITY - Venice

        //to reset cursor
        rs.beforeFirst();
        // Iterate each row dynamically
        while (rs.next()){
            // iterate each column dynamically
            for (int i = 1; i <= columnCount; i++) {
                System.out.print(rsmd.getColumnName(i)+" - "+rs.getString(i));

            }
            System.out.println();
        }


        rs.close();
        stmnt.close();
        conn.close();


    }
}
