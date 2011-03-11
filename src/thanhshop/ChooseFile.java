/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package thanhshop;

import javax.swing.JFileChooser;
import javax.swing.JPanel;

/**
 *
 * @author datnt
 */
public class ChooseFile {

    public static String OpenChooser() {

        JPanel p = new JPanel();
        String fullPath = "";

        JFileChooser c = new JFileChooser();
        // Demonstrate "Save" dialog:
        int rVal = c.showSaveDialog(p);
        if (rVal == JFileChooser.APPROVE_OPTION) {
            System.out.println("Selected Filename == " + c.getSelectedFile().getName());
            System.out.println("dir path == " + c.getCurrentDirectory().toString());
            fullPath = c.getCurrentDirectory().toString() + c.getSelectedFile().getName();
        }
        if (rVal == JFileChooser.CANCEL_OPTION) {
            fullPath = "";
            System.out.println("You pressed cancel");
        }
        return fullPath;
    }
}
