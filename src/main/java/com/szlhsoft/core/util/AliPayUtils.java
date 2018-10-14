package com.szlhsoft.core.util;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.*;
import com.alipay.api.response.*;

public class AliPayUtils {

	private static String app_id="app_id";
	private static String url="https://openapi.alipay.com/gateway.do";
	private static String privateKey="your private_key";
	private static String charset="UTF-8";
	private static String format="json";
	private static String publicKey="alipay_public_key";
	private static String signType="RSA2";
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}
	/**
	 * 统一收单线下交易查询
	 */
	public static void query(){
		try{
			AlipayClient alipayClient = new DefaultAlipayClient(url,app_id,privateKey,format,charset,publicKey,signType);
			AlipayTradeQueryRequest request = new AlipayTradeQueryRequest();
			request.setBizContent("{" +
			"    \"out_trade_no\":\"20150320010101001\"," +
			"    \"trade_no\":\"2014112611001004680 073956707\"" +
			"  }");
			AlipayTradeQueryResponse response = alipayClient.execute(request);
			if(response.isSuccess()){
				System.out.println("调用成功");
			} else {
				System.out.println("调用失败");
			}
		}catch(AlipayApiException e){
			System.out.println("调用失败");
		}
	}
	/**
	 * 统一收单交易退款接口
	 */
	public static void refund(){
		try{
			AlipayClient alipayClient = new DefaultAlipayClient(url,app_id,privateKey,format,charset,publicKey,signType);
			AlipayTradeRefundRequest request = new AlipayTradeRefundRequest();
			request.setBizContent("{" +
			"    \"out_trade_no\":\"20150320010101001\"," +
			"    \"trade_no\":\"2014112611001004680073956707\"," +
			"    \"refund_amount\":200.12," +
			"    \"refund_reason\":\"正常退款\"," +
			"    \"out_request_no\":\"HZ01RF001\"," +
			"    \"operator_id\":\"OP001\"," +
			"    \"store_id\":\"NJ_S_001\"," +
			"    \"terminal_id\":\"NJ_T_001\"" +
			"  }");
			AlipayTradeRefundResponse response = alipayClient.execute(request);
			if(response.isSuccess()){
				System.out.println("调用成功");
			} else {
				System.out.println("调用失败");
			}
		}catch(AlipayApiException e){
			
		}
	}
	/**
	 * 统一收单交易支付接口
	 */
	public static void pay(){
		try{
		AlipayClient alipayClient = new DefaultAlipayClient(url,app_id,privateKey,format,charset,publicKey,signType);
		AlipayTradePayRequest request = new AlipayTradePayRequest();
		request.setBizContent("{" +
		"    \"out_trade_no\":\"20150320010101001\"," +
		"    \"scene\":\"bar_code\"," +
		"    \"auth_code\":\"28763443825664394\"," +
		"    \"product_code\":\"FACE_TO_FACE_PAYMENT\"," +
		"    \"subject\":\"Iphone6 16G\"," +
		"    \"buyer_id\":\"2088202954065786\"," +
		"    \"seller_id\":\"2088102146225135\"," +
		"    \"total_amount\":88.88," +
		"    \"discountable_amount\":8.88," +
		"    \"undiscountable_amount\":80.00," +
		"    \"body\":\"Iphone6 16G\"," +
		"      \"goods_detail\":[{" +
		"                \"goods_id\":\"apple-01\"," +
		"        \"alipay_goods_id\":\"20010001\"," +
		"        \"goods_name\":\"ipad\"," +
		"        \"quantity\":1," +
		"        \"price\":2000," +
		"        \"goods_category\":\"34543238\"," +
		"        \"body\":\"特价手机\"," +
		"        \"show_url\":\"http://www.alipay.com/xxx.jpg\"" +
		"        }]," +
		"    \"operator_id\":\"yx_001\"," +
		"    \"store_id\":\"NJ_001\"," +
		"    \"terminal_id\":\"NJ_T_001\"," +
		"    \"alipay_store_id\":\"2016041400077000000003314986\"," +
		"    \"extend_params\":{" +
		"      \"sys_service_provider_id\":\"2088511833207846\"," +
		"      \"hb_fq_num\":\"3\"," +
		"      \"hb_fq_seller_percent\":\"100\"" +
		"    }," +
		"    \"timeout_express\":\"90m\"," +
		"    \"royalty_info\":{" +
		"      \"royalty_type\":\"ROYALTY\"," +
		"        \"royalty_detail_infos\":[{" +
		"                    \"serial_no\":1," +
		"          \"trans_in_type\":\"userId\"," +
		"          \"batch_no\":\"123\"," +
		"          \"out_relation_id\":\"20131124001\"," +
		"          \"trans_out_type\":\"userId\"," +
		"          \"trans_out\":\"2088101126765726\"," +
		"          \"trans_in\":\"2088101126708402\"," +
		"          \"amount\":0.1," +
		"          \"desc\":\"分账测试1\"," +
		"          \"amount_percentage\":\"100\"" +
		"          }]" +
		"    }," +
		"    \"sub_merchant\":{" +
		"      \"merchant_id\":\"19023454\"" +
		"    }," +
		"    \"disable_pay_channels\":\"credit_group\"," +
		"    \"ext_user_info\":{" +
		"      \"name\":\"李明\"," +
		"      \"mobile\":\"16587658765\"," +
		"      \"cert_type\":\"IDENTITY_CARD\"," +
		"      \"cert_no\":\"362334768769238881\"," +
		"      \"fix_buyer\":\"F\"" +
		"    }" +
		"  }");
		AlipayTradePayResponse response = alipayClient.execute(request);
		if(response.isSuccess()){
			System.out.println("调用成功");
		} else {
			System.out.println("调用失败");
		}
		}catch(AlipayApiException e){
			System.out.println(e.getMessage());
		}
	}
	/**
	 * 统一收单线下交易预创建
	 */
	public static void precreate(){
		try{
			AlipayClient alipayClient = new DefaultAlipayClient(url,app_id,privateKey,format,charset,publicKey,signType);
			AlipayTradePrecreateRequest request = new AlipayTradePrecreateRequest();
			request.setBizContent("{" +
			"    \"out_trade_no\":\"20150320010101001\"," +
			"    \"seller_id\":\"2088102146225135\"," +
			"    \"total_amount\":88.88," +
			"    \"discountable_amount\":8.88," +
			"    \"undiscountable_amount\":80," +
			"    \"buyer_logon_id\":\"15901825620\"," +
			"    \"subject\":\"Iphone6 16G\"," +
			"      \"goods_detail\":[{" +
			"                \"goods_id\":\"apple-01\"," +
			"        \"alipay_goods_id\":\"20010001\"," +
			"        \"goods_name\":\"ipad\"," +
			"        \"quantity\":1," +
			"        \"price\":2000," +
			"        \"goods_category\":\"34543238\"," +
			"        \"body\":\"特价手机\"," +
			"        \"show_url\":\"http://www.alipay.com/xxx.jpg\"" +
			"        }]," +
			"    \"body\":\"Iphone6 16G\"," +
			"    \"operator_id\":\"yx_001\"," +
			"    \"store_id\":\"NJ_001\"," +
			"    \"disable_pay_channels\":\"pcredit,moneyFund,debitCardExpress\"," +
			"    \"enable_pay_channels\":\"pcredit,moneyFund,debitCardExpress\"," +
			"    \"terminal_id\":\"NJ_T_001\"," +
			"    \"extend_params\":{" +
			"      \"sys_service_provider_id\":\"2088511833207846\"," +
			"      \"hb_fq_num\":\"3\"," +
			"      \"hb_fq_seller_percent\":\"100\"" +
			"    }," +
			"    \"timeout_express\":\"90m\"," +
			"    \"royalty_info\":{" +
			"      \"royalty_type\":\"ROYALTY\"," +
			"        \"royalty_detail_infos\":[{" +
			"                    \"serial_no\":1," +
			"          \"trans_in_type\":\"userId\"," +
			"          \"batch_no\":\"123\"," +
			"          \"out_relation_id\":\"20131124001\"," +
			"          \"trans_out_type\":\"userId\"," +
			"          \"trans_out\":\"2088101126765726\"," +
			"          \"trans_in\":\"2088101126708402\"," +
			"          \"amount\":0.1," +
			"          \"desc\":\"分账测试1\"," +
			"          \"amount_percentage\":\"100\"" +
			"          }]" +
			"    }," +
			"    \"sub_merchant\":{" +
			"      \"merchant_id\":\"19023454\"" +
			"    }," +
			"    \"alipay_store_id\":\"2016052600077000000015640104\"" +
			"  }");
			AlipayTradePrecreateResponse response = alipayClient.execute(request);
			if(response.isSuccess()){
				System.out.println("调用成功");
			} else {
				System.out.println("调用失败");
			}
		}catch(AlipayApiException e){
			
		}
	}
	/**
	 * 统一收单交易撤销接口
	 */
	public static void cancel(){
		try{
			AlipayClient alipayClient = new DefaultAlipayClient(url,app_id,privateKey,format,charset,publicKey,signType);
			AlipayTradeCancelRequest request = new AlipayTradeCancelRequest();
			request.setBizContent("{" +
			"    \"out_trade_no\":\"20150320010101001\"," +
			"    \"trade_no\":\"2014112611001004680073956707\"" +
			"  }");
			AlipayTradeCancelResponse response = alipayClient.execute(request);
			if(response.isSuccess()){
				System.out.println("调用成功");
			} else {
				System.out.println("调用失败");
			}
		}catch(AlipayApiException e){
			
		}
	}
	/**
	 * 统一收单交易创建接口
	 */
	public static void create(){
		try{
			AlipayClient alipayClient = new DefaultAlipayClient(url,app_id,privateKey,format,charset,publicKey,signType);
			AlipayTradeCreateRequest request = new AlipayTradeCreateRequest();
			request.setBizContent("{" +
			"    \"out_trade_no\":\"20150320010101001\"," +
			"    \"seller_id\":\"2088102146225135\"," +
			"    \"total_amount\":88.88," +
			"    \"discountable_amount\":8.88," +
			"    \"undiscountable_amount\":80.00," +
			"    \"buyer_logon_id\":\"15901825620\"," +
			"    \"subject\":\"Iphone6 16G\"," +
			"    \"body\":\"Iphone6 16G\"," +
			"    \"buyer_id\":\"2088102146225135\"," +
			"      \"goods_detail\":[{" +
			"                \"goods_id\":\"apple-01\"," +
			"        \"alipay_goods_id\":\"20010001\"," +
			"        \"goods_name\":\"ipad\"," +
			"        \"quantity\":1," +
			"        \"price\":2000," +
			"        \"goods_category\":\"34543238\"," +
			"        \"body\":\"特价手机\"," +
			"        \"show_url\":\"http://www.alipay.com/xxx.jpg\"" +
			"        }]," +
			"    \"operator_id\":\"Yx_001\"," +
			"    \"enable_pay_channels\":\"pcredit,moneyFund,debitCardExpress\"," +
			"    \"store_id\":\"NJ_001\"," +
			"    \"disable_pay_channels\":\"pcredit,moneyFund,debitCardExpress\"," +
			"    \"terminal_id\":\"NJ_T_001\"," +
			"    \"extend_params\":{" +
			"      \"sys_service_provider_id\":\"2088511833207846\"," +
			"      \"hb_fq_num\":\"3\"," +
			"      \"hb_fq_seller_percent\":\"100\"" +
			"    }," +
			"    \"timeout_express\":\"90m\"," +
			"    \"royalty_info\":{" +
			"      \"royalty_type\":\"ROYALTY\"," +
			"        \"royalty_detail_infos\":[{" +
			"                    \"serial_no\":1," +
			"          \"trans_in_type\":\"userId\"," +
			"          \"batch_no\":\"123\"," +
			"          \"out_relation_id\":\"20131124001\"," +
			"          \"trans_out_type\":\"userId\"," +
			"          \"trans_out\":\"2088101126765726\"," +
			"          \"trans_in\":\"2088101126708402\"," +
			"          \"amount\":0.1," +
			"          \"desc\":\"分账测试1\"," +
			"          \"amount_percentage\":\"100\"" +
			"          }]" +
			"    }," +
			"    \"alipay_store_id\":\"2016041400077000000003314986\"," +
			"    \"sub_merchant\":{" +
			"      \"merchant_id\":\"19023454\"" +
			"    }," +
			"    \"merchant_order_no\":\"20161008001\"" +
			"  }");
			AlipayTradeCreateResponse response = alipayClient.execute(request);
			if(response.isSuccess()){
				System.out.println("调用成功");
			} else {
				System.out.println("调用失败");
			}
		}catch(AlipayApiException e){
			
		}
	}
	/**
	 * 统一收单交易退款查询
	 */
	public static void refundQuery(){
		try{
			AlipayClient alipayClient = new DefaultAlipayClient(url,app_id,privateKey,format,charset,publicKey,signType);
			AlipayTradeFastpayRefundQueryRequest request = new AlipayTradeFastpayRefundQueryRequest();
			request.setBizContent("{" +
			"    \"trade_no\":\"20150320010101001\"," +
			"    \"out_trade_no\":\"2014112611001004680073956707\"," +
			"    \"out_request_no\":\"2014112611001004680073956707\"" +
			"  }");
			AlipayTradeFastpayRefundQueryResponse response = alipayClient.execute(request);
			if(response.isSuccess()){
				System.out.println("调用成功");
			} else {
				System.out.println("调用失败");
			}
		}catch(AlipayApiException e){
			System.out.println("调用失败");	
		}
	}
	/**
	 * 统一收单交易关闭接口
	 */
	public static void close(){
		try{
			AlipayClient alipayClient = new DefaultAlipayClient(url,app_id,privateKey,format,charset,publicKey,signType);
			AlipayTradeCloseRequest request = new AlipayTradeCloseRequest();
			request.setBizContent("{" +
			"    \"trade_no\":\"2013112611001004680073956707\"," +
			"    \"out_trade_no\":\"HZ0120131127001\"," +
			"    \"operator_id\":\"YX01\"" +
			"  }");
			AlipayTradeCloseResponse response = alipayClient.execute(request);
			if(response.isSuccess()){
				System.out.println("调用成功");
			} else {
				System.out.println("调用失败");
			}
		}catch(AlipayApiException e){
			
		}
	}
	/**
	 * 统一收单交易结算接口
	 */
	public static void settle(){
		try{
			AlipayClient alipayClient = new DefaultAlipayClient(url,app_id,privateKey,format,charset,publicKey,signType);
			AlipayTradeOrderSettleRequest request = new AlipayTradeOrderSettleRequest();
			request.setBizContent("{" +
			"    \"out_request_no\":\"20160727001\"," +
			"    \"trade_no\":\"2014030411001007850000672009\"," +
			"      \"royalty_parameters\":[{" +
			"                \"trans_out\":\"2088101126765726\"," +
			"        \"trans_in\":\"2088101126708402\"," +
			"        \"amount\":0.1," +
			"        \"amount_percentage\":100," +
			"        \"desc\":\"分账给2088101126708402\"" +
			"        }]," +
			"    \"operator_id\":\"A0001\"" +
			"  }");
			AlipayTradeOrderSettleResponse response = alipayClient.execute(request);
			if(response.isSuccess()){
				System.out.println("调用成功");
			} else {
				System.out.println("调用失败");
			}
		}catch(AlipayApiException e){
			
		}
		
	}
}
