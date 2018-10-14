package com.szlhsoft.core.util;

import com.szlhsoft.core.util.http.HttpUtil;
import net.sf.json.JSONObject;
import net.sf.json.xml.XMLSerializer;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

/**
 * @ClassName: AlipayUtil 
 * @Description: TODO
 * @author sml
 * @date 2014-5-26 下午06:26:36
 *  Copyright 2014-05-12 Rayvision Software Co. Ltd.
 *  All right reserved.
 */
public class AlipayUtil {
   public static String charset = "utf-8";
   public static String alipay_url = "https://mapi.alipay.com/gateway.do?_input_charset="+charset;//访问支付宝url
   public static String seller_email = "pay@renderbus.com";
   public static String partner = "2088701375261671";
   public static String key ="84jf6wsiil64irz924zzimqa9r380ucs";
   public static Log log = LogFactory.getLog(AlipayUtil.class);
   
   public static JSONObject getSingleTrade(){
	  // if (rr != null) {
		   //对传递的参数按照字母顺序排序:使用treemap  除了
		  // String out_trade_no = "rayvision_"+rr.getCustomerId()+"_"+rr.getId();
		   String sign_type = "MD5";
		   
		   Map signMap = new TreeMap();
		   signMap.put("_input_charset", charset);
		   signMap.put("service", "single_trade_query");
		   signMap.put("partner", partner);
		   //signMap.put("out_trade_no", out_trade_no);
		   
		   log.info("支付宝充值-----"+signMap);
		   List keys = new ArrayList(signMap.keySet());
		   StringBuffer content = new StringBuffer();
			boolean first = true;
			for (int i = 0; i < keys.size(); i++) {
				Object key = keys.get(i);
				Object value = signMap.get(key);
				if (value == null || value.toString().trim().length() == 0) {
					continue;
				}
				if (first) {
					content.append(key);
					content.append("=");
					content.append(value);
					first = false;
				} else {
					content.append("&");
					content.append(key);
					content.append("=");
					content.append(value);
				}			
			}		
		   content.append(key);
		   String sign = Md5Encrypt.md5(content.toString());
		 
		   StringBuffer url = new StringBuffer(alipay_url);
	   		for (int i = 0; i < keys.size(); i++) {
				Object key = keys.get(i);	
				Object value = signMap.get(key);
				if (value == null || value.toString().trim().length() == 0) {
					continue;
				}
				url.append("&");
				url.append(key);
				url.append("=");
				url.append(value);
			}	
		   	url.append("&sign=");
		   	url.append(sign);
		   	url.append("&sign_type=");
		   	url.append(sign_type);
		   	String xmlResult = HttpUtil.get(url.toString());
			return JSONObject.fromObject(new XMLSerializer().read(xmlResult));
		//}
		   //return null;
   }
   
   /**
    * 创建支付宝url ,除了sign_type,sign  其他参数都要签名
    * @param rr 要充值的参数
    * @return
    */
   /*public static RechargeRecord createAlipayArgs(RechargeRecord rr){
	   if (rr != null) {
		   //对传递的参数按照字母顺序排序:使用treemap  除了
		   String body = "ID:"+rr.getCustomerId()+";Your Account:"+rr.getLoginName()+ ";Your Order Number :"+ rr.getId();
		   String subject = "RenderBus Service Fee RMB "+rr.getAmount() +"("+rr.getLoginName()+")";
		   String sign_type = "MD5";
		   Map signMap = new TreeMap();
		   signMap.put("_input_charset", charset);
		   signMap.put("service", "create_direct_pay_by_user");
		   signMap.put("partner", partner);
		   signMap.put("notify_url", getNotifyUrl(rr, rr.getHost()));
		   signMap.put("return_url", getReturnUrl(rr, rr.getHost()));
		   signMap.put("subject",subject);
		   signMap.put("payment_type", "1");
		   signMap.put("seller_email", seller_email);
		   signMap.put("total_fee", rr.getAmount());
		   String out_trade_no = "rayvision_"+rr.getCustomerId()+"_"+rr.getId();
		   signMap.put("out_trade_no", out_trade_no);
		   signMap.put("body", body);
		   signMap.put("defaultbank", "ICBCB2C");
		   log.info("支付宝充值-----"+signMap);
		   List keys = new ArrayList(signMap.keySet());
		   StringBuffer content = new StringBuffer();
			boolean first = true;
			for (int i = 0; i < keys.size(); i++) {
				Object key = keys.get(i);
				Object value = signMap.get(key);
				if (value == null || value.toString().trim().length() == 0) {
					continue;
				}
				if (first) {
					content.append(key);
					content.append("=");
					content.append(value);
					first = false;
				} else {
					content.append("&");
					content.append(key);
					content.append("=");
					content.append(value);
				}			
			}		
		   content.append(key);
		   String sign = Md5Encrypt.md5(content.toString());
		   rr.setInput_charset(charset);
		   rr.setService("create_direct_pay_by_user");
		   rr.setPartner(partner);
		   rr.setSign(sign);
		   rr.setSign_type(sign_type);
		   rr.setNotify_url(getNotifyUrl(rr, rr.getHost()));
		   rr.setReturn_url(getReturnUrl(rr, rr.getHost()));
		   rr.setSubject(subject);
		   rr.setPayment_type("1");
		   rr.setSeller_email(seller_email);
		   rr.setPrice(rr.getAmount().toString());
		   rr.setTotal_fee(rr.getAmount().toString());
		   rr.setQuantity("1");
		   rr.setOut_trade_no(out_trade_no);
		   rr.setBody(body);
		   rr.setDefaultbank("ICBCB2C");
		   rr.setUrl(alipay_url);
	   }
	   return rr;
   }*/
   /**
    * 获取支付宝交易状态
    * @param request
    * @return
    */
   public static String getAlipayTradeStatua(HttpServletRequest request){
	   Map requestParams = request.getParameterMap();
	   if (requestParams != null && requestParams.get("trade_status") != null) {
		 return requestParams.get("trade_status").toString();
	   }
	   return "";
   }
  /* public static String getReturnUrl(RechargeRecord pr, String host){
	   String returnUrl = Configuration.getAliPayReturnUrl(host);
//       if (pr.getAgentId()!=null && pr.getCustomerId() == null ) {//代理商充值
//    	   String domain = Configuration.getPlatformDomain("default");
//    	   returnUrl = returnUrl.replace(domain, domain+"/rayvisionagent/");
//		}
		return returnUrl;
	}*/
	/*public static String getNotifyUrl(RechargeRecord rr, String host){
		String notifyUrl = Configuration.getAliPayNotifyUrl(host);
//		if (rr.getAgentId()!=null && rr.getCustomerId() == null ) {//代理商充值
//			String domain = Configuration.getPlatformDomain("default");
//			notifyUrl = notifyUrl.replace(domain, domain+"/rayvisionagent/");
//		}
		return notifyUrl;
	}*/
   
   public static void main(String[] args) {
	/*   Map signMap = new TreeMap();
	   signMap.put("service", "create_direct_pay_by_user");
	   signMap.put("partner", partner);
	   signMap.put("notify_url", getNotifyUrl());
	   signMap.put("return_url", getReturnUrl());
	   signMap.put("subject","aa");
	   signMap.put("payment_type", "1");
	   signMap.put("seller_email", seller_email);
	   signMap.put("price", 1);
	   signMap.put("total_fee", 1);
	   signMap.put("quantity", "1");
	   signMap.put("out_trade_no", 1);
	   signMap.put("body", 1);
	   signMap.put("defaultbank", "ICBCB2C");
	   System.err.println(signMap.toString());*/
}
}
