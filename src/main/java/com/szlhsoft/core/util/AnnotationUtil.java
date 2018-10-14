package com.szlhsoft.core.util;

import com.szlhsoft.annotation.Ctl;

import java.lang.annotation.Annotation;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class AnnotationUtil {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}
	public static List<Map<String,String>> getCtlAnnotationConfig(String CtlClass){
		List<Map<String,String>> list=new ArrayList();
		try {
			Class c=Class.forName(CtlClass).newInstance().getClass();
			Ctl ctl=(Ctl) c.getAnnotation(Ctl.class);
			String ctlName=ctl.name();
			Method m[]=c.getDeclaredMethods();
			
			for(Method i:m){
				Annotation a[]=i.getAnnotations();
				Map<String,String> map=new HashMap();				
				String method=i.getName();
				map.put("ctlName", ctlName);
				map.put("method", method);
				for(Annotation j:a){
					if(j.annotationType().equals(com.szlhsoft.annotation.Method.class)){
						com.szlhsoft.annotation.Method methodName=i.getAnnotation(com.szlhsoft.annotation.Method.class);
						map.put("methodName", methodName.name());
					}
				}
				list.add(map);
			}
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

}
