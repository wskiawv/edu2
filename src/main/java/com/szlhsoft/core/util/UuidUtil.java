package com.szlhsoft.core.util;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import java.util.UUID;


public class UuidUtil {
	public static String getUuid(){
		
		Date d = new Date();
		DateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String prefix = sdf.format(d);
		String uuid = null;
		int code = getNextRandomInt();
		String rt = "000000" + code;
		uuid = prefix + rt.substring(rt.length() - 6);
		System.out.println(uuid);
		return Base64Util.encode(uuid);
	}
	public static String getUuids(String id){
		
		Date d = new Date();
		DateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String prefix = sdf.format(d);
		String uuid = null;
		int code = getNextRandomInt();
		String rt = "000000" + code;
		uuid = prefix + rt.substring(rt.length() - 6);
		System.out.println(uuid);
		return Base64Util.encode(uuid+id);
	}
	
	public static int getNextRandomInt() {
		Random r = new Random();
		int n;
		n = r.nextInt(1000000);
		return n;
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//String s=UuidUtil.getUuid();
		String s= UuidUtil.getUuidJdk();
		System.out.println(s);
	}
	public static String getUuidCode(){
		Date d = new Date();
		DateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String prefix = sdf.format(d);
		String uuid = null;
		int code = getNextRandomInt();
		String rt = "000000" + code;
		uuid = prefix + rt.substring(rt.length() - 6);
		System.out.println(uuid);
		return uuid;
	}
	public static String getUuidJdk(){
		String uuid=UUID.randomUUID().toString().replaceAll("-","");;
		System.out.println(uuid);
		return uuid;
	}
}
