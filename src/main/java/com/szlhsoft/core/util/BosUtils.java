package com.szlhsoft.core.util;

import com.baidubce.services.bos.BosClient;
import com.baidubce.services.bos.BosClientConfiguration;
import com.baidubce.services.bos.model.*;

import java.io.File;
import java.io.InputStream;

public class BosUtils {
	private static String ACCESS_KEY_ID = "<your-access-key-id>";                   // 用户的Access Key ID
    private static String SECRET_ACCESS_KEY = "<your-secret-access-key>";           // 用户的Secret Access Key
    private static String bucketName="";
    // 初始化一个BosClient
    private static BosClientConfiguration config = new BosClientConfiguration();
   // config.setCredentials(new DefaultBosCredentials(ACCESS_KEY_ID, SECRET_ACCESS_KEY));
    //config.
    private static BosClient client = new BosClient(config);
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}
	public static void uploadInputStream(String bosPath ,InputStream inputStream){
		PutObjectResponse putObjectResponseFromInputStream = client.putObject(bucketName, bosPath, inputStream);
	}
	public static void upload(String bosPath,String localPath){
		client.putObject(bucketName,bosPath,new File(localPath));
	}
	public static void download(String bosPath,String localPath){
		GetObjectRequest getObjectRequest = new GetObjectRequest(bucketName, bosPath);

		// 下载Object到文件
		ObjectMetadata objectMetadata = client.getObject(getObjectRequest, new File(localPath));
	}
	public static void delete(String bosPath){
		 client.deleteObject(bucketName,bosPath);  
	}
	public static void mkdir(String bosPath){
		
	}
	public static void move(String srcPath,String desPath){
		
	}
	public static void copy(String srcPath,String desPath){
		 CopyObjectResponse copyObjectResponse = client.copyObject(bucketName, srcPath, bucketName, desPath);
	}
	public static void list(String bosPath){
		ListObjectsRequest listObjectsRequest = new ListObjectsRequest(bucketName);

		// 递归列出fun目录下的所有文件
		listObjectsRequest.setPrefix(bosPath);

		ListObjectsResponse listing = client.listObjects(listObjectsRequest);

		// 遍历所有Object
		System.out.println("Objects:");
		for (BosObjectSummary objectSummary : listing.getContents()) {
		    System.out.println(objectSummary.getKey());
		}
		
	}

}
