package com.cydeo.jdbctests.day02;

import com.cydeo.utility.DB_Util;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

public class P03_Library_Test {

    // Create connection to MySQL Database
    String url = "jdbc:mysql://34.230.35.214:3306/library2";
    String username =  "library2_client";
    String password =  "6s2LQQTjBcGFfDhY";

    @Test
    public void task1() {

        //create connection
        DB_Util.createConnection(url,username,password);

        // run the query
        DB_Util.runQuery("select COUNT(*) from books");

        String expectedBooksCount = DB_Util.getFirstRowFirstColumn();


        /*
            Actual comes from UI with selenium, cucumber etc.
         */

        String actualBookCount = "6661";

        Assertions.assertEquals(expectedBooksCount, actualBookCount);

        System.out.println(expectedBooksCount);  // 6661
        // closing the connection
        DB_Util.destroy();




    }


}
