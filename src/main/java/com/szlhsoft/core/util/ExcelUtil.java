package com.szlhsoft.core.util;

import net.sf.json.JSONObject;
import org.apache.commons.beanutils.PropertyUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.*;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;


public class ExcelUtil {
	protected static Log log= LogFactory.getLog(ExcelUtil.class);

	/**
	 * 根据实体类，生成实体字段 excel文件
	 * 
	 * @param clazz
	 * @param path
	 *            excel文件存放路径
	 */
	public static void ExportExcel(Class<?> clazz, String path) {
		/*
		 * try { Field[] fields=clazz.getDeclaredFields(); //获取类名 String
		 * modelname=clazz.getName().toString().substring(clazz.getName().
		 * toString().lastIndexOf(".")+1);
		 * 
		 * Workbook book = new HSSFWorkbook(); Sheet sheet=
		 * book.createSheet("数据"); for (int i = 0, j = 1; i < fields.length;
		 * i++) { String
		 * xtype=fields[i].getType().getName().toString().substring(fields[i].
		 * getType().getName().toString().lastIndexOf(".")+1); Row row =
		 * sheet.createRow(j);
		 * row.createCell(0).setCellValue(fields[i].getName().toString());
		 * row.createCell(1).setCellValue(xtype); j++; } FileOutputStream os =
		 * new FileOutputStream(path + modelname + ".xls"); book.write(os);
		 * os.close(); book.close(); } catch(Exception e){
		 * System.out.println(e.getMessage()); }
		 */
	}

	public static List poireadExcel(Class clazz, File file) {
		List list = new ArrayList();
		if (!file.exists()) {
			System.out.println("file in not exists!");
			return null;
		}
		try {
			FileInputStream fs = new FileInputStream(file);
			HSSFWorkbook book = new HSSFWorkbook(fs);
			HSSFSheet sheet = book.getSheetAt(0);
			if (sheet != null) {
				List<String> field = new ArrayList();
				for (int r = 0; r < sheet.getLastRowNum(); r++) {
					HSSFRow hr = sheet.getRow(r);
					if (r == 0) {
						for (int c = 0; c < hr.getLastCellNum(); c++) {
							String value = hr.getCell(c).getStringCellValue();
							if (value != null && !value.equals("")) {
								field.add(value);
							}
						}
					} else if (r >= 1) {
						Object t = clazz.newInstance();
						for (int c = 0; c < hr.getLastCellNum(); c++) {
							String value = hr.getCell(c).getStringCellValue();
							if (value != null && !"".equals(value.trim())) {
								Class xtype = PropertyUtils.getPropertyType(t, field.get(c));
								String objectXtype = xtype.getName().toString();
								if (objectXtype.equals("java.lang.Integer")) {
									PropertyUtils.setProperty(t, field.get(c), Integer.parseInt(value));
								} else if (xtype != null) {
									PropertyUtils.setProperty(t, field.get(c), value);
								}
							}
						}
						if (t != null) {
							list.add(t);
						}
					}

				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	/**
	 * 根据实体类和excel文件生成实体List集合,读excel文件
	 * 
	 * @param clazz
	 * @param file
	 */
	public static List readExcel(Class clazz, File file) {
		// File file =new File("sf");
		List list = new ArrayList();
		if (!file.exists()) {
			System.out.println("file in not exists!");
			return null;
		}
		/*try {
			Workbook book = Workbook.getWorkbook(file);
			Sheet[] sheet = book.getSheets();
			if (sheet != null && sheet.length > 0) {
				for (int s = 0; s < sheet.length; s++) {
					List<String> field = new ArrayList();
					for (int r = 0; r < sheet[s].getRows(); r++) {
						Cell[] cell = sheet[s].getRow(r);
						if (r == 0) {
							for (int c = 0; c < cell.length; c++) {
								String value = cell[c].getContents();
								if (value != null && !value.equals("")) {
									field.add(value);
								}
							}
						} else if (r >= 1) {
							Object t = clazz.newInstance();
							for (int c = 0; c < cell.length; c++) {
								String value = cell[c].getContents();
								if (value != null && !value.trim().equals("")) {
									Class xtype = PropertyUtils.getPropertyType(t, field.get(c));
									String objectXtype = xtype.getName().toString();
									if (objectXtype.equals("java.lang.Integer")) {
										PropertyUtils.setProperty(t, field.get(c), Integer.parseInt(value));
										continue;
									} else if (xtype != null) {
										PropertyUtils.setProperty(t, field.get(c), value);
										continue;
									}
								}
							}
							if (t != null) {
								list.add(t);
							}

						}

					}

				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}*/
		return list;
	}

	/**
	 * 通过实体类和实体数据生成excel文件 导出数据到excel
	 * 
	 * @param clazz
	 *            User.class
	 * @param list
	 *            List<User> list
	 * @param outputPath 输出文件目录
	 */
	public static void genExcel(Class clazz, List<Object> list, String outputPath) {
		/*
		 * try { Workbook book = new HSSFWorkbook(); Sheet sheet =
		 * book.createSheet("数据"); Field[] fields = clazz.getDeclaredFields();
		 * Row row = sheet.getRow(0); for (int i = 0; i < fields.length; i++) {
		 * row.createCell(i).setCellValue(fields[i].getName().toString()); } int
		 * r = 1; for (Object p : list) { int c = 0; row = sheet.createRow(r);
		 * for (Field f : fields) {
		 * row.createCell(c).setCellValue(String.valueOf(PropertyUtils.
		 * getProperty(p, f.getName()))); c++; } r++; } FileOutputStream os =
		 * new FileOutputStream(outputPath+clazz.getName()+".xls");
		 * book.write(os); os.close(); book.close();
		 * 
		 * } catch (Exception e) { e.printStackTrace(); }
		 */
	}

	/**
	 * 数据导出
	 * 
	 * @param clazz 实体名称
	 * @param list 实体集合
	 * @param file 导入文件名
	 */
	public static void ExcelOutput(Class clazz, List list, File file) {
		/*
		 * try { Workbook book = new HSSFWorkbook(); Sheet sheet =
		 * book.createSheet("数据"); Field[] fields = clazz.getDeclaredFields();
		 * Row row = sheet.createRow(0); for (int i = 0; i < fields.length; i++)
		 * { row.createCell(i).setCellValue(fields[i].getName().toString()); }
		 * int r = 1; for (Object p : list) { int c = 0; row =
		 * sheet.createRow(r); for (Field f : fields) {
		 * row.createCell(c).setCellValue(String.valueOf(PropertyUtils.
		 * getProperty(p, f.getName()))); c++; } r++; } FileOutputStream os =
		 * new FileOutputStream(file); book.write(os); os.close(); book.close();
		 * } catch (Exception e) { e.printStackTrace(); }
		 */
	}

	/**
	 *
	 * @param params 列名key values键值对
	 * @param outputExcelFile 生成的excel文件名
	 * @param list 数据集合
	 */
	public static void exportExcel(Map<String,Object> params,File outputExcelFile,List list){
		HSSFWorkbook wb = new HSSFWorkbook();
		HSSFSheet sheet=wb.createSheet("sheet");
		HSSFRow row1=sheet.createRow(0);
		int i=0;
		//写入中文列名
		for(String key:params.keySet()){
			row1.createCell(i).setCellValue(String.valueOf(params.get(key)));
			i++;
		}
		//写入中文对应列数据
		for(int j=0;j<list.size();j++){
			HSSFRow row=sheet.createRow(j+1);
			Map map= (Map) list.get(j);
			int k=0;
			for(String key:params.keySet()){
				if(map.containsKey(key)){
					String value=String.valueOf(map.get(key));
					row.createCell(k).setCellValue(value);
					k++;
				}
			}
			/*for (Object key:map.keySet()){
				String value=String.valueOf(map.get(key));
				row.createCell(k).setCellValue(value);
				k++;
			}*/
			/*JSONObject jsonObject=(JSONObject)list.get(j);
			Iterator iterator = jsonObject.keys();
			int k=0;
			while(iterator.hasNext()){
				String key = (String) iterator.next();
				String value = jsonObject.getString(key);
				row.createCell(k).setCellValue(value);
				k++;
			}*/
		}
		try {
			FileOutputStream output=new FileOutputStream(outputExcelFile);
			wb.write(output);
			output.flush();
			output.close();
		}catch (Exception e){
				log.error("生成excel失败!"+e.getMessage());
		}

	}

	/**
	 * 生成数据导入模板
	 * @param params 各列中文参数
	 * @param excel 生成excel文件
	 */
	public static void genExcelTemplate(Map<String,Object> params,File excel){
		HSSFWorkbook wb = new HSSFWorkbook();
		HSSFSheet sheet=wb.createSheet("sheet");
		HSSFRow row1=sheet.createRow(0);
		int i=0;
		//写入中文列名
		for(String key:params.keySet()){
			row1.createCell(i).setCellValue(String.valueOf(params.get(key)));
			i++;
		}
		try {
			FileOutputStream output=new FileOutputStream(excel);
			wb.write(output);
			output.flush();
			output.close();
		}catch (Exception e){
			log.error("生成excel失败!"+e.getMessage());
		}
	}
	public static List<JSONObject> readExcel(File excelFile){
		List<JSONObject> list =new ArrayList<JSONObject>();
		boolean is2007=false;
		if (excelFile.getAbsolutePath().endsWith("xlsx")){
			is2007=true;
		}
		try {
			InputStream input = new FileInputStream(excelFile);  //建立输入流
			Workbook wb  = null;
			if (is2007){
				wb= new XSSFWorkbook(input);
			}else{
				wb = new HSSFWorkbook(input);
			}
			Sheet sheet = wb.getSheetAt(0);     //获得第一个表单
			Iterator<Row> rows = sheet.rowIterator(); //获得第一个表单的迭代器
			int i=0;
			while (rows.hasNext()) {
				Row row = rows.next();  //获得行数据
				System.out.println("Row #" + row.getRowNum());  //获得行号从0开始
				Iterator<Cell> cells = row.cellIterator();    //获得第一行的迭代器

				if(i==0){
					i++;
					continue;
				}
				JSONObject jsonObject=new JSONObject();
				int j=1;
				while (cells.hasNext()) {

					Cell cell = cells.next();
					System.out.println("Cell #" + cell.getColumnIndex());
					switch (cell.getCellType()) {   //根据cell中的类型来输出数据
						case HSSFCell.CELL_TYPE_NUMERIC:
							System.out.println(cell.getNumericCellValue());
							jsonObject.put("attr"+j,cell.getNumericCellValue());
							break;
						case HSSFCell.CELL_TYPE_STRING:
							System.out.println(cell.getStringCellValue());
							jsonObject.put("attr"+j,cell.getStringCellValue());
							break;
						case HSSFCell.CELL_TYPE_BOOLEAN:
							System.out.println(cell.getBooleanCellValue());
							jsonObject.put("attr"+j,cell.getBooleanCellValue());
							break;
						case HSSFCell.CELL_TYPE_FORMULA:
							System.out.println(cell.getCellFormula());
							jsonObject.put("attr"+j,cell.getCellFormula());
							break;
						default:
							System.out.println("unsuported sell type");
							break;
					}
					j++;
					list.add(jsonObject);
				}
			}

		}catch (FileNotFoundException e){
			log.error("找不到excel文件");
		}catch (IOException e){

		}
		return list;
	}
}
