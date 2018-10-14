package com.szlhsoft.core.util;

import net.sf.json.JSONObject;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class LocalDirUtil {

	public static List<JSONObject> getLocalDir(String path){
		
		List<JSONObject> list= new ArrayList();
		if(path == null){
			return list;
		}
		File rootDir=new File(path);
		if(!rootDir.exists()){
			return list;
		}
		File[]files=rootDir.listFiles();
		SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		for(File file:files){
			JSONObject js=new JSONObject();
			String size="";
			String xtype="";
			if(file.length()>1024)
			{
				
				Long filelong=file.length()/1024;
				size=filelong.toString()+"KB";
				if(filelong>1024)
				{
					size=filelong/1024+"MB";
				}
			}
			if(file.isFile()){
				xtype=file.getName().substring(file.getName().lastIndexOf(".") + 1);
			}else{
				xtype="文件夹";
			}
			js.put("FileName",file.getName().toString());
			js.put("FilePath",file.getPath().toString());
			js.put("size",size);
			js.put("owner","无");
			js.put("updatetime", df.format(file.lastModified()));
			js.put("FileType",xtype);
			list.add(js);
		}
		return list;
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		List<JSONObject> list= LocalDirUtil.getLocalDir(null);
		for(JSONObject js:list){
			System.out.println(js.get("FileName"));
			System.out.println(js.get("FilePath"));
			System.out.println(js.get("size"));
			System.out.println(js.get("owner"));
			System.out.println(js.get("updatetime"));
			System.out.println(js.get("FileType"));			
		}
	}

}
