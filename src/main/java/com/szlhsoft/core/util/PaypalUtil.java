package com.szlhsoft.core.util;

import com.szlhsoft.core.util.http.HttpUtil;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @ClassName: PaypalUtil 
 * @Description: TODO
 * @author sml
 * @date 2014-5-26 下午02:09:41
 *  Copyright 2014-05-12 Rayvision Software Co. Ltd.
 *  All right reserved.
 */
public class PaypalUtil {
	private static Log log = LogFactory.getLog(PaypalUtil.class);
    ///////Papay快速结账模式
	public static String ECM_URL="https://api-3t.paypal.com/nvp?";
	public static String ECM_USER="";
	public static String ECM_PWD="";
	public static String ECM_SIGNATURE="";
	public static String ECM_VERSION="93" ;//= "renderbus@gmail.com";
	public static String EC_CODE="utf-8";
	public static String ECM_OFFICIAL_URL = "https://www.paypal.com/cgi-bin/webscr";
	
	public static List<Map<String, String>> getSingleTrade(){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd!HH:mm:ss?");
		StringBuffer sb = new StringBuffer();
		sb.append(ECM_URL);
		sb.append("USER=");
		sb.append(ECM_USER);
		sb.append("&PWD=");
		sb.append(ECM_PWD);
		sb.append("&SIGNATURE=");
		sb.append(ECM_SIGNATURE);
		//以上数据提供三重验证
		sb.append("&VERSION=");
		sb.append(ECM_VERSION);
		sb.append("&METHOD=TransactionSearch");//调用API
		sb.append("&STARTDATE=");//开始查询日期
		//sb.append("2015-01-01T00:00:00Z");
		//sb.append(sdf.format(new Date(rr.getSubmitDate().getTime()-32400000L)).replace("!", "T").replace("?", "Z"));
		sb.append("&INVNUM="); //开发商提供的 INVNUM
		sb.append("rayvision_");
		//sb.append(rr.getCustomerId());//您自己的发票或跟踪号。供更新状态时用
		sb.append("_");
		//sb.append(rr.getId());
        
		sb.append("&AMT="); //充值金额
		//sb.append(rr.getAmount().toString());
//		sb.append("&CURRENCYCODE=USD");  //充值币种
		log.info("---------手动获取单条充值记录的url-------"+sb);
		String tsTxt = HttpUtil.get(sb.toString());
		List<Map<String, String>> tsList = PaypalUtil.analysisTransactionSearch(tsTxt);
		return tsList;
	}
	
	public static Map<String, String> getTransactionDetails(String transactionId){
		StringBuffer sb=new StringBuffer();
		sb.append(ECM_URL);
		sb.append("USER=");
		sb.append(ECM_USER);
		sb.append("&");
		sb.append("PWD=");
		sb.append(ECM_PWD);
		sb.append("&");
		sb.append("SIGNATURE=");
		sb.append(ECM_SIGNATURE);
		sb.append("&");
		sb.append("VERSION=");
		sb.append(ECM_VERSION);
		sb.append("&");
		sb.append("METHOD=");
		sb.append("GetTransactionDetails");
		sb.append("&");
		sb.append("TRANSACTIONID=");
		sb.append(transactionId);
		String tsTxt = HttpUtil.get(sb.toString());
		Map<String, String> tdMap = stringToMap(tsTxt);
		return tdMap;
	}
	
	/*public static RechargeRecord createPaypalArgs(RechargeRecord rr){
		if (rr != null) {
			rr.setToken(PaypalUtil.getToken(rr)) ;
			rr.setCmd("_express-checkout");
			rr.setUrl(ECM_OFFICIAL_URL);
		}
		return rr;
	}*/
	/*	<form method="get" action="https://api-3t.sandbox.paypal.com/nvp" id="payRecord"> 
	<input type="hidden" name="USER" value="18665352612-facilitator_api1.163.com">
	<input type="hidden" name="PWD" value="1377490790">
	<input type="hidden" name="SIGNATURE" value="AFcWxV21C7fd0v3bYYYRCpSSRl31API6hhcnTDefIDXkVd-ELJP-yqOg">
	<input type="hidden" name="VERSION" value="93">
	<input type="hidden" name="PAYMENTREQUEST_0_PAYMENTACTION" value="Sale">
	<input type="hidden" name="PAYMENTREQUEST_0_AMT" value="<s:property value='payRecord.amount'/>">
	<input type="hidden" name="PAYMENTREQUEST_0_CURRENCYCODE" value="<s:property value='payRecord.currency'/>">
	<!-- setec后返回通过get ec 获取客户登陆后的信息 -->
	<input type="hidden" name="RETURNURL" value="https://www3.foxrenderfarm.com//abbc.action">
	<!-- 客户取消操作后返回的页面 -->
	<input type="hidden" name="CANCELURL" value="https://www3.foxrenderfarm.com">
	<input type="hidden" name="METHOD" value="SetExpressCheckout">
</form>*/
	public static String getTokenUrl(){
		StringBuffer sb=new StringBuffer();
		sb.append(ECM_URL);
		sb.append("USER=");
		sb.append(ECM_USER);
		sb.append("&");
		sb.append("PWD=");
		sb.append(ECM_PWD);
		sb.append("&");
		sb.append("SIGNATURE=");
		sb.append(ECM_SIGNATURE);
		sb.append("&");
		sb.append("VERSION=");
		sb.append(ECM_VERSION);
		sb.append("&");
		sb.append("PAYMENTREQUEST_0_PAYMENTACTION=");
		sb.append("Sale");//Sale表示这是最终销售，即您请求买家支付
		sb.append("&");
		sb.append("RETURNURL=");
		//sb.append(returnUrl(pr));
		sb.append("&");
		sb.append("CANCELURL=");
		//sb.append(cancelUrl(pr));
		sb.append("&");
		sb.append("PAYMENTREQUEST_0_CURRENCYCODE=");//充值货币
		//sb.append(pr.getCurrency());
		sb.append("&");
		sb.append("METHOD=");
		sb.append("SetExpressCheckout");
		sb.append("&");
		sb.append("PAYMENTREQUEST_0_INVNUM=");
		sb.append("rayvision_");
		//sb.append(pr.getCustomerId());//您自己的发票或跟踪号。供更新状态时用
		sb.append("_");
		//sb.append(pr.getId());
		sb.append("&");
		sb.append("L_PAYMENTREQUEST_0_NUMBER0=");
		//sb.append(pr.getId());
		sb.append("&");
		sb.append("PAYMENTREQUEST_0_AMT=");//充值金额
		//sb.append(pr.getAmount());
		sb.append("&");
		sb.append("L_PAYMENTREQUEST_0_QTY0=1");
		sb.append("&");
		sb.append("L_PAYMENTREQUEST_0_AMT0=");
		//sb.append(pr.getAmount());
		sb.append("&");
		sb.append("L_PAYMENTREQUEST_0_NAME0=");
		//sb.append(encode("Rayvision Service Charge ("+pr.getLoginName()+")"));
		sb.append("&");
		sb.append("PAYMENTREQUEST_0_ITEMAMT=");//充值金额
		//sb.append(pr.getAmount());
		sb.append("&");
		sb.append("CUSTOM=");
		//sb.append(pr.getCustomerId());//物品描述:客户id_充值id_平台
		sb.append("_");
		//sb.append(pr.getId());
		/*//sb.append("&");
		//sb.append("PAYMENTREQUEST_n_NOT IFYURL=");
		//sb.append(pr.getId());//您接收有关此交易即时付款通知（IPN）的URL。如果您不在请求中指定此值，将使用您用户信息中的通知URL（如果有）
		sb.append("&");
		sb.append("L_PAYMENTREQUEST_n_NAME0=");
		sb.append("渲染充值:"+pr.getAmount());
		sb.append("&");
		sb.append("L_PAYMENTREQUEST_n_NUMBER0=");//物品编号
		sb.append(pr.getId());
		sb.append("&");
		sb.append("L_PAYMENTREQUEST_n_QTY0=1");//物品数量
        */		
		log.info("---获取token  url----"+sb.toString());
		return sb.toString();
	}
	/**
	 * 获取token
	 * @param rr
	 * @return
	 */
	/*public static String getToken(RechargeRecord rr){
		String token = "";
		Map<String,String> map = stringToMap(HttpUtil.check(getTokenUrl(rr),"GET"));
		
		if (map != null && map.get("ACK") != null && map.get("ACK").toString().equals("Success")) {
			token = map.get("TOKEN").toString();
		}
		return token;
	}*/
     /////第三部  登录papay后确认支付  由papay处理
	/////第四部 处理paypal return url的请求  GetExpressCheckoutDetails 
	/*
	 * curl -s --insecure https://api-3t.sandbox.paypal.com/nvp -d 
		"USER=<callerID>
		&PWD=<callerPswd>
		&SIGNATURE=<callerSig>
		&METHOD=GetExpressCheckoutDetails
		&VERSION=93
		&TOKEN=<tokenValue>"
	*/
	public static Map GetExpressCheckoutDetails(HttpServletRequest request){
		log.info("登录paypal之后 点击 立即付款 获取的数据有---"+request.getParameterMap());
		String token=request.getParameter("token");
		log.info("paypal pass token ---"+token);
		String payerID=request.getParameter("PayerID");
		log.info("paypal pass PayerID ---"+payerID);
        if (token==null||token.equals("")||payerID==null||payerID.equals("")) {
			return null;
		}
        StringBuffer sb=new StringBuffer();
		sb.append(ECM_URL);
		sb.append("USER=");
		sb.append(ECM_USER);
		sb.append("&");
		sb.append("PWD=");
		sb.append(ECM_PWD);
		sb.append("&");
		sb.append("SIGNATURE=");
		sb.append(ECM_SIGNATURE);
		sb.append("&");
		sb.append("VERSION=");
		sb.append(ECM_VERSION);
		sb.append("&");
		sb.append("METHOD=");
		sb.append("GetExpressCheckoutDetails");
		sb.append("&");
		sb.append("TOKEN=");
		sb.append(token);
		String detailResult= HttpUtil.check(sb.toString(),"GET");
		log.info("获取客户详细信息--result--"+detailResult);
		Map map=stringToMap(detailResult);
		map.put("PAYERID", payerID);
		return  map;
	}
	/**
	 * 当客户在paypal中选择继续后 自动提交到paypal中并获取paypal返回的结果
	 * @param request
	 * @return
	 */
	public static String autoHandlePaypal(HttpServletRequest request, String host){
	    Map conditionMap = GetExpressCheckoutDetails(request);
	    if (conditionMap != null) {
	    	StringBuffer sb=new StringBuffer();
			sb.append(ECM_URL);
			sb.append("USER=");
			sb.append(ECM_USER);
			sb.append("&");
			sb.append("PWD=");
			sb.append(ECM_PWD);
			sb.append("&");
			sb.append("SIGNATURE=");
			sb.append(ECM_SIGNATURE);
			sb.append("&");
			sb.append("VERSION=");
			sb.append(ECM_VERSION);
			sb.append("&");
			sb.append("PAYMENTREQUEST_0_PAYMENTACTION=");
			sb.append("Sale");
			sb.append("&");
			sb.append("PAYERID=");
			sb.append(conditionMap.get("PAYERID").toString());
			sb.append("&");
			sb.append("TOKEN=");
			sb.append(conditionMap.get("TOKEN").toString());
			sb.append("&");
			sb.append("PAYMENTREQUEST_0_AMT=");
			sb.append(conditionMap.get("PAYMENTREQUEST_0_AMT").toString());
			sb.append("&");
			sb.append("PAYMENTREQUEST_0_CURRENCYCODE=");
			sb.append(conditionMap.get("PAYMENTREQUEST_0_CURRENCYCODE").toString());
			sb.append("&");
			sb.append("METHOD=");
			sb.append("DoExpressCheckoutPayment");
			sb.append("&");
			sb.append("PAYMENTREQUEST_0_INVNUM=");
			sb.append(conditionMap.get("PAYMENTREQUEST_0_INVNUM").toString());
			sb.append("&");
			sb.append("PAYMENTREQUEST_0_NOTIFYURL=");
			String desc=conditionMap.get("PAYMENTREQUEST_0_INVNUM").toString();
			String [] arr=desc.split("_");
			String type=arr[2];
			log.info("type---"+type);
			//sb.append(notifyUrl(type, host));
			log.info("客户在确认之后发送信息到paypal 的url为---"+sb.toString());
			Map resultMap = stringToMap(HttpUtil.check(sb.toString(),"GET"));
			String result = resultMap.get("PAYMENTINFO_0_PAYMENTSTATUS").toString();
			if("Pending".equals(result)){
				return "Payment Pending, redirecting...";
			}else if ("Completed".equals(result)||"Completed-Funds-Held".equals(result)) {
				return  "Payment Completed, redirecting...";
			}else {
				return "Payment Failed,redirecting...";
			}
		}
	    return "";
	
	}
	
	/**
	 * 已&连接的字符串转为map
	 * @param result
	 * @return
	 */
	public static Map<String,String> stringToMap(String result){
		if (result==null||result.equals("")||!result.contains("&")) {
			return null;
		}
		String [] res=result.split("&");
		Map<String,String>  map=new HashMap<String,String>();
		if (res!=null) {
			for (int i = 0; i < res.length; i++) {
				String [] in=(res[i]).split("=");
				map.put(in[0], decode(in[1]));
			}
		}
		return map;
	}
	/*public static String cancelUrl(RechargeRecord pr){
		if (pr.getAgentId()!=null && pr.getCustomerId() == null ) {//代理商充值
			return "";
		}
		return Configuration.getPayPalCancelUrl(pr.getHost())+"?prId="+pr.getId()+"_"+pr.getCustomerId();//默认是客户充值
	}
	public static String returnUrl(RechargeRecord pr){
        if (pr.getAgentId()!=null && pr.getCustomerId() == null ) {//代理商充值
			return "";
		}
		return Configuration.getPayPalReturnUrl(pr.getHost());
	}
	public static String notifyUrl(String type, String host){
        if (type.equals("agent")) {
			return "";
		}
		return Configuration.getPayPalNotifyUrl(host);
	}*/

	public static String  decode(String msg){
		String result="";
		try {
			result=URLDecoder.decode(msg, EC_CODE);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	public static String  encode(String msg){
		String result="";
		try {
			result=URLEncoder.encode(msg, EC_CODE);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	public static List<Map<String, String>> analysisTransactionSearch(String tsTxt){
		Map<String,String> map = stringToMap(tsTxt);
		List<Map<String,String>> tsList = new ArrayList<Map<String,String>>();
		if(map != null && map.get("ACK") != null && map.get("ACK").toString().contains("Success")){
			int count = 0;
			while(tsTxt.indexOf("L_TIMESTAMP"+count) != -1){//计算返回多少条数据
				count++;
			}
			for(int i = 0; i < count; i++){
				Map<String, String> tsMap = new HashMap<String, String>();
				tsMap.put("L_TIMESTAMP", map.get("L_TIMESTAMP"+i));
				tsMap.put("L_TIMEZONE", map.get("L_TIMEZONE"+i));
				tsMap.put("L_TYPE", map.get("L_TYPE"+i));
				tsMap.put("L_EMAIL", map.get("L_EMAIL"+i));
				tsMap.put("L_NAME", map.get("L_NAME"+i));
				tsMap.put("L_TRANSACTIONID", map.get("L_TRANSACTIONID"+i));
				tsMap.put("L_STATUS", map.get("L_STATUS"+i));
				tsMap.put("L_AMT", map.get("L_AMT"+i));
				tsMap.put("L_CURRENCYCODE", map.get("L_CURRENCYCODE"+i));
				tsMap.put("L_FEEAMT", map.get("L_FEEAMT"+i));
				tsMap.put("L_NETAMT", map.get("L_NETAMT"+i));
				tsList.add(tsMap);
			}
		}
		return tsList;
	}
	
	public static void main(String[] args) {
		String tsTxt = "L_TIMESTAMP0=2016%2d01%2d19T22%3a53%3a03Z&L_TIMESTAMP1=2016%2d01%2d19T20%3a26%3a30Z&L_TIMEZONE0=GMT&L_TIMEZONE1=GMT&L_TYPE0=Payment&L_TYPE1=Payment&L_EMAIL0=beernardo%40efenueve%2ecom&L_EMAIL1=amer%40core%2dstudios%2eco%2euk&L_NAME0=Bernardo%20Gutierrez&L_NAME1=MHD%20AMER%20Kouly&L_TRANSACTIONID0=27H50032AN4190357&L_TRANSACTIONID1=6G8051017W5547307&L_STATUS0=Completed&L_STATUS1=Completed&L_AMT0=180%2e00&L_AMT1=500%2e00&L_CURRENCYCODE0=USD&L_CURRENCYCODE1=USD&L_FEEAMT0=%2d6%2e96&L_FEEAMT1=%2d18%2e80&L_NETAMT0=173%2e04&L_NETAMT1=481%2e20&TIMESTAMP=2016%2d01%2d20T08%3a14%3a12Z&CORRELATIONID=6d91e63553c2e&ACK=Success&VERSION=93&BUILD=18308778";
		List<Map<String, String>> tsList = PaypalUtil.analysisTransactionSearch(tsTxt);
		for (Map<String, String> map : tsList) {
			System.out.println(getTransactionDetails(map.get("L_TRANSACTIONID").toString()));
		}
	}
	
	
}
