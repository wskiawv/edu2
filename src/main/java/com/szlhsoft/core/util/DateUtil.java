package com.szlhsoft.core.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 日期工具类
 * 
 * @author Somnus
 * 
 */
public class DateUtil {

	public static void main(String[] args) {

	}

	/**
	 * 日期转字符串
	 * 
	 * @param date
	 *            日期
	 * @param pattern
	 *            格式
	 * @return
	 */
	public static String dateToString(Date date, String pattern) {
		if (date != null) {
			SimpleDateFormat sdf = new SimpleDateFormat(pattern);
			return sdf.format(date);
		}
		return "";
	}

	/**
	 * 日期转字符串
	 * 
	 * @param date
	 * @return
	 */
	public static String dateToString(Date date) {
		return dateToString(date, "yyyy-MM-dd hh:mm:ss");
	}
	
	public static Date stringToDate(String s){
		Date date=new Date();
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");  
			date=sdf.parse(s);
		} catch (ParseException e) {		
			e.printStackTrace();
		}
		return date;
	}
	public static String dataToStringDate(Date date){
		return  dateToString(date, "yyyy-MM-dd");
	}

}
