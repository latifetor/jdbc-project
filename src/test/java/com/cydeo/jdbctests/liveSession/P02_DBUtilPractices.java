package com.cydeo.jdbctests.liveSession;

import com.cydeo.utility.DB_Util;
import org.junit.jupiter.api.Test;

import java.util.List;
import java.util.Map;

public class P02_DBUtilPractices {

    @Test
    public void dbUtil() {

        // create conn
        DB_Util.createConnection();

        //Execute Query
        DB_Util.runQuery("select COUNTRY_ID, CITY from LOCATIONS");

        System.out.println("------ROW COUNT-------");
        System.out.println(DB_Util.getRowCount()); //23

        System.out.println("------COLUMN COUNT------");
        System.out.println(DB_Util.getAllColumnNamesAsList());

        System.out.println("----GET ROW DATA AS LIST --FIRST ROW 1------");
        System.out.println(DB_Util.getRowDataAsList(1));

        System.out.println("----GET CELL VALUE ---int rowNum,int columnIndex---");
        System.out.println(DB_Util.getCellValue(1, 1));

        System.out.println("-----GET CELL VALUE ---int rowNum,int columnIndex---");
        System.out.println(DB_Util.getCellValue(1, "city"));

        System.out.println("---GET FIRST ROW FIRST COLUMN VALUE----");
        System.out.println(DB_Util.getFirstRowFirstColumn());

        System.out.println("---GET COLUMN DATA AS LIST --> int columnNum--");
        System.out.println(DB_Util.getColumnDataAsList(2));

        System.out.println("---GET COLUMN DATA AS LIST ---> String columnName-");
        System.out.println(DB_Util.getColumnDataAsList("city"));
        List<String> cities = DB_Util.getColumnDataAsList("city");

        System.out.println("---GET ROW MAP----");
        System.out.println(DB_Util.getRowMap(1));

        System.out.println("---GET ALL ROW AS LIST OF MAP----");
        System.out.println(DB_Util.getAllRowAsListOfMap());
        List<Map<String, String>> allData = DB_Util.getAllRowAsListOfMap();

        for (Map<String, String> eachRow : allData) {
            System.out.println(eachRow);
        }




        DB_Util.destroy();




    }
}
