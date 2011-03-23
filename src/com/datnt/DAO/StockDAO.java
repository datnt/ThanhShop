/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.datnt.DAO;

import com.datnt.DTO.StockDTO;
import com.datnt.utils.DatabaseUtils;
import com.datnt.utils.JCopy;
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

    public int saveForUpdate(StockDTO EditingStockDTO, StockDTO stock) {
        int stockid = -1;

        Connection conn = null;
        PreparedStatement ptmt = null;
        ResultSet rs = null;

        try {
            DatabaseUtils utils = new DatabaseUtils();
            conn = utils.getConntection();
            conn.setAutoCommit(false);

            String sqlStock = "UPDATE STOCK_KEPING SET name=?,created_date=?,category_id=?,amount=?,price=?,sum_price=?  where id=?";

            ptmt = conn.prepareStatement(sqlStock, Statement.RETURN_GENERATED_KEYS);
            ptmt.setString(1, stock.getStockName());
            ptmt.setDate(2, new Date(stock.getCr8_Date().getTime()));
            ptmt.setInt(3, stock.getCategoryID());
            ptmt.setInt(4, stock.getSoluong());
            ptmt.setInt(5, stock.getDongia());
            ptmt.setInt(6, stock.getSotien());

            System.out.println("input id for update == " + EditingStockDTO.getStockID());
            ptmt.setInt(7, EditingStockDTO.getStockID());

            System.out.println("update string == " + ptmt.toString());

            stockid = ptmt.executeUpdate();


        } catch (Exception e) {
            stockid = -1;
            System.out.println("Update stock FAILED: " + e);
        } finally {
            try {
                if (stockid > 0) {
                    conn.commit();
                } else {
                    stockid = -1;
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
                System.out.println("FAILED WHEN COMMIT for Update: " + e);
            }
        }
        System.out.println("update stockid == " + stockid);
        return stockid;
    }

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
        JCopy.perform("C:/Users/Public/Pictures/Sample Pictures/Koala.jpg", null);

        return stockid;
    }

    public String[] listByCategory(int catId) {
        Connection conn = null;
        PreparedStatement ptmt = null;
        ResultSet rs = null;
        String[] listCate = null;

        try {
            DatabaseUtils utils = new DatabaseUtils();
            conn = utils.getConntection();
            conn.setAutoCommit(false);

            String sqlCate = "SELECT * FROM STOCK_KEPING WHERE  STOCK_KEPING.CATEGORY_ID=? ORDER BY id ASC";
            
            ptmt = conn.prepareStatement(sqlCate);
            ptmt.setInt(1, catId);

            rs = ptmt.executeQuery();




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
            System.out.println("Find Stock By Cateory FAILED: " + e);
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
                System.out.println("Find Stock By Cateory FAILED" + e.toString());
            }
        }

        return listCate;
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
                stockDTO.setStockID(rs.getInt(StockDTO.ID));
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
