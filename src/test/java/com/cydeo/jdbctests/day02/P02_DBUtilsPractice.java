package com.cydeo.jdbctests.day02;

import com.cydeo.utility.DB_Util;
import org.junit.jupiter.api.Test;

import java.util.List;
import java.util.Map;

public class P02_DBUtilsPractice {

    @Test
    public void task1() {

        // create a connection
        DB_Util.createConnection();

        // run the query
        DB_Util.runQuery("select FIRST_NAME, LAST_NAME, SALARY from EMPLOYEES");

        // get the result
        System.out.println("====FIRST ROW FIRST COLUMN====");
        System.out.println(DB_Util.getFirstRowFirstColumn());

        System.out.println("====ALL COLUMN NAMES====");
        System.out.println(DB_Util.getAllColumnNamesAsList());

        System.out.println("====ALL FIRST NAMES===");
        System.out.println(DB_Util.getColumnDataAsList(1));

        System.out.println("====HOW MANY ROWS WE HAVE===");
        System.out.println(DB_Util.getRowCount());

        System.out.println("====A CERTAIN ROW INFO===");
        System.out.println("====GET AS MAP===");
        System.out.println(DB_Util.getRowMap(2));

        System.out.println("====GET AS LIST===");
        DB_Util.getRowDataAsList(2);

        System.out.println("====GET ALL THE LIST AS MAP===");
        List<Map<String, String>> allRowAsListOfMap = DB_Util.getAllRowAsListOfMap();

        for (Map<String, String> rowMap : allRowAsListOfMap) {
            System.out.println(rowMap);
        }


        DB_Util.destroy();
    }
}
