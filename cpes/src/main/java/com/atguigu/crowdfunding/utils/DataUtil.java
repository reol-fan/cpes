package com.atguigu.crowdfunding.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DataUtil {

	public static String format(Date date,String f){
		SimpleDateFormat sdf = new SimpleDateFormat(f);
		return sdf.format(date);
	}
	
	public static String getSystemTime(){
		return format(new Date(), Const.DATE_FORMAT_ALL);
	}
}
