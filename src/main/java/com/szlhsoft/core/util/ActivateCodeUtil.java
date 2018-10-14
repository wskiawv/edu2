package com.szlhsoft.core.util;

import java.util.Random;

public class ActivateCodeUtil {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String s= ActivateCodeUtil.genActivateCode();
		System.out.println(s);
	}
	public static String genActivateCode(){
		int intCount = 0;
		intCount = (new Random()).nextInt(999999);//
		if (intCount < 100000) {
			intCount += 100000;
		}
		String s = intCount + "";
		return s;
	}

}
