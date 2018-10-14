package com.szlhsoft.core.util.http;

import com.szlhsoft.core.util.http.HttpParams.Pair;
import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.FileEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

import javax.net.ssl.KeyManager;
import javax.net.ssl.SSLContext;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;
import java.io.*;
import java.net.*;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.cert.CertificateException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class HttpUtil {
	private static final String DEFAULT_ENCODING = "UTF-8";
	
	public static String post(HttpClient httpclient, String url, HttpParams params) {
		return post(httpclient, url, params, null);
	}

	public static String post(HttpClient httpclient, String url) {
		return post(httpclient, url, null, null);
	}

	public static String post(String url) {
		return post(getHttpClient(), url, null, null);
	}
	/**
	 * https免证书请求
	 * @param urlvalue 要请求的url
	 * @param requestMethod 请求的方式  get ，post
	 * @return
	 */
	public static String sslCheck(String urlvalue,String requestMethod){
		try {
			SSLContext ctx = SSLContext.getInstance("SSL");
			ctx.init(new KeyManager[0], new TrustManager[] {new SkipCertificateHttps()}, new SecureRandom());
	        SSLContext.setDefault(ctx);
			URL url = new URL(urlvalue);
			//设置代理  new Proxy(Proxy.Type.HTTP, new InetSocketAddress("127.0.0.1", 8087))
			HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();
			return commonHttp(urlvalue, requestMethod, urlConnection);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (KeyManagementException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return "";
	}
	/**
	 * 发送post请求
	 * @param rootUrl 根url 第一个"？"之前
	 * @param param 第一个"？"之后的参数
	 * @return
	 */
	public static String sslPostCheck(String rootUrl,String param){
		try {
			SSLContext ctx = SSLContext.getInstance("SSL");
			ctx.init(new KeyManager[0], new TrustManager[] {new SkipCertificateHttps()}, new SecureRandom());
	        SSLContext.setDefault(ctx);
			URL url = new URL(rootUrl);
			HttpURLConnection httpUrlConnection = (HttpURLConnection) url.openConnection(new Proxy(Proxy.Type.HTTP, new InetSocketAddress("127.0.0.1", 8087)));
	        httpUrlConnection.setDoInput(true);
	        httpUrlConnection.setDoOutput(true);
	        httpUrlConnection.setRequestMethod("POST");
	        byte[] bypes = param.getBytes();
	        httpUrlConnection.getOutputStream().write(bypes);// 输入参数
	        InputStream in = httpUrlConnection.getInputStream();
	        ByteArrayOutputStream outStream = new ByteArrayOutputStream();
	        byte[] buffer = new byte[100];
	        int len = 0;
	        while( (len = in.read(buffer)) !=-1 ){
	            outStream.write(buffer, 0, len);
	        }
	        byte[] data = outStream.toByteArray();//网页的二进制数据
	        outStream.close();
	        in.close();
	        return new String(data);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (KeyManagementException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return "";
	}
	/**
	 * 一般的请求  不需要设置代理
	 * @param urlvalue
	 * @param requestMethod
	 * @return
	 */
	public static String check(String urlvalue,String requestMethod){
		try {
			URL url = new URL(urlvalue);
			HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();
			return commonHttp(urlvalue, requestMethod, urlConnection);
		}catch (MalformedURLException e) {
			e.printStackTrace();
		}catch (IOException e) {
			e.printStackTrace();
		}
		return "";
	}
	/**
	 * http请求参数 
	 * @param urlvalue 请求的url
	 * @param requestMethod 请求的方式：为null或没有设置 默认为get
	 * @return  返回请求的结果
	 */
	public static String commonHttp(String urlvalue,String requestMethod,HttpURLConnection urlConnection) {
		String inputLine = "";
		BufferedReader in =null;
		InputStreamReader isr =null;
		InputStream is = null;
		try {
			if (requestMethod == null || requestMethod.trim().equals("")) {
		    	 requestMethod = "GET";
			}
		    urlConnection.setRequestMethod(requestMethod);
		    is=urlConnection.getInputStream();
		    isr = new InputStreamReader(is,"utf-8");
		    in = new BufferedReader(isr);
		    String  result = null;
		    while((result = in.readLine())!= null){
		    	inputLine += result;
		    }
		} catch (Exception e) {
			e.printStackTrace();
			return inputLine;
		}finally{
			if (urlConnection != null) {
				urlConnection.disconnect();
			}
			try {
				if (is !=null) {
					is.close();
				}
				if (isr !=null) {
					isr.close();
				}
				if (in != null) {
					in.close();
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return inputLine;
	}

	/**
	 * 用http post 的方式请求一个url
	 * 
	 * @param httpclient 
	 * @param url post方式请求的url
	 * @param paramMap 参数
	 * @return 
	 */
	public static String post(HttpClient httpclient, String url, HttpParams params,String encoding) {
		// Create a new HttpClient and Post Header
		HttpPost httppost = new HttpPost(url);

		try {
			// Add your data
			List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>(2);
			if (params != null && params.size() != 0) {
				for (Pair p : params.getPairs()) {
					nameValuePairs
							.add(new BasicNameValuePair(p.getKey(), p.getValue()));
				}
				httppost.setEntity(new UrlEncodedFormEntity(nameValuePairs));
			}
			if(encoding == null){
				encoding = DEFAULT_ENCODING;
			}

			// Execute HTTP Post Request
			HttpResponse response = httpclient.execute(httppost);
			if (response.getStatusLine().getStatusCode() == HttpStatus.SC_OK) {
				byte[] bResultXml = EntityUtils.toByteArray(response
						.getEntity());
				if (bResultXml != null) {
					String strXml = new String(bResultXml, encoding);
					return strXml;
				}
			}

		} catch (ClientProtocolException e) {
			e.printStackTrace();
			return null;
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}

		return null;
	}

	/**
	 * 用http get 的方式请求一个url
	 * 
	 * @param httpclient 
	 * @param url 请求的url
	 * @param paramMap 参数
	 * @return 
	 */
	public static String get(HttpClient httpclient, String url, HttpParams paramMap,String encoding) {
		if (paramMap != null && paramMap.size() != 0) {
			boolean isFirst = true;
			for (Pair p : paramMap.getPairs()) {
				if (isFirst && !url.contains("?")) {
					url += ("?" + p.getKey() + "=" + p.getValue());
					isFirst = false;
				} else {
					url += ("&" + p.getKey() + "=" + p.getValue());
					isFirst = false;
				}
			}
		}

		if(encoding == null){
			encoding = DEFAULT_ENCODING;
		}
		try {
			return Http.get(url).use(httpclient).charset(encoding).asString();
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public static String get(HttpClient httpclient, String url, HttpParams paramMap) {
		return get(httpclient, url, paramMap, null);
	}

	public static String get(HttpClient httpclient, String url) {
		return get(httpclient, url, null, null);
	}

	public static String get(String url) {
		return get(getHttpClient(), url, null, null);
	}

	/**
	 * 上传一个文件
	 * 
	 * @param url 要上传的url
	 * @param uploadFile 要上传的文凭
	 * @return
	 */
	public static boolean postFile(String url, File uploadFile) {
		if(url == null || uploadFile == null){
			return false;
		}
		HttpClient client = getHttpClient();
		HttpPost httpPost = new HttpPost(url);
		HttpResponse response = null;
		try {
			FileEntity entity = new FileEntity(uploadFile, ContentType.DEFAULT_BINARY);
			httpPost.setEntity(entity);
			response = client.execute(httpPost);
		} catch (Exception e) {
		} finally {
		}
		
		if (response != null
				&& response.getStatusLine().getStatusCode() == HttpStatus.SC_OK) {
			return true;
		}
		return false;
	}
   /**
    * 请求返回的结果一般以"&"连接起来拼接的字符串 分割转为map
    * @param result
    * @return
    */
	public static Map stringToMap(String result){
		if (result==null||result.equals("")||!result.contains("&")) {
			return null;
		}
		String [] res=result.split("&");
		Map  map=new HashMap();
		if (res!=null) {
			for (int i = 0; i < res.length; i++) {
				String [] in=(res[i]).split("=");
				map.put(in[0], in[1]);
			}
		}
		return map;
	}
	
	public static HttpClient getHttpClient() {
		return new DefaultHttpClient();
	}
	
	public static void main(String[] args) throws Exception{
		SSLContext ctx = SSLContext.getInstance("SSL");
		ctx.init(new KeyManager[0], new TrustManager[] {new SkipCertificateHttps()}, new SecureRandom());
        SSLContext.setDefault(ctx);
        URL url = new URL("https://accounts.google.com/o/oauth2/token");
		HttpURLConnection httpUrlConnection = (HttpURLConnection) url.openConnection(new Proxy(Proxy.Type.HTTP, new InetSocketAddress("127.0.0.1", 8087)));
        httpUrlConnection.setDoInput(true);
        httpUrlConnection.setDoOutput(true);
        httpUrlConnection.setRequestMethod("POST");
        byte[] bypes = "code=4/3xtGJ4415WEY_uRqPpT41KUBK9k3.Ykgu1-lRyPcaBrG_bnfDxpIy9WtyjgI&client_id=1395893587-36v23de7d38a1sm4cuf15po6i3qjq8h4.apps.googleusercontent.com&client_secret=gRMBZv0bpxLCS3vvcsOSGy1p&redirect_uri=http://sml.renderbus.com/customerThirdAction.action?fromWhere=gmail&grant_type=authorization_code".toString().getBytes();
        httpUrlConnection.getOutputStream().write(bypes);// 输入参数
        InputStream in = httpUrlConnection.getInputStream();
        ByteArrayOutputStream outStream = new ByteArrayOutputStream();
        byte[] buffer = new byte[1024];
        int len = 0;
        while( (len = in.read(buffer)) !=-1 ){
            outStream.write(buffer, 0, len);
        }
        byte[] data = outStream.toByteArray();//网页的二进制数据
        outStream.close();
        in.close();
      System.err.println(new String(data));
       String responseMessage = httpUrlConnection.getResponseMessage();
       System.err.println(responseMessage);
	}
	
}

class SkipCertificateHttps implements X509TrustManager {

		/* (non-Javadoc)
		 * @see javax.net.ssl.X509TrustManager#checkClientTrusted(java.security.cert.X509Certificate[], java.lang.String)
		 */
		public void checkClientTrusted(
				java.security.cert.X509Certificate[] arg0, String arg1)
				throws CertificateException {
			// TODO Auto-generated method stub
			
		}

		/* (non-Javadoc)
		 * @see javax.net.ssl.X509TrustManager#checkServerTrusted(java.security.cert.X509Certificate[], java.lang.String)
		 */
		public void checkServerTrusted(
				java.security.cert.X509Certificate[] arg0, String arg1)
				throws CertificateException {
			// TODO Auto-generated method stub
			
		}

		/* (non-Javadoc)
		 * @see javax.net.ssl.X509TrustManager#getAcceptedIssuers()
		 */
		public java.security.cert.X509Certificate[] getAcceptedIssuers() {
			// TODO Auto-generated method stub
			return null;
		}

    
 }
