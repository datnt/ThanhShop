/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.datnt.utils;

import java.io.File;

/**
 *
 * @author datnt
 */
public class JDelete {

    public static void deletefile(String fileName) {

        String filepath = "";
        try {
            filepath = new File(".").getCanonicalPath().replace("\\", "/") + "/images" + "/"+fileName;
        } catch (Exception e) {
            System.out.println("Error when GetSystemPath");
        }


        File f1 = new File(filepath);
        boolean success = f1.delete();
        if (!success) {
            System.out.println("Deletion failed.");
        } else {
            System.out.println("File deleted.");
        }
    }
}
