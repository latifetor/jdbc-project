package com.cydeo.jdbctests.day01;

import org.junit.jupiter.api.Test;

import java.sql.*;

public class P03_MetaData {


    String dbUrl = "jdbc:oracle:thin:@44.195.25.11:1521:XE";
    String dbUsername = "hr";
    String dbPassword = "hr";

    @Test
    public void task1() throws SQLException {
        Connection conn = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);

        Statement statement = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);

        ResultSet rs = statement.executeQuery("select * from REGIONS");
        //ResultSet rs = statement.executeQuery("select * from DEPARTMENTS");
        //ResultSet rs = statement.executeQuery("select FIRST_NAME,LAST_NAME,SALARY  from EMPLOYEES where ROWNUM<6");

        // DatabaseMetaData: comes from CONNECTION object= conn
        // create object of DatabaseMetaData.interface
        DatabaseMetaData dbMetaData = conn.getMetaData();

        System.out.println(dbMetaData.getUserName()); // getUserName: HR
        System.out.println(dbMetaData.getDatabaseProductName()); //Oracle
        System.out.println(dbMetaData.getDatabaseProductVersion()); // Oracle Database 11g Express Edition Release 11.2.0.2.0 - 64bit Production
        System.out.println(dbMetaData.getDriverVersion()); // 21.9.0.0.0
        System.out.println(dbMetaData.getDriverName()); //Oracle JDBC driver

        // ResultSetMetaData
        // from ResultSet.object= rs, create object of ResultSetDataMeta.interface

        ResultSetMetaData rsmd = rs.getMetaData();

        // this can not get it out from ResultSet.object

        System.out.println("---------getColumnCount-------------");
        // how many column I have?
        int columnCount = rsmd.getColumnCount();
            // dynamically it's capturing and providing the number of column available
        System.out.println(columnCount);

        System.out.println("---------getColumnName-------------");
        // get the column_name for index 2
    //    System.out.println(rsmd.getColumnName(2)); // FIRST_NAME
    //    System.out.println(rsmd.getColumnName(1)); // PHONE_NUMBER


        System.out.println("---------getColumnName (dynamic)-------------");
        // Print all the column_name dynamically
        for (int i = 1; i <= rsmd.getColumnCount(); i++) {
            // index starts from index1, and equals as the number of column
            System.out.println(rsmd.getColumnName(i));
        }

        /*
            ResultSet --> it holds table data
                rs.next() --> it iterate each row dynamically (with while loop)
                rs.getString(columnIndex) --> retrieve the information
                rs.getString(columnName)

            ResultSetDataMeta --> it holds table information (ColumnName, ColumnCount)
                rsmd.getColumnCount() --> how many columns we have
                rsmd.getColumnName(index) --> it will give specific column name
         */
        // write a code, that print whole table information for every query
        // column Name - Column vale
        // EMPLOYEE_ID - 100
        // FIRST_NAME - Steven

        System.out.println("---------PRINT ALL DATA DYNAMICALLY-----");

        //Iterate through each row
        while (rs.next()){
            // whatever we do, we will do for each row.
            // REGION_ID - 1 REGION_NAME - Europe
            // REGION_ID - 2 REGION_NAME - Americas
            //System.out.println(rsmd.getColumnName(1)+" - "+rs.getString(1));

            for (int i = 1; i <= columnCount; i++) {
                System.out.println(rsmd.getColumnName(i)+"-"+rs.getString(i)+" ");

            }
        }

        rs.close();
        statement.close();
        conn.close();

    }
}
