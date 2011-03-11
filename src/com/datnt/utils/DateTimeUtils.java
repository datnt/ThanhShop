/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.datnt.utils;

import java.util.Calendar;
import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

/**
 *
 * @author datnt
 */
public class DateTimeUtils {

    private static int YEAR_FROM = 2000;
    private static int YEAR_TO = 2100;
    private static int MONTH = 1;

    public static String[] getYears(int from, int to) {
        int length = to + 1 - from;
        String[] years = new String[length];

        int i = 0;
        int tmp = from;
        while (i < length) {
            years[i] = String.valueOf(tmp);
            tmp = tmp + 1;
            i++;
        }

        return years;
    }

    public static String[] getYears() {
        return getYears(YEAR_FROM, YEAR_TO);
    }

    public static String[] getMonths() {
        String[] months = new String[12];

        int i = 0;
        int tmp = 1;
        while (i < 12) {
            months[i] = String.valueOf(tmp);
            tmp = tmp + 1;
            i++;
        }

        return months;
    }

    public static String[] getDays(int month, int year) {

        /*CalendarUtil use month from 0, year using as normal
         * e.g: year 2000, month 2 is specified as year 2000, month 1
         * and year 2000 month 1 is specified as year 2000, month 0
         */
        System.out.println("month = " + month + "|| year == " + year);
        Calendar calendar = Calendar.getInstance();

        calendar.set(Calendar.YEAR, year);
        calendar.set(Calendar.MONTH, month - 1);

        System.out.println("\nThe date of Calendar is: " + calendar.getTime());

        int maxDay = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);

        System.out.println("dayOfMonth == " + maxDay);

        String[] days = new String[maxDay];

        int i = 0;
        int tmp = 1;
        while (i < maxDay) {
            days[i] = String.valueOf(tmp);
            tmp = tmp + 1;
            i++;
        }

        return days;
    }

    public static Date getDate(int day, int month, int year) {
        DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
        String date = ""+day+"/"+month+"/"+year;
        Date today;
        try {
            today = dateFormat.parse(date);
            System.out.println("Today = " + dateFormat.format(today));
        } catch (Exception e) {
            System.out.println("Loi xay ra khi convert ngay: "+e);
            return null;
        }
        return today;
    }
}
