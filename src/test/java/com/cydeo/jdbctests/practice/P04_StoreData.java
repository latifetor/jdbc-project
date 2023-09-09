package com.cydeo.jdbctests.practice;

import org.junit.jupiter.api.Test;

import java.sql.*;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class P04_StoreData {

    String dbUrl = "jdbc:oracle:thin:@44.195.25.11:1521:XE";
    String dbPassword = "hr";
    String dbUsername = "hr";

    @Test
    public void storeData() throws SQLException {

        Connection conn = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
        Statement stmnt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);

        ResultSet rs = stmnt.executeQuery("select * from DEPARTMENTS");

        ResultSetMetaData rsmd = rs.getMetaData();



    /* storing 1st row data
        Map<String, Object> rowMap = new LinkedHashMap<>();
        rowMap.put("COUNTRY_ID","AR");
        rowMap.put("COUNTRY_NAME","Argentina");
        rowMap.put("REGION_ID","2");

        storing 2nd row data
        Map<String, Object> rowMap = new LinkedHashMap<>();
        rowMap.put("COUNTRY_ID","AU");
        rowMap.put("COUNTRY_NAME","Australia");
        rowMap.put("REGION_ID","3");
     */
        // create List of Map
        List<Map<String,Object>> dataList = new ArrayList<>();

        // iterate each column data
        while (rs.next()){

            Map<String,Object> rowMap = new LinkedHashMap<>();

            for (int i = 1; i <= rsmd.getColumnCount(); i++) {
                rowMap.put(rsmd.getColumnName(i),rs.getString(i));
                
            }
            dataList.add(rowMap);
        }
        // print out as a map
        for (Map<String, Object> eachRowMap : dataList) {
            System.out.println(eachRowMap);
        }

        rs.close();

        stmnt.close();

        conn.close();
    }



}

