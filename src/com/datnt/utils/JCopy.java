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
import java.util.Calendar;

/**
 *
 * @author datnt
 */
public class JCopy {

    public static String perform(String strSource) {
        FileChannel source = null;
        FileChannel destination = null;

        String destpath = GetNewFilePath(strSource);

        try {


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
                try {
                    source.close();
                } catch (Exception e) {
                }

            }
            if (destination != null) {
                try {
                    destination.close();
                } catch (Exception e) {
                }

            }
        }
        return destpath;
    }

    public static String GetNewFilePath(String filepath) {
        int tempIndex = filepath.split("/").length - 1;
        String fileName = filepath.split("/")[tempIndex];
        try {
            filepath = new File(".").getCanonicalPath().replace("\\", "/") + "/images" + "/";

            System.out.println("ooooooooooooooooo  ==  "+filepath);

            Calendar now = Calendar.getInstance();
            filepath = filepath + now.getTimeInMillis() + "_" + fileName;
        } catch (Exception e) {
            System.out.println("Loi khi convert file path: " + e);
        }

        return filepath;

    }

    public static String GetSystemPath() {
        String filepath = "";
        try {
            filepath = new File(".").getCanonicalPath().replace("\\", "/") + "/images" + "/";
        } catch (Exception e) {
            System.out.println("Error when GetSystemPath");
        }
        return filepath;
    }
}
