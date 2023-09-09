package com.cydeo.jdbctests.practice;

import com.cydeo.utility.DB_Util;

import java.util.List;
import java.util.Map;

public class P05_DBUtilPractice {

    public static void main(String[] args) {


        // Create connection
        // DB_Util has overloaded methods to create the Connection String

        DB_Util.createConnection();

        // Run Query
        DB_Util.runQuery("select * from COUNTRIES");

        System.out.println("-----GET ME ROW-----");
        int rowCount = DB_Util.getRowCount();
        System.out.println(rowCount);  // 25

        System.out.println("-----GET ME COLUMN COUNT-----");
        int columnCount = DB_Util.getColumnCount();
        System.out.println(columnCount); // 3

        System.out.println("-----GET ALL COLUMN NAME AS LIST-----");
        List<String> allColumnNamesAsList = DB_Util.getAllColumnNamesAsList();
        System.out.println(allColumnNamesAsList);


        System.out.println("-----GET ROW DATA AS LIST-----");
        List<String> rowDataAsList = DB_Util.getRowDataAsList(1);
        System.out.println(rowDataAsList);

        System.out.println("-----GET CELL VALUE --> int rowNum, int columnIndex--");
        String cellValue = DB_Util.getCellValue(5, 1);
        System.out.println(cellValue); // CA

        System.out.println("-----GET CELL VALUE --> int rowNum, String ColumnName--");
        String country_name = DB_Util.getCellValue(5, "COUNTRY_NAME");
        System.out.println(country_name);  // Canada


        System.out.println("-----GET FIRST ROW FIRST COLUMN VALUE-----");
        String firstRowFirstColumn = DB_Util.getFirstRowFirstColumn();
        System.out.println(firstRowFirstColumn); // AR

        System.out.println("-----GET COLUMN DATA AS LIST --> int columnNum--");
        List<String> columnDataAsList = DB_Util.getColumnDataAsList(2);
        System.out.println(columnDataAsList);

        System.out.println("-----GET COLUMN DATA AS LIST --> String columnName--");
        List<String> country_name1 = DB_Util.getColumnDataAsList("country_name");
        System.out.println(country_name1);

        System.out.println("-----GET ROW map-----");
        Map<String, String> rowMap = DB_Util.getRowMap(1);
        System.out.println(rowMap);

        System.out.println("-----GET ALL ROW AS LIST OF MAP-----");
        List<Map<String, String>> allRowAsListOfMap = DB_Util.getAllRowAsListOfMap();

        for (Map<String, String> eachRowMap : allRowAsListOfMap) {
            System.out.println(eachRowMap);
        }


        //close Connection
        DB_Util.destroy();
    }

}
