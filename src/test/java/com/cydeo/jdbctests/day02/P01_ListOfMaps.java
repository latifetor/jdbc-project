package com.cydeo.jdbctests.day02;

import org.junit.jupiter.api.Test;

import java.sql.*;
import java.util.*;


public class P01_ListOfMaps {

    String dbUrl = "jdbc:oracle:thin:@44.195.25.11:1521:XE";
    String dbUsername = "hr";
    String dbPassword = "hr";

    @Test
    void task1() {

        Map<String, Object> rowMap1 = new HashMap<>();
//      Map<String, Object> rowMap1 = new LinkedHashMap<>(); GOOD WITH ORDER

        System.out.println("------ ROW MAP1-------");
        rowMap1.put("FIRST_NAME", "Steven");
        rowMap1.put("LAST_NAME", "King");
        rowMap1.put("SALARY", 24000);

        System.out.println(rowMap1); //{SALARY=24000, LAST_NAME=King, FIRST_NAME=Steven}

        Map<String, Object> rowMap2 = new HashMap<>();

        System.out.println("------ ROW MAP2-------");
        rowMap2.put("FIRST_NAME", "Neena");
        rowMap2.put("LAST_NAME", "Kochhar");
        rowMap2.put("SALARY", 17000);
        System.out.println(rowMap2);

        Map<String, Object> rowMap3 = new HashMap<>();

        System.out.println("------ ROW MAP3-------");
        rowMap3.put("FIRST_NAME", "Lex");
        rowMap3.put("LAST_NAME", "De Haan");
        rowMap3.put("SALARY", 17000);
        System.out.println(rowMap3);

        Map<String, Object> rowMap4 = new HashMap<>();

        System.out.println("------ ROW MAP4-------");
        rowMap4.put("FIRST_NAME", "Alexander");
        rowMap4.put("LAST_NAME", "Hunold");
        rowMap4.put("SALARY", 9000);
        System.out.println(rowMap4);

        Map<String, Object> rowMap5 = new HashMap<>();

        System.out.println("------ ROW MAP5-------");
        rowMap5.put("FIRST_NAME", "Bruce");
        rowMap5.put("LAST_NAME", "Ernst");
        rowMap5.put("SALARY", 6000);
        System.out.println(rowMap5);

        // we need to store inside the List
        List<Map<String, Object>> dataList = new ArrayList<>();

        // we will put each of the row map to the list
        dataList.add(rowMap1);
        dataList.add(rowMap2);
        dataList.add(rowMap3);
        dataList.add(rowMap4);
        dataList.add(rowMap5);

        // get all the data
        System.out.println(dataList);

        // retrieve the data from the List by using get(index)
        System.out.println(dataList.get(0).get("LAST_NAME"));  //King

        System.out.println(dataList.get(1).get("LAST_NAME"));  //Kochhar

    }

    @Test
    public void task2() throws SQLException {


        Connection conn = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
        Statement statement = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        ResultSet rs = statement.executeQuery("select FIRST_NAME,LAST_NAME,SALARY from EMPLOYEES where ROWNUM<6");

        // create rsmd to get column name and count
        ResultSetMetaData rsmd = rs.getMetaData();
        // we need to move to first row to fill rowMap1
        rs.next();

        // we will slowly replace static part
        Map<String, Object> rowMap1 = new HashMap<>();

        System.out.println("------ ROW MAP1-------");
        rowMap1.put(rsmd.getColumnName(1), rs.getString(1));
        rowMap1.put(rsmd.getColumnName(2), rs.getString(2));
        rowMap1.put(rsmd.getColumnName(3), rs.getInt(3));
        System.out.println(rowMap1); //{SALARY=24000, LAST_NAME=King, FIRST_NAME=Steven}

        rs.next(); // move pointer to second row
        Map<String, Object> rowMap2 = new HashMap<>();

        System.out.println("------ ROW MAP2-------");
        rowMap2.put(rsmd.getColumnName(1), rs.getString(1));
        rowMap2.put(rsmd.getColumnName(2), rs.getString(2));
        rowMap2.put(rsmd.getColumnName(3), rs.getInt(3));
        System.out.println(rowMap2);

        rs.next();
        Map<String, Object> rowMap3 = new HashMap<>();

        System.out.println("------ ROW MAP3-------");
        rowMap3.put(rsmd.getColumnName(1), rs.getString(1));
        rowMap3.put(rsmd.getColumnName(2), rs.getString(2));
        rowMap3.put(rsmd.getColumnName(3), rs.getInt(3));
        System.out.println(rowMap3);

        rs.next();
        Map<String, Object> rowMap4 = new HashMap<>();

        System.out.println("------ ROW MAP4-------");
        rowMap4.put(rsmd.getColumnName(1), rs.getString(1));
        rowMap4.put(rsmd.getColumnName(2), rs.getString(2));
        rowMap4.put(rsmd.getColumnName(3), rs.getInt(3));
        System.out.println(rowMap4);

        rs.next();
        Map<String, Object> rowMap5 = new HashMap<>();

        System.out.println("------ ROW MAP5-------");
        rowMap5.put(rsmd.getColumnName(1), rs.getString(1));
        rowMap5.put(rsmd.getColumnName(2), rs.getString(2));
        rowMap5.put(rsmd.getColumnName(3), rs.getInt(3));
        System.out.println(rowMap5);

        List<Map<String, Object>> dataList = new ArrayList<>();

        // we will put each of the row map to the list
        dataList.add(rowMap1);
        dataList.add(rowMap2);
        dataList.add(rowMap3);
        dataList.add(rowMap4);
        dataList.add(rowMap5);

        // get all the data
        System.out.println(dataList);
        System.out.println(dataList.get(2).get("SALARY")); // 17000

        rs.close();
        statement.close();
        conn.close();

    }

    @Test
    public void task3() throws SQLException {

        Connection conn = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
        Statement statement = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        ResultSet rs = statement.executeQuery("select FIRST_NAME,LAST_NAME,SALARY from EMPLOYEES where ROWNUM<6");

        ResultSetMetaData rsmd = rs.getMetaData();

        // iterate each row based on each column, insert List of Maps
        // using 4 tools to fill out the information in the List of Maps

        // create List of Maps to keep the information
        // it's empty List, will hold the information at the end
        List<Map<String, Object>> dataList = new ArrayList<>();

        // how many column we have?
        int columnCount = rsmd.getColumnCount();

        //iterate through each row
        while (rs.next()) {

            // create an empty Maps to hold one row of information  in dynamically
            Map<String, Object> rowMap = new HashMap<>();

            // iterate each column, so that we can know how many column we have
            // and implementing 1st row each of the column information will be inserted
            //
            for (int i = 1; i <= columnCount; i++) {

                // get the column_name and get the value 
                // this code is taking when [i] is one, FIRST_NAME value=Steven and put in the rowMap
                // LAST_NAME=King put in the rowMap, SALARY=24000 to the rowMap
                rowMap.put(rsmd.getColumnName(i), rs.getString(i));

            }
            // add the one row information to the List
            dataList.add(rowMap);

        }
        // print DataMap using ForEachLoop
        for (Map<String, Object> row : dataList) {
            System.out.println(row);
        }


        rs.close();
        statement.close();
        conn.close();

    }

}