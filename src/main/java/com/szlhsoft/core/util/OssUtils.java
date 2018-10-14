package com.szlhsoft.core.util;

import com.aliyun.oss.OSSClient;
import com.aliyun.oss.model.*;

import java.io.*;
import java.util.List;

public class OssUtils {
	private static String endpoint = "<endpoint, http://oss-cn-hangzhou.aliyuncs.com>";
    private static String accessKeyId = "LTAIcTwcCnWzxpUq";
    private static String accessKeySecret = "993ecBxonJmri8xXiMw01VoRpoE6ON";
    private static String bucketName = "<bucketName>";
    private static String key = "<key>";
    // 创建OSSClient实例
    private static OSSClient client = new OSSClient(endpoint, accessKeyId, accessKeySecret);
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}
	public static void upload(String localPath,String ossPath){
		client.putObject(bucketName,key,new File(localPath));
	}
	public static void download(String localPath,String ossPath){
		client.getObject(bucketName,key);
	}
	/**
	 * 删除目录都文件
	 * @param ossPath
	 */
	public static void delete(String ossPath){
		client.deleteObject(bucketName, key);
	}
	/**
	 * 创建oss目录,oss没有目录概念
	 * @param ossPath
	 */
	public static void mkdir(String ossPath){
		
	}
	/**
	 * 罗列oss目录下的文件
	 * @param ossPath
	 * @param maxKeys
	 */
	public static void list(String ossPath,int maxKeys){
		String marker=null;
		ObjectListing objectListing = client.listObjects(new ListObjectsRequest(bucketName).withMarker(marker).withMaxKeys(maxKeys));
		List<OSSObjectSummary> sums = objectListing.getObjectSummaries();
		for (OSSObjectSummary s : sums) {
		    System.out.println("\t" + s.getKey());
		}
	}
	/**
	 * 上传文件流或网络流到oss
	 * @param inputStream
	 */
	public static void uploadInputStream(InputStream inputStream){
		client.putObject(bucketName, key, inputStream);
	}
	public static void downloadInputStream(String ossPath){
		OSSObject ossObject=client.getObject(bucketName, ossPath);
		// 读Object内容
		
		BufferedReader reader = new BufferedReader(new InputStreamReader(ossObject.getObjectContent()));
		try{
		while (true) {
		    String line = reader.readLine();
		    if (line == null) break;
		    System.out.println("\n" + line);
		}
		reader.close();
		}catch(IOException e){
			
		}
	}
	/**
	 * 拷贝oss文件到另一个目录
	 * @param srcPath
	 * @param destPath
	 */
	public static void copy(String srcPath,String destPath){
		CopyObjectResult result = client.copyObject(bucketName, srcPath, bucketName, destPath);
		result.getETag();
	}
	/**
	 * 获取推流记录
	 * @param ossVideoPath
	 * @return
	 */
	public static List<LiveRecord> hlsVod(String ossVideoPath){
		List<LiveRecord> record=client.getLiveChannelHistory(bucketName, ossVideoPath);
		return record;
	}
	/**
	 * 获取rtmp推流地址
	 * @param ossPath
	 * @param PlaylistName
	 * @return
	 */
	public static String rtmpStream(String ossPath,String PlaylistName){
		String liveAddress=client.generateRtmpUri(bucketName, ossPath, PlaylistName,0000000000);
		return liveAddress;
	}
}
