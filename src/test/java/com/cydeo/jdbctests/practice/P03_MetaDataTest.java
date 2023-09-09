package com.cydeo.jdbctests.practice;

import org.junit.jupiter.api.Test;

import java.sql.*;

public class P03_MetaDataTest {

    String dbUrl = "jdbc:oracle:thin:@44.195.25.11:1521:XE";
    String dbPassword = "hr";
    String dbUsername = "hr";

    @Test
    public void flexibleNavigation() throws SQLException {

        Connection conn = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
        DatabaseMetaData dbMetaData = conn.getMetaData();

        System.out.println("dbMetaData.getUserName() = " + dbMetaData.getUserName());
        System.out.println("dbMetaData.getDriverName() = " + dbMetaData.getDriverName());
        System.out.println("dbMetaData.getDriverVersion() = " + dbMetaData.getDriverVersion());
        System.out.println("dbMetaData.getDatabaseProductName() = " + dbMetaData.getDatabaseProductName());
        System.out.println("dbMetaData.getDatabaseProductVersion() = " + dbMetaData.getDatabaseProductVersion());


        conn.close();

    }

    @Test
    public void rsMetaData() throws SQLException {

        Connection conn = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
        Statement stmnt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);

        //ResultSet rs = stmnt.executeQuery("select COUNTRY_ID,COUNTRY_NAME from COUNTRIES");

        //ResultSet rs = stmnt.executeQuery("select * from COUNTRIES");

        //ResultSet rs = stmnt.executeQuery("select * from EMPLOYEES");

        // ResultSet rs = stmnt.executeQuery("select * from COUNTRIES");

        ResultSet rs = stmnt.executeQuery("select * from REGIONS");

        // ResultSetMetaData --> it si data about table itself
        // we will get information about columnCount and ColumnName

        ResultSetMetaData rsmd = rs.getMetaData();

        // How many column we have?
        int columnCount = rsmd.getColumnCount();
        System.out.println(columnCount);  //2 // 3 // 11

        // What is the second column name
        System.out.println(rsmd.getColumnName(2)); //COUNTRY_NAME // COUNTRY_NAME // FIRST_NAME

        // using forLoop get all the columnNames
        // column index start from 1
        for (int i = 1; i <= columnCount; i++) {
            System.out.println("rsmd.getColumnName(i) = " + rsmd.getColumnName(i));
        }

        // COUNTRY_ID - AR COUNTRY_NAME - Argentina REGION_ID - 2
        // iterate each row dynamically

            while(rs.next()){
                // iterate each column
                for (int i = 1; i <= columnCount; i++) {
                    System.out.print(rsmd.getColumnName(i)+" - "+rs.getString(i)+" ");
                }
                System.out.println();
            }




        rs.close();

        stmnt.close();

        conn.close();
    }







}
