package com.szlhsoft.core.util;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

import java.io.UnsupportedEncodingException;

public class Base64Util {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String s= Base64Util.encode("12345678");
		System.out.println(s);
		String b= Base64Util.decode("emhhaTEyMzQ1Ng==");
		System.out.println(b);
	}
	
	/**
	 * 加密字符串
	 * @param str
	 * @return
	 */
	public static String encode(String str){
		 byte[] b = null;  
	        String s = null;  
	        try {  
	            b = str.getBytes("utf-8");  
	        } catch (UnsupportedEncodingException e) {  
	            e.printStackTrace();  
	        }  
	        if (b != null) {  
	            s = new BASE64Encoder().encode(b);  
	        }  
	        return s;  
	}
	
	
	/**
	 * 解密字符串
	 * @param s
	 * @return
	 */
	public static String decode(String s){
		byte[] b = null;  
        String result = null;  
        if (s != null) {  
            BASE64Decoder decoder = new BASE64Decoder();  
            try {  
                b = decoder.decodeBuffer(s);  
                result = new String(b, "utf-8");  
            } catch (Exception e) {  
                e.printStackTrace();  
            }  
        }  
        return result;
	}

}
