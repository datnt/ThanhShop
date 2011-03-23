/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.datnt.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.channels.FileChannel;

/**
 *
 * @author datnt
 */
public class JCopy {

    public static void perform(String strSource, String strDest) {
        FileChannel source = null;
        FileChannel destination = null;

        try {
            int tempIndex = strSource.split("/").length-1;
            String fileName =strSource.split("/")[tempIndex];
            String destpath = new File(".").getCanonicalPath().replace("\\", "/")+"/images"+"/"+fileName;
            System.out.println("=============>>> "+destpath);
            
            File sourceFile = new File(strSource);
            File destFile = new File(destpath);

            if (!destFile.exists()) {
                destFile.createNewFile();
            }

            source = new FileInputStream(sourceFile).getChannel();
            destination = new FileOutputStream(destFile).getChannel();
            destination.transferFrom(source, 0, source.size());
        } catch (Exception e) {
            System.out.println("Loi khi dang chep file " + e);
        } finally {
            if (source != null) {
                try{source.close();}catch(Exception e){}
                
            }
            if (destination != null) {
                try{destination.close();}catch(Exception e){}
                
            }
        }
    }
}
