/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.datnt.DAO;

import com.datnt.DTO.CategoryDTO;
import com.datnt.utils.DatabaseUtils;
import java.sql.Statement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author datnt
 */
public class CategoryDAO {

    public String[] LoadCategory() {

        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        String[] listCate = null;

        try {
            DatabaseUtils utils = new DatabaseUtils();
            conn = utils.getConntection();
            conn.setAutoCommit(false);

            String sqlCate = "SELECT * FROM CATEGORY ORDER BY id ASC";
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sqlCate);


            int rowcount = 0;
            if (rs.last()) {
                rowcount = rs.getRow();
                rs.beforeFirst();
                // not rs.first() because the rs.next() below will move on,
                //missing the first element
            }
            listCate = new String[rowcount];
            int i = 0;
            while (rs.next()) {
                listCate[i] = rs.getString(CategoryDTO.NAME);
                i++;
            }


        } catch (Exception e) {
            System.out.println("Load Category FAILED: " + e);
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e) {
                System.out.println("Find all category FAILED" + e.toString());
            }
        }

        return listCate;
    }

public String GetCategoryName(int id) {

        Connection conn = null;
        PreparedStatement ptmt = null;
        ResultSet rs = null;
        String name = "";

        try {
            DatabaseUtils utils = new DatabaseUtils();
            conn = utils.getConntection();
            conn.setAutoCommit(false);

            String sqlCate = "SELECT NAME FROM category where id = ?";

            ptmt = conn.prepareStatement(sqlCate);
            ptmt.setInt(1, id);

            System.out.println("test id ========== "+id);
            while (rs.next()) {
                System.out.println("name ========== "+name);
                name = rs.getString(CategoryDTO.NAME);
                System.out.println("name ========== "+name);
            }


        } catch (Exception e) {
            System.out.println("Get Category Name FAILED: " + e);
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ptmt != null) {
                    ptmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e) {
                System.out.println("Get category Name FAILED" + e.toString());
            }
        }

        return name;
    }
}
