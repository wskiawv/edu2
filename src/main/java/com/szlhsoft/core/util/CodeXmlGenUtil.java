package com.szlhsoft.core.util;

import org.w3c.dom.Document;
import org.w3c.dom.Element;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.FactoryConfigurationError;
import javax.xml.parsers.ParserConfigurationException;
import java.lang.reflect.Field;
import java.util.List;

public class CodeXmlGenUtil {
	
	private Document document;
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}
	public  void init(){
		try {
			DocumentBuilderFactory factory =DocumentBuilderFactory.newInstance();
			DocumentBuilder builder =factory.newDocumentBuilder();
			this.document=builder.newDocument();
		} catch (FactoryConfigurationError e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParserConfigurationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void xmlFileGen(List<Object> list,String xmlFile,Class clazz){
		Element root=this.document.createElement("codes");
		this.document.appendChild(root);
		Field[] fields = clazz.getDeclaredFields();
		for(Object o :list){
			/*Element code =this.document.createElement("code"); 
			code.add
			root.appendChild(code);*/
		}
	}

}
