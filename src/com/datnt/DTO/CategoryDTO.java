/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.datnt.DTO;

/**
 *
 * @author datnt
 */
public class CategoryDTO {
    private String name = "";
    private String description = "";
    private int id = -1;
    
    public static String NAME="name";
    public static String DESCRIPTION="description";
    public static String ID="id";

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
