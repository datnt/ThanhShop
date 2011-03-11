/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.datnt.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import javax.sql.DataSource;

/**
 *
 * @author datnt
 */
public class DatabaseUtils {

    private DataSource ds;

    public Connection getConntection() throws Exception{
        Connection conn = null;
                    String url = "jdbc:mysql://localhost:3306/";
            String db = "thanh_shop?useUnicode=true&characterEncoding=UTF-8";
            String driver = "com.mysql.jdbc.Driver";
            String user = "root";
            String pass = "123456";

        try {
            Class.forName(driver).newInstance();
            conn = DriverManager.getConnection(url+db, user, pass);
        }catch(Exception e){
            System.out.println("Error when getting DB connection: "+e);
            conn.close();

            throw new Exception("Cannot connect to database: "+e);
        }
        return conn;
    }
}
