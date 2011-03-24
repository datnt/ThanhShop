/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.datnt.services;

import com.datnt.DAO.CategoryDAO;
import com.datnt.DTO.CategoryDTO;

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

    public static CategoryDTO GetCategoryByName(String name){

        CategoryDAO daoLayer = new CategoryDAO();

        return daoLayer.GetCategoryByName(name);
    }
    public static int saveForAdd(CategoryDTO categoryDTO) {

        CategoryDAO daoLayer = new CategoryDAO();

        return daoLayer.saveForAdd(categoryDTO);
    }
    public static int saveForEdit(CategoryDTO oldCategoryDTO, CategoryDTO categoryDTO) {

        CategoryDAO daoLayer = new CategoryDAO();

        return daoLayer.saveForEdit(oldCategoryDTO,categoryDTO);
    }

}
