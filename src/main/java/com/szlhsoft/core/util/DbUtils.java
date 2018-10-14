package com.szlhsoft.core.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class DbUtils {
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String dbHost="localhost";
		String dbPort="3306";
		String dbName="cms2";
		String dbUser="root";
		String dbPassword="";
		DbUtils.createDataBase(dbHost, dbPort, dbName, dbUser, dbPassword);
	}
	public static void createDataBase(String dbHost, String dbPort, String dbName,String dbUser, String dbPassword){
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			String connStr = "jdbc:mysql://" + dbHost + ":" + dbPort + "?user="
			+ dbUser + "&password=" + dbPassword
			+ "&characterEncoding=UTF8";
			Connection conn = DriverManager.getConnection(connStr);
			Statement stat = conn.createStatement();
			String sql = "drop database if exists " + dbName;
			stat.execute(sql);
			sql = "create database " + dbName + " CHARACTER SET UTF8";
			stat.execute(sql);
			stat.close();
			conn.close();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
