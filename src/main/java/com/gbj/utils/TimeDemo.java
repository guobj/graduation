package com.gbj.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class TimeDemo {
    public static String dateTime(){
        Date date = new Date();
        SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String dateTime = sf.format(date);
        return dateTime;

    }
}
