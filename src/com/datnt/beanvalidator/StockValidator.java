/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.datnt.beanvalidator;

import com.datnt.DTO.StockDTO;
import com.datnt.services.StockServices;

/**
 *
 * @author datnt
 */
public class StockValidator {
    public static boolean ValidateNewStockBean(StockDTO stockDTO){
        if ( "".equals(stockDTO.getStockName()) )
            return false;
        if ( StockServices.IsExist(stockDTO.getStockName()) )
            return false;
        
        return true;
    }
    public static boolean ValidateUpdateStockBean(StockDTO stockDTO){
        if ( "".equals(stockDTO.getStockName()) )
            return false;

        return true;
    }
}
