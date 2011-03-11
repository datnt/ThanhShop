/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.datnt.DAO;

import com.datnt.DTO.StockDTO;
import com.datnt.utils.DatabaseUtils;
import java.sql.Statement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Date;

/**
 *
 * @author datnt
 */
public class StockDAO {

    public int saveForAdd(StockDTO stock) {
        int stockid = 0;

        Connection conn = null;
        PreparedStatement ptmt = null;
        ResultSet rs = null;
        boolean result = false;

        try {
            DatabaseUtils utils = new DatabaseUtils();
            conn = utils.getConntection();
            conn.setAutoCommit(false);

            String sqlStock = "INSERT INTO STOCK_KEPING(name,created_date,category_id,amount,price,sum_price) VALUES(?,?,?,?,?,?)";
            ptmt = conn.prepareStatement(sqlStock, Statement.RETURN_GENERATED_KEYS);
            ptmt.setString(1, stock.getStockName());
            ptmt.setDate(2, new Date(stock.getCr8_Date().getTime()));
            ptmt.setInt(3, stock.getCategoryID());
            ptmt.setInt(4, stock.getSoluong());
            ptmt.setInt(5, stock.getDongia());
            ptmt.setInt(6, stock.getSotien());

            if (ptmt.executeUpdate() > 0) {
                ResultSet rsAuto = ptmt.getGeneratedKeys();
                if (rsAuto.next()) {
                    stockid = rsAuto.getInt(1);
                }
                result = true;
            }

        } catch (Exception e) {
            result = false;
            stockid = 0;
            System.out.println("Save FAILED: " + e);
        } finally {
            try {
                if (result) {
                    conn.commit();
                } else {
                    stockid = 0;
                    conn.rollback();
                }
                conn.setAutoCommit(true);
                if (rs != null) {
                    rs.close();
                }
                if (ptmt != null) {
                    ptmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                System.out.println("FAILED WHEN COMMIT: " + e);
            }
        }

        return stockid;
    }

    public String[] FindAll() {

        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        String[] listCate = null;

        try {
            DatabaseUtils utils = new DatabaseUtils();
            conn = utils.getConntection();
            conn.setAutoCommit(false);

            String sqlCate = "SELECT * FROM STOCK_KEPING ORDER BY id ASC";
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
                listCate[i] = rs.getString(StockDTO.NAME);
                i++;
            }


        } catch (Exception e) {
            System.out.println("Load All Stock FAILED: " + e);
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
                System.out.println("Find all Stock FAILED" + e.toString());
            }
        }

        return listCate;
    }

    public StockDTO GetDetail(String stockName) {

        Connection conn = null;
        PreparedStatement ptmt = null;
        ResultSet rs = null;
        String[] listCate = null;
        StockDTO stockDTO = new StockDTO();

        try {
            DatabaseUtils utils = new DatabaseUtils();
            conn = utils.getConntection();
            conn.setAutoCommit(false);

            String sqlStock = "SELECT * FROM STOCK_KEPING WHERE STOCK_KEPING.NAME=? LIMIT 1";
            ptmt = conn.prepareStatement(sqlStock);
            ptmt.setString(1, stockName);

            rs = ptmt.executeQuery();


            while (rs.next()) {
                stockDTO.setStockName(rs.getString(StockDTO.NAME));
                stockDTO.setCategoryID(rs.getInt(StockDTO.CATEGORY_ID));
                stockDTO.setCr8_Date(rs.getDate(StockDTO.CR8_DATE));
                stockDTO.setSoluong(rs.getInt(StockDTO.AMOUNT));
                stockDTO.setDongia(rs.getInt(StockDTO.PRICE));
                stockDTO.setSotien(rs.getInt(StockDTO.SUM_PRICE));
            }


        } catch (Exception e) {
            System.out.println("Load All Stock FAILED: " + e);
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
                System.out.println("Find all Stock FAILED" + e.toString());
            }
        }

        return stockDTO;
    }

    /*return true when name EXIST, return false when name NOT-EXIST
     * In this case, FALSE is GOOD to add new
     * TRUE is NOT good to add new
     */
    public boolean IsExist(String stockName) {

        Connection conn = null;
        PreparedStatement ptmt = null;
        ResultSet rs = null;
        String[] listCate = null;
        StockDTO stockDTO = new StockDTO();
        int rowcount = 0;

        try {
            DatabaseUtils utils = new DatabaseUtils();
            conn = utils.getConntection();
            conn.setAutoCommit(false);

            String sqlStock = "SELECT * FROM STOCK_KEPING WHERE STOCK_KEPING.NAME=? LIMIT 1";
            ptmt = conn.prepareStatement(sqlStock);
            ptmt.setString(1, stockName);

            rs = ptmt.executeQuery();


            if (rs.last()) {
                rowcount = rs.getRow();
            }

        } catch (Exception e) {
            System.out.println("Load All Stock FAILED: " + e);
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
                System.out.println("Find all Stock FAILED" + e.toString());
            }
        }

        if (rowcount > 0) {
            return true;
        } else {
            return false;
        }

    }
}
