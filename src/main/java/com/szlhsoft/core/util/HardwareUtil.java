package com.szlhsoft.core.util;

import java.io.IOException;
import java.util.Scanner;

public class HardwareUtil {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try {  
	        long start = System.currentTimeMillis();  
	        Process process = Runtime.getRuntime().exec(  
	        new String[] { "wmic", "cpu", "get", "ProcessorId" });  
	        process.getOutputStream().close();  
	        Scanner sc = new Scanner(process.getInputStream());  
	        String property = sc.next();  
	        String serial = sc.next();  
	        System.out.println(property + ": " + serial);  
	        System.out.println("time:" + (System.currentTimeMillis() - start));  
	    } catch (IOException e) {  
	        // TODO Auto-generated catch block  
	        e.printStackTrace();  
	    }  

	}
	public static String getCpuInfo(){
		try {  
	        long start = System.currentTimeMillis();  
	        Process process = Runtime.getRuntime().exec(  
	        new String[] { "wmic", "cpu", "get", "ProcessorId" });  
	        process.getOutputStream().close();  
	        Scanner sc = new Scanner(process.getInputStream());  
	        String property = sc.next();  
	        String serial = sc.next();  
	        System.out.println(property + ": " + serial);  
	        System.out.println("time:" + (System.currentTimeMillis() - start));  
	        return serial;
	    } catch (IOException e) {  
	        // TODO Auto-generated catch block  
	        e.printStackTrace();  
	        return "";
	    } 
	}

}
