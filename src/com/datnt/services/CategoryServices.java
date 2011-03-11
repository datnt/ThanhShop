/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.datnt.services;

import com.datnt.DAO.CategoryDAO;

/**
 *
 * @author datnt
 */
public class CategoryServices {

    public static String[] LoadCategory(){

        CategoryDAO daoLayer = new CategoryDAO();

        return daoLayer.LoadCategory();
    }
    public static String GetCategoryName(int id){

        CategoryDAO daoLayer = new CategoryDAO();

        return daoLayer.GetCategoryName(id);
    }
}
