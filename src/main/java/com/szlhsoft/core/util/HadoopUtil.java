package com.szlhsoft.core.util;

import net.sf.json.JSONObject;
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FSDataInputStream;
import org.apache.hadoop.fs.FileStatus;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class HadoopUtil {
	
	private static FileSystem fs=null;
	private static String url=null;
	static{
		try{			
			Configuration conf =new Configuration();
			String file=null;
			List<Map<String,Object>>list=XmlUtil.getElementObject(file);			
			if(list!=null&&list.size()>0){
				url=String.valueOf(list.get(0).get("url"));
			}else{
				url="hdfs://10.38.66.200:9000/";
			}			
			conf.set("fs.defaultFS", url);
			conf.set("dfs.replication", "1");
			fs=FileSystem.get(conf);
		}catch(IOException e){
			e.printStackTrace();
		}
	}
	/*@Before
	public void getFs(){
		try{			
			Configuration conf =new Configuration();
			conf.set("fs.defaultFS", "hdfs://192.168.1.200:9000");
			conf.set("dfs.replication", "1");
			fs=FileSystem.get(conf);
		}catch(IOException e){
			e.printStackTrace();
		}
		
	}*/
	public static boolean exists(String path){
		try {
			return fs.exists(new Path(path));
		} catch (IllegalArgumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		
	}
	/**
	 * 单个文件上传
	 * @param uploadFile
	 * @param uploadPath
	 */
	public static void upload(String uploadFile,String uploadPath){
		try{
			fs.copyFromLocalFile(true,new Path(uploadFile),new Path(url+uploadPath));
		}catch(IOException e){
			e.printStackTrace();
		}
		
	}
	/**
	 * 下载文件
	 * @param downloadFile
	 * @param localFile
	 */
	public static void download(String downloadFile,String localFile){
		try{
			fs.copyToLocalFile(false,new Path(downloadFile), new Path(localFile),true);			
		}catch(IOException e){
			e.printStackTrace();
		}
	}
	/**
	 * 删除目录及文件夹
	 * @param deleteFile
	 */
	public static void delete(String deleteFile){
		try{
			Boolean s=fs.delete(new Path(deleteFile),true);
			System.out.println(s?"delete success":"delete fail");
		}catch(IOException e){
			e.printStackTrace();
		}
	}
	/**
	 * 创建空目录
	 * @param path
	 */
	public static void mkdir(String path){
		try{
			fs.mkdirs(new Path(path));
		}catch(IOException e){
			e.printStackTrace();
		}
	}
	/**
	 * 重命名
	 * @param oldPath
	 * @param dst
	 */
	public static void rename(String oldPath,String dst){
		try{
			fs.rename(new Path(oldPath), new Path(dst));
		}catch(IOException e){
			e.printStackTrace();
		}
	}
	/**
	 * 获取目录文件及文件夹列表
	 * @param path
	 * @return
	 */
	public static List<JSONObject>  getFileList(String path){
		List<JSONObject> list=new ArrayList<JSONObject>();
		try {
			fs.listFiles(new Path(path),true);
			FileStatus[] status=fs.listStatus(new Path(path));			
			SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			for(FileStatus file:status){
				JSONObject js=new JSONObject();
				String xtype="";
				if(file.isFile()){
					xtype=file.getPath().getName().substring(file.getPath().getName().lastIndexOf(".") + 1);
				}else{
					xtype="文件夹";
				}
				String size="";
				if(file.getLen()>1024){
					Long filelong=file.getLen()/1024;
					size=filelong.toString()+" KB";
					if(filelong>1024)
					{
						size=filelong/1024+" MB";
					}
				}else if(file.getLen()==0){
					size="0 KB";
				}
				js.put("FileName",file.getPath().getName());
				js.put("FilePath",file.getPath().toString());
				js.put("size",size);
				js.put("owner",file.getOwner());
				js.put("updatetime", df.format(file.getModificationTime()));
				js.put("FileType",xtype);
				list.add(js);
			}
			return list;
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	public static void copy(String oldPath,String dst){
		try {
			fs.copyToLocalFile(new Path(oldPath),new Path(dst));
		} catch (IllegalArgumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static void move(String oldPath,String dst){
		try {
			fs.moveToLocalFile(new Path(oldPath),new Path(dst));
		} catch (IllegalArgumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static InputStream getInputStream(String path){
		InputStream is=null;
		try {
			FSDataInputStream fsDIS=fs.open(new Path(path));
			is=fsDIS.getWrappedStream();
			return is;
		} catch (IllegalArgumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return is;
	}
	/**
	 * 批量文件上传
	 * @param path
	 * @param uploadPath
	 */
	public static void upload(String []path,String uploadPath){
		Path [] paths=null;
		if(path !=null){
			for(String s:path){
				int i=0;				
				paths[i]=new Path(s);
				i++;
			}
		}else{
			return;
		}
		
		try{
			fs.copyFromLocalFile(true,false,paths,new Path(url+uploadPath));
		}catch(IOException e){
			e.printStackTrace();
		}
	}
}
