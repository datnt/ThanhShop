/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.datnt.utils;

/**
 *
 * @author datnt
 */
public class Validator {

    private static final int _DIGIT_BEGIN = 48;
    private static final int _DIGIT_END = 57;

    public static boolean isNull(String s) {
        if (s == null) {
            return true;
        }

        int counter = 0;

        for (int i = 0; i < s.length(); i++) {
            char c = s.charAt(i);

            if (c == CharPool.SPACE) {
                continue;
            } else if (counter > 3) {
                return false;
            }

            if (counter == 0) {
                if (c != CharPool.LOWER_CASE_N) {
                    return false;
                }
            } else if (counter == 1) {
                if (c != CharPool.LOWER_CASE_U) {
                    return false;
                }
            } else if ((counter == 2) || (counter == 3)) {
                if (c != CharPool.LOWER_CASE_L) {
                    return false;
                }
            }

            counter++;
        }

        if ((counter == 0) || (counter == 4)) {
            return true;
        }

        return false;
    }

    public static boolean isDigit(char c) {
        int x = c;

        if ((x >= _DIGIT_BEGIN) && (x <= _DIGIT_END)) {
            return true;
        }

        return false;
    }

    public static boolean isNumber(String number) {
        if (isNull(number)) {
            return false;
        }

        for (char c : number.toCharArray()) {
            if (!isDigit(c)) {
                return false;
            }
        }

        return true;
    }
}
