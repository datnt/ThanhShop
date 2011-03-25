/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.datnt.services;

import com.datnt.DAO.StockDAO;
import com.datnt.DTO.StockDTO;

/**
 *
 * @author datnt
 */
public class StockServices {


    public static int Delete(String stockName) {
        StockDAO daoLayer = new StockDAO();

        return daoLayer.Delete(stockName);
    }

    public int saveForAdd(StockDTO stockDTO) {

        StockDAO daoLayer = new StockDAO();

        return daoLayer.saveForAdd(stockDTO);
    }
    public int saveForUpdate(StockDTO EditingStockDTO,StockDTO stockDTO) {

        StockDAO daoLayer = new StockDAO();

        return daoLayer.saveForUpdate(EditingStockDTO,stockDTO);
    }


    public static String[] FindAll() {

        StockDAO daoLayer = new StockDAO();

        return daoLayer.FindAll();
    }
    
    public static String[] listByCategory(int categoryId) {

        StockDAO daoLayer = new StockDAO();

        return daoLayer.listByCategory(categoryId);
    }    

    public static StockDTO GetDetail(String stockName) {

        StockDAO daoLayer = new StockDAO();

        return daoLayer.GetDetail(stockName);
    }
    public static boolean IsExist(String stockName) {

        StockDAO daoLayer = new StockDAO();

        return daoLayer.IsExist(stockName);
    }
}
