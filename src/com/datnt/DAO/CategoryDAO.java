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
import java.sql.SQLException;

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

            rs = ptmt.executeQuery();

            while (rs.next()) {
                name = rs.getString(CategoryDTO.NAME);
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

    public CategoryDTO GetCategoryByName(String name) {

        Connection conn = null;
        PreparedStatement ptmt = null;
        ResultSet rs = null;

        CategoryDTO categoryDTO = null;
        try {
            DatabaseUtils utils = new DatabaseUtils();
            conn = utils.getConntection();
            conn.setAutoCommit(false);

            String sqlCate = "SELECT * FROM category where name = ? LIMIT 1";

            ptmt = conn.prepareStatement(sqlCate);
            ptmt.setString(1, name);

            rs = ptmt.executeQuery();
            categoryDTO = new CategoryDTO();
            while (rs.next()) {
                categoryDTO.setId(rs.getInt(CategoryDTO.ID));
                categoryDTO.setName(rs.getString(CategoryDTO.NAME));
                categoryDTO.setDescription(rs.getString(CategoryDTO.DESCRIPTION));
            }
        } catch (Exception e) {
            System.out.println("Get Category object from ID FAILED: " + e);
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
                System.out.println("Get Category object from ID FAILED: " + e.toString());
            }
        }

        return categoryDTO;
    }

    public int saveForEdit(CategoryDTO oldCategoryDTO, CategoryDTO categoryDTO) {
        int cateid = -1;

        Connection conn = null;
        PreparedStatement ptmt = null;
        ResultSet rs = null;

        try {
            DatabaseUtils utils = new DatabaseUtils();
            conn = utils.getConntection();
            conn.setAutoCommit(false);



            String sqlStock = "UPDATE CATEGORY SET name=?,description=? where id=?";

            ptmt = conn.prepareStatement(sqlStock, Statement.RETURN_GENERATED_KEYS);
            ptmt.setString(1, categoryDTO.getName());
            ptmt.setString(2, categoryDTO.getDescription());
            ptmt.setInt(3, oldCategoryDTO.getId());

            cateid = ptmt.executeUpdate();

        } catch (Exception e) {
            cateid = -1;
            System.out.println("Update CATEGORY FAILED: " + e);
        } finally {
            try {
                if (cateid > 0) {
                    conn.commit();
                } else {
                    cateid = -1;
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
        return cateid;
    }

    public int saveForAdd(CategoryDTO categoryDTO) {
        int cateID = 0;

        Connection conn = null;
        PreparedStatement ptmt = null;
        ResultSet rs = null;
        boolean result = false;

        try {
            DatabaseUtils utils = new DatabaseUtils();
            conn = utils.getConntection();
            conn.setAutoCommit(false);

            String sqlStock = "INSERT INTO category(name,description,id) VALUES(?,?,?)";
            ptmt = conn.prepareStatement(sqlStock, Statement.RETURN_GENERATED_KEYS);
            ptmt.setString(1, categoryDTO.getName());
            ptmt.setString(2, categoryDTO.getDescription());
            ptmt.setInt(3, GetMaxId());




            if (ptmt.executeUpdate() > 0) {
                ResultSet rsAuto = ptmt.getGeneratedKeys();
                if (rsAuto.next()) {
                    cateID = rsAuto.getInt(1);
                }
                result = true;
            }
        } catch (Exception e) {
            result = false;
            cateID = 0;
            System.out.println("Save category FAILED: " + e);
        } finally {
            try {
                if (result) {
                    conn.commit();
                } else {
                    cateID = 0;
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
                System.out.println("FAILED WHEN COMMIT new category: " + e);
            }
        }


        return cateID;
    }

    public int GetMaxId() {

        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        String[] listCate = null;
        int id = -1;

        try {
            DatabaseUtils utils = new DatabaseUtils();
            conn = utils.getConntection();
            conn.setAutoCommit(false);

            String sqlCate = "SELECT MAX(id) as id FROM CATEGORY";
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sqlCate);


            while (rs.next()) {
                id = rs.getInt(CategoryDTO.ID);
                id = id + 1;
            }


        } catch (Exception e) {
            System.out.println("Load Max Category Id FAILED: " + e);
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
                System.out.println("Find Max category Id FAILED" + e.toString());
            }
        }

        return id;
    }

}
