/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.datnt.DTO;

import java.util.Date;

/**
 *
 * @author datnt
 */
public class StockDTO {

    public static String NAME="name";
    public static String CATEGORY_ID="category_id";
    public static String CR8_DATE="created_date";
    public static String AMOUNT="amount";
    public static String PRICE="price";
    public static String SUM_PRICE="sum_price";
    public static String ID="id";
    public static String FILENAME="filename";
    

    private int stockID = -1;
    private String stockName = "";
    private Date cr8_Date;
    private int categoryID = -1;
    private int soluong = -1;
    private int dongia = -1;
    private int sotien = -1;
    private String fileName = "";

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }
    
    public int getStockID() {
        return stockID;
    }

    public void setStockID(int stockID) {
        this.stockID = stockID;
    }


    public int getSotien() {
        return sotien;
    }

    public void setSotien(int sotien) {
        this.sotien = sotien;
    }

    public int getDongia() {
        return dongia;
    }

    public void setDongia(int dongia) {
        this.dongia = dongia;
    }

    public int getSoluong() {
        return soluong;
    }

    public void setSoluong(int soluong) {
        this.soluong = soluong;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }


    public Date getCr8_Date() {
        return cr8_Date;
    }

    public void setCr8_Date(Date cr8_Date) {
        this.cr8_Date = cr8_Date;
    }

    public String getStockName() {
        return stockName;
    }

    public void setStockName(String stockName) {
        this.stockName = stockName;
    }

}
