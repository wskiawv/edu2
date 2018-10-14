package com.szlhsoft.core.util;

import freemarker.template.Configuration;
import freemarker.template.Template;
import org.apache.commons.lang.StringUtils;

import java.io.*;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ExtJsUtil {

	private static InputStream crudPanel=null;
	private static InputStream crudEditPanel=null;
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*Map<String,Object> map=new HashMap();
		map.put("jsPath","E:/workspace/OA/src/main/webapp/js/");
		map.put("controller","Admins");
		map.put("modules","sys");
		map.put("package", "desktop.app.eims");
		//map.put("", );
		ExtJsUtil.init();
		ExtJsUtil.GenCRUDPanelCode(Admin.class, map);*/

	}
	public static void init(){
		try {
			crudPanel = ExtJsUtil.class.getResource("CRUDPanel.ftl").openStream();
			crudEditPanel = ExtJsUtil.class.getResource("CRUDEditPanel.ftl").openStream();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
	/**
	 * 生成 弹出窗口新增编辑CRUDPanel
	 * @param model
	 * @param context
	 * 
	 */
	public static void GenCRUDPanelCode(Class model,Map<String,String> context){
		List<String> modelFiledList=new ArrayList();
		String modelName=model.getName().toString();
		modelName=modelName.substring(modelName.lastIndexOf(".")+1);
		String jsPath=context.get("jsPath").toString();
		String jsFile=jsPath+StringUtils.join(StringUtils.split(context.get("package").toString(), "."), "/") + "/"+context.get("modules")+ "/"+modelName+".js";
		System.out.println(jsFile);
		Map map=new HashMap();
		map.put("model",modelName);
		map.put("modules",context.get("modules"));
		map.put("_package",context.get("package"));
		map.put("controller",context.get("controller"));
		System.out.println(modelName);		
		List<String> fieldList=new ArrayList<String>();
		for(Field field:model.getFields()){
			System.out.println(field.getName());
			System.out.println(field.getType());
			fieldList.add(field.getName());
		}
		
		for(Field field:model.getDeclaredFields()){
			fieldList.add(field.getName());
			System.out.println(field.getName());
			System.out.println(field.getType());			
		}
		map.put("fieldList",fieldList);
		try{
		InputStream templateContent = getContent(null, crudPanel);
		process(map, templateContent, jsFile);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	/**
	 * 生成行编辑ext xtype组件
	 * @param model
	 * @param context 
	 */
	public static void GenCRUDEditPanelCode(Class model,Map<String,String> context){
		List<String> modelFiledList=new ArrayList();
		String modelName=model.getName().toString();
		modelName=modelName.substring(modelName.lastIndexOf(".")+1);
		String jsPath=context.get("jsPath").toString();
		String jsFile=jsPath+StringUtils.join(StringUtils.split(context.get("package").toString(), "."), "/") + "/"+context.get("modules")+ "/"+modelName+".js";
		System.out.println(jsFile);
		Map map=new HashMap();
		map.put("model",modelName);
		map.put("modules",context.get("modules"));
		map.put("_package",context.get("package"));
		map.put("controller",context.get("controller"));
		System.out.println(modelName);		
		List<String> fieldList=new ArrayList<String>();
		for(Field field:model.getFields()){
			System.out.println(field.getName());
			System.out.println(field.getType());
			fieldList.add(field.getName());
		}
		
		for(Field field:model.getDeclaredFields()){
			fieldList.add(field.getName());
			System.out.println(field.getName());
			System.out.println(field.getType());			
		}
		map.put("fieldList",fieldList);
		try{
		InputStream templateContent = getContent(null, crudEditPanel);
		process(map, templateContent, jsFile);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	private static InputStream getContent(InputStream file, InputStream def) throws Exception {
		if (file != null) {
			return file;
		}
		return def;
	}
	/**
	 * 根据模板生成文件
	 * @param context
	 * @param templateContent
	 * @param javaPath
	 * @throws Exception
	 */
	private static void process(Map<String, Object> context, InputStream templateContent, String jsPath) throws Exception {
		File f = new File(jsPath);
		if (!f.getParentFile().exists()) {
			f.getParentFile().mkdirs();
		}
		Configuration cfg = new Configuration();
		cfg.setTemplateLoader(new InputStreamTemplateLoader(templateContent));
		cfg.setDefaultEncoding("UTF-8");
		Template template = cfg.getTemplate("");
		Writer out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(f), "UTF-8"));
		template.process(context, out);
		out.flush();
	}
}
