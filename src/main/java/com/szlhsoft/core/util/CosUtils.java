package com.szlhsoft.core.util;

import com.qcloud.cos.*;
import com.qcloud.cos.request.*;
import com.qcloud.cos.sign.Credentials;

import java.io.InputStream;

public class CosUtils {
	private static long appId = 1252307104;
	private static String secretId = "AKIDNi1AAz6CXnrkT0IlsvpX4e4ILPI3g2GJ";
	private static String secretKey = "1ItKafaRI7nLm274rW3GVdfknKyVzhTE";
	// 设置要操作的bucket
	private static String bucketName = "edubucket";
	// 初始化秘钥信息
	private static Credentials cred = new Credentials(appId, secretId, secretKey);
	// 初始化客户端配置
	private static ClientConfig clientConfig = new ClientConfig();
	// 设置bucket所在的区域，比如华南园区：gz； 华北园区：tj；华东园区：sh ；
	static{
		clientConfig.setRegion("sh");
	}
	// 初始化cosClient
	private static COSClient cosClient = new COSClient(clientConfig, cred);;

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String cosPath="aa/产品规划及架构图.png";
		String localPath="d:/产品规划及架构图.png";
		CosUtils.upload(cosPath, localPath);
	}
	/**
	 * 上传文件
	 * @param cosPath
	 * @param localPath
	 */
	public static void upload(String cosPath,String localPath) {
		UploadFileRequest uploadFileRequest = new UploadFileRequest(bucketName, cosPath, localPath);
		String uploadFileRet = cosClient.uploadFile(uploadFileRequest);
	}
	/**
	 * 下载文件
	 * @param cosPath
	 * @param localPath
	 */
	public static void download(String cosPath,String localPath) {
		//String cosFilePath = "";
		//String localPathDown = "src/test/resources/local_file_down.txt";
		GetFileLocalRequest getFileLocalRequest = new GetFileLocalRequest(bucketName, cosPath, localPath);
		getFileLocalRequest.setUseCDN(false);
		getFileLocalRequest.setReferer("*.myweb.cn");
		String getFileResult = cosClient.getFileLocal(getFileLocalRequest);
	}
	/**
	 * 删除目录或文件
	 * @param path
	 */
	public static void delete(String path) {
		//删除文件
		if(path.contains(".")){
			delFile(path);
		}else{
			//删除目录 
			delFolder(path);
		}
		
	}
	/**
	 * 删除文件
	 * @param cosPath
	 */
	public static void delFile(String cosPath){
		DelFileRequest delFileRequest = new DelFileRequest(bucketName, cosPath);
		String delFileRet = cosClient.delFile(delFileRequest);
	}
	/**
	 * 创建目录
	 */
	public static void mkdir(String path) {
		CreateFolderRequest createFolderRequest = new CreateFolderRequest(bucketName, path);
		String createFolderRet = cosClient.createFolder(createFolderRequest);
	}

	/**
	 * 获取目录列表
	 */
	public static void list(String cosPath) {
		ListFolderRequest listFolderRequest = new ListFolderRequest(bucketName, cosPath);
		String listFolderRet = cosClient.listFolder(listFolderRequest);
	}

	/**
	 * 移动文件
	 */
	public static void move(String srcPath,String dstPath) {
		//String cosFilePath = "/sample_file.txt";
		//String dstCosFilePath = "/sample_file.txt.bak";
		MoveFileRequest moveRequest = new MoveFileRequest(bucketName, srcPath, dstPath);
		String moveFileResult = cosClient.moveFile(moveRequest);
	}

	/**
	 * 删除目录
	 */
	public static void delFolder(String cosPath) {
		DelFolderRequest delFolderRequest = new DelFolderRequest(bucketName, cosPath);
		String delFolderRet = cosClient.delFolder(delFolderRequest);
	}
	/**
	 * 读取cos文件流
	 * @param cosPath存储在cos上的文件
	 * @return
	 */
	public static InputStream getFileStream(String cosPath){
		InputStream inputStream=null;
		try{
			inputStream=cosClient.getFileInputStream(new GetFileInputStreamRequest(bucketName,cosPath));
		}catch(Exception e){
			
		}
		return inputStream;
	}

}
