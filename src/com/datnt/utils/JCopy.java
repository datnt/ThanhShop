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
            File sourceFile = new File(strSource);
            File destFile = new File("D:/usr/tmp/img_thanhshop/tes.jpg");

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
