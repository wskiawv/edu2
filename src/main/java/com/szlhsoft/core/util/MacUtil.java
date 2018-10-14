package com.szlhsoft.core.util;

import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.net.UnknownHostException;

public class MacUtil {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String s=getLocalMac();		
	}
	private static String getLocalMac()  {
		// TODO Auto-generated method stub
		//获取网卡，获取地址
		String s=null;
		try {
			InetAddress ia = InetAddress.getLocalHost();
			byte[] mac = NetworkInterface.getByInetAddress(ia).getHardwareAddress();
			System.out.println("mac数组长度："+mac.length);
			StringBuffer sb = new StringBuffer("");
			for(int i=0; i<mac.length; i++) {
				if(i!=0) {
					sb.append("-");
				}
				//字节转换为整数
				int temp = mac[i]&0xff;
				String str = Integer.toHexString(temp);
				System.out.println("每8位:"+str);
				if(str.length()==1) {
					sb.append("0"+str);
				}else {
					sb.append(str);
				}
			}
			s=sb.toString().toUpperCase();
			System.out.println("本机MAC地址:"+s);
			return s;
		} catch (SocketException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return s;
	}

}
