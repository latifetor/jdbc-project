package com.cydeo.jdbctests.practice;

import org.junit.jupiter.api.Test;

import java.sql.*;

public class P02_FlexibleNavigation {

    // Connection String
    String dbUrl= "jdbc:oracle:thin:@44.195.25.11:1521:XE";
    String dbPassword="hr";
    String dbUsername="hr";

    @Test
    public void flexibleNavigation() throws SQLException {

        Connection conn = DriverManager.getConnection(dbUrl,dbUsername,dbPassword);

        Statement stmnt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);


        ResultSet rs = stmnt.executeQuery("select COUNTRY_ID,COUNTRY_NAME from countries");

        // RETRIEVE DATA
        rs.next();
        System.out.println("-------FIRST ROW ---------");//AR - Argentina
        System.out.println(rs.getString(1)+" - "+rs.getString(2));

        rs.next();
        System.out.println("--------SECOND ROW -------");// AU - Australia
        System.out.println(rs.getString(1)+" - "+rs.getString(2));

        // ResultSet.TYPE_SCROLL_INSENSITIVE    --> to make flexible navigation
        // ResultSet.CONCUR_READ_ONLY           --> to make ResultSet Object not updatable

        // get data from row 10
        rs.absolute(10);
        System.out.println("---------10th ROW ---------"); //EG - Egypt
        System.out.println(rs.getString(1)+" - "+rs.getString(2));

        System.out.println("----------GET ROW ---------");//rs.getRow() = 10
        System.out.println("rs.getRow() = " + rs.getRow());

        //how many row we have?
        rs.last();
        System.out.println(rs.getString(1)+" - "+rs.getString(2)); // ZW - Zimbabwe
        System.out.println(rs.getRow()); // 25

        rs.previous();
        System.out.println("-----------PREVIOUS ROW ---------");// ZM - Zambia
        System.out.println(rs.getString(1)+" - "+rs.getString(2));

        rs.first();
        System.out.println("-----------FIRST ROW ---------"); // AR - Argentina

        System.out.println(rs.getString(1)+" - "+rs.getString(2));

        System.out.println("--------PRINT ALL COUNTRY IDs and COUNTRY NAMES---------");

        rs.beforeFirst();
        System.out.println("--------BEFORE FIRST IS USED---------");
        while (rs.next()){
            System.out.println(rs.getString(1)+" - "+ rs.getString(2));
        }


        rs.close();
        stmnt.close();
        conn.close();
    }
}
