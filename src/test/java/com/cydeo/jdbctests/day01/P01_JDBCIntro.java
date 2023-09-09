package com.cydeo.jdbctests.day01;

import org.junit.jupiter.api.Test;

import java.sql.*;

public class P01_JDBCIntro {

    String dbUrl = "jdbc:oracle:thin:@44.195.25.11:1521:XE";
    String dbUsername = "hr";
    String dbPassword = "hr";

    @Test
    public void task1() throws SQLException {
        // create the connection
        Connection conn = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);

        //It will help us to execute queries
        Statement statement = conn.createStatement();

        //ResultSet will store data after execution.  ONLY data (no table info)
        ResultSet rs = statement.executeQuery("select * from DEPARTMENTS where MANAGER_ID is not null");

        //10-Administration-200-1700

        while (rs.next()){
            System.out.println(rs.getInt(1)+"-"+rs.getString(2)+"-"+rs.getInt(3)
            +"-"+rs.getInt(4));
        }

        System.out.println("-----------------------------");
        // can we run another query in same connection  - YES
        rs = statement.executeQuery("select * from LOCATIONS");

        //STREET_ADDRESS - CITY
        while (rs.next()){
            System.out.println(rs.getString(2)+" - "+rs.getString(4));
        }

        rs.close();
        statement.close();
        conn.close();


    }
}
