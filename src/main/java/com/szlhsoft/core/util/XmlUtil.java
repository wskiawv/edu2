package com.szlhsoft.core.util;

import org.apache.commons.beanutils.PropertyUtils;
import org.dom4j.*;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.SAXReader;
import org.dom4j.io.XMLWriter;

import java.io.*;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.util.*;

public class XmlUtil {
	private static String xmlFile = "";
	private static String jsConfigFile="";
	//private static String modulesXmlFile="";
	private Document docment;
	static {
		xmlFile = XmlUtil.class.getClassLoader().getResource("").getPath() + "/config/storage.xml";
		//modulesXmlFile=XmlUtil.class.getClassLoader().getResource("").getPath() + "modules.xml";
		jsConfigFile = XmlUtil.class.getClassLoader().getResource("").getPath() + "/config/js.xml";
	}

	public static void main(String[] args) {
		/*
		 * String xml=null;
		 * List<Map<String,Object>>list=XmlUtil.getElementObject(xml);
		 * if(list!=null&&list.size()>0){ for(Map<String,Object> m:list){
		 * System.out.println(m.get("name")); System.out.println(m.get("url"));
		 * System.out.println(m.get("port")); } }
		 */
		/*File excelFile = new File("D:/workspace/doc/整理部标/高校本科专业代码.xls");
		List list = ExcelUtil.readExcel(FlatCode.class, excelFile);
		String xmlFile = "D:/workspace/doc/整理部标/高校本科专业代码.xml";
		XmlUtil.genXmlFile(list, xmlFile, FlatCode.class);
		List<FlatCode> list2=XmlUtil.readXml(FlatCode.class, xmlFile);
		for(FlatCode f :list2){
			System.out.println(f.getName());
			System.out.println(f.getCode());
		}*/
		//XmlUtil.getModules();
		Boolean flag= XmlUtil.getRootAttribute(null);
		//System.out.println(flag);
		List<String> list=getJsPath();
		for(String s:list){
			System.out.println(s);
		}
		
	}
	/**
	 * 获取xml文件数据
	 * @param clazz
	 * @param file
	 * @return
	 */
	public static List readXml(Class clazz, String file) {
		List list = new ArrayList();
		SAXReader reader = new SAXReader();		
		try {
			InputStream is = new FileInputStream(file);
			InputStreamReader isr = new InputStreamReader(is, "UTF-8");
			Document document = reader.read(isr);

			Element root = document.getRootElement();
			Field[] fields = clazz.getDeclaredFields();
			for(Iterator iterInner = root.elementIterator(); iterInner.hasNext();){
				Element e=(Element) iterInner.next();
				try {
					Object t = clazz.newInstance();
					for (Field f : fields) {
						String value =e.attributeValue(f.getName());
						if(value !=null && !value.trim().equals("")){
							Class xtype = PropertyUtils.getPropertyType(t, f.getName());
							String objectXtype = xtype.getName().toString();
							if (objectXtype.equals("java.lang.Integer")) {
								PropertyUtils.setProperty(t, f.getName(), Integer.parseInt(value));
								continue;
							} else if (xtype != null) {
								PropertyUtils.setProperty(t, f.getName(), value);
								continue;
							}
						}						
					}
					if(t != null){
						list.add(t);
					}
				} catch (NumberFormatException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				} catch (InstantiationException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				} catch (IllegalAccessException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				} catch (InvocationTargetException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				} catch (NoSuchMethodException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}				
				
			}			
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();		
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return list;
	}
	public static Boolean getRootAttribute(String file){
		Boolean flag=false;
		
		try {
			if (file == null) {
				file = xmlFile;
			}
			Document document;
			SAXReader saxReader = new SAXReader();
			InputStream is = new FileInputStream(file);
			InputStreamReader isr = new InputStreamReader(is, "UTF-8");
			document = saxReader.read(isr);
			Element root = document.getRootElement();
			flag=Boolean.parseBoolean(root.attribute("local").getValue());
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
		return flag;
	}
	public static List<Map<String, Object>> getElementObject(String file) {

		SAXReader saxReader = new SAXReader();
		boolean isUpdateMenus = false;
		List list = new ArrayList();
		try {
			if (file == null) {
				file = xmlFile;
			}
			InputStream is = new FileInputStream(file);
			InputStreamReader isr = new InputStreamReader(is, "UTF-8");
			Document document = saxReader.read(isr);

			Element root = document.getRootElement();

			for (Iterator iterInner = root.elementIterator(); iterInner.hasNext();) {
				Map<String, Object> map = new HashMap();
				Element e = (Element) iterInner.next();
				map.put("name", e.elementText("name"));
				map.put("url", e.elementText("url"));
				map.put("port", e.elementText("port"));
				list.add(map);
			}

		} catch (DocumentException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return list;
	}

	public static void getElementObjectList() {

	}

	public static void genXmlFile(List<Object> list, String xmlFile, Class clazz) {
		String strXML = null;
		Document document = DocumentHelper.createDocument();
		Element root = document.addElement("codes");
		Field[] fields = clazz.getDeclaredFields();
		for (Object o : list) {
			Element code = root.addElement("code");
			for (Field f : fields) {
				try {
					code.addAttribute(f.getName(), String.valueOf(PropertyUtils.getProperty(o, f.getName())));
				} catch (IllegalAccessException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (InvocationTargetException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (NoSuchMethodException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		StringWriter strWtr = new StringWriter();
		OutputFormat format = OutputFormat.createPrettyPrint();
		format.setEncoding("UTF-8");
		XMLWriter xmlWriter = new XMLWriter(strWtr, format);
		try {
			xmlWriter.write(document);
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		strXML = strWtr.toString();
		// --------

		// -------
		// strXML=document.asXML();
		// ------

		// -------------
		File file = new File(xmlFile);
		if (file.exists()) {
			file.delete();
		}
		try {
			file.createNewFile();
			XMLWriter out = new XMLWriter(new FileWriter(file));
			out.write(document);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	public void init() {

	}
	public static List getModules(String modulesXmlFile){		
		//String modulsXmlFile="modules.xml";
		//String path=this.getClass().getClassLoader().getResource("").getPath();	
		SAXReader saxReader = new SAXReader();
		List list=new ArrayList();
		try {
			InputStream is = new FileInputStream(modulesXmlFile);
			InputStreamReader isr = new InputStreamReader(is, "UTF-8");
			Document document = saxReader.read(isr);
			
			Element root = document.getRootElement();
			//Boolean isUpdateMenus=Boolean.parseBoolean(root.attribute("isUpdateMenus").getValue());
			for (Iterator iterInner = root.elementIterator(); iterInner.hasNext();) {
				Map<String,String> map = new HashMap();
				Element e = (Element) iterInner.next();
				Attribute attrText=e.attribute("text");
				Attribute attrIconCls=e.attribute("iconCls");
				Attribute attrDIconCls=e.attribute("diconCls");
				Attribute attrName=e.attribute("name");
				Attribute attrMenu=e.attribute("menu");
				Attribute attrPackage=e.attribute("package");
				map.put("text", attrText.getValue());
				map.put("iconCls", attrIconCls.getValue());
				map.put("diconCls", attrDIconCls.getValue());
				map.put("name", attrName.getValue());
				map.put("menu", attrMenu.getValue());
				map.put("package",attrPackage.getValue());
				System.out.println(attrText.getValue());	
				System.out.println(attrIconCls.getValue());
				System.out.println(attrDIconCls.getValue());
				System.out.println(attrName.getValue());
				System.out.println(attrMenu.getValue());
				System.out.println(attrPackage.getValue());
				list.add(map);
			}
			return list;
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
		//isUpdateMenus = Boolean.parseBoolean(root.attribute("isUpdateMenus").getValue());
	}
	/**
	 * 获取角色配置
	 * @param roleXmlFile
	 * @return
	 */
	public static List<Map<String,String>> getRole(String roleXmlFile){
		
		SAXReader saxReader = new SAXReader();
		List list=new ArrayList();
		try {
			InputStream is = new FileInputStream(roleXmlFile);
			InputStreamReader isr = new InputStreamReader(is, "UTF-8");
			Document document = saxReader.read(isr);
			
			Element root = document.getRootElement();
			//Boolean isUpdateMenus=Boolean.parseBoolean(root.attribute("isUpdateMenus").getValue());
			for (Iterator iterInner = root.elementIterator(); iterInner.hasNext();) {
				Map<String,String> map = new HashMap();
				Element e = (Element) iterInner.next();
				Attribute attrName=e.attribute("name");	
				Attribute attrCode=e.attribute("code");	
				map.put("name", attrName.getValue());
				map.put("code", attrCode.getValue());
				list.add(map);
			}
			return list;
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;		
	}
	/**
	 * 获取用户
	 * @param userXmlFile
	 * @return
	 */
	public static List<Map<String,String>> getUser(String userXmlFile){
		
		SAXReader saxReader = new SAXReader();
		List list=new ArrayList();
		try {
			InputStream is = new FileInputStream(userXmlFile);
			InputStreamReader isr = new InputStreamReader(is, "UTF-8");
			Document document = saxReader.read(isr);
			
			Element root = document.getRootElement();
			//Boolean isUpdateMenus=Boolean.parseBoolean(root.attribute("isUpdateMenus").getValue());
			for (Iterator iterInner = root.elementIterator(); iterInner.hasNext();) {
				Map<String,String> map = new HashMap();
				Element e = (Element) iterInner.next();
				Attribute attrName=e.attribute("name");	
				Attribute attrLoginName=e.attribute("loginName");
				Attribute attrPassword=e.attribute("password");	
				Attribute attrRole=e.attribute("role");	
				map.put("name", attrName.getValue());
				map.put("loginName", attrLoginName.getValue());
				map.put("password", attrPassword.getValue());
				map.put("role", attrRole.getValue());
				list.add(map);
			}
			return list;
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;		
	}
	/**
	 * 读取Js.xml配置文件
	 * @return
	 */
	public static List<Map<String,String>> genJsPath(){	
		SAXReader saxReader = new SAXReader();
		List<Map<String,String>> list=new ArrayList();
		try {
			InputStream is = new FileInputStream(jsConfigFile);
			InputStreamReader isr = new InputStreamReader(is, "UTF-8");
			Document document = saxReader.read(isr);
			
			Element root = document.getRootElement();			
			for (Iterator iterInner = root.elementIterator(); iterInner.hasNext();) {
				Map<String,String> map = new HashMap();
				Element e = (Element) iterInner.next();
				Attribute attrSrc=e.attribute("src");	
				Attribute attrModules=e.attribute("modules");	
				String jsPath=attrSrc.getValue();
				//String modules=attrModules.getValue();
				map.put("jsPath", jsPath);
				if(attrModules !=null){
					map.put("modules", attrModules.getValue());
				}else{
					map.put("modules",null);
				}				
				list.add(map);
			}
			return list;
		} catch (FileNotFoundException e) {			
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {			
			e.printStackTrace();
		} catch (DocumentException e) {			
			e.printStackTrace();
		}
		return list;
	}
	/**
	 * 返回jsPath路径
	 * @return
	 */
	public static List<String> getJsPath(){
		List<Map<String,String>> list=genJsPath();
		List<String> jsPathList=new ArrayList();
		for(Map m:list){
			jsPathList.add(m.get("jsPath").toString());
		}
		return jsPathList;
	}
}
