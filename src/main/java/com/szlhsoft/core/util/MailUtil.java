package com.szlhsoft.core.util;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import sun.misc.BASE64Encoder;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.*;
import javax.mail.internet.*;
import java.io.UnsupportedEncodingException;
import java.security.Security;
import java.util.Date;
import java.util.Enumeration;
import java.util.Properties;
import java.util.Vector;

public class MailUtil {
	// 语言
	public static final String MAIL_LAN_CN = "zh";
	public static final String MAIL_LAN_EN = "en";
	public static final String host = "smtp.exmail.qq.com";
	final static String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
	// 邮箱的密码
	public static final String emailPwd = "360216530Www";
	// 可发送给邮件的邮箱
	public static final String[] emailArryCN = new String[] { "service@szlhsoft.com", "service@szlhsoft.com",
			"service@szlhsoft.com", "service@szlhsoft.com", "service@szlhsoft.com", "service@szlhsoft.com" };
	// 可发送给邮件的邮箱
	public static final String[] emailArryEN = new String[] { "service@szlhsoft.com", "service@szlhsoft.com",
			"service@szlhsoft.com", "service@szlhsoft.com", "service@szlhsoft.com", "service@szlhsoft.com" };

	private static Log log = LogFactory.getLog(MailUtil.class);

	/**
	 * 发送邮件的公共类
	 * 
	 * @param subject
	 *            邮件主题
	 * @param content
	 *            邮件的类容
	 * @param toEmail
	 *            发送有家你的人
	 * @param flag
	 *            中英文状态
	 * @param coustomerId
	 *            用户ID
	 * @return
	 */
	public static boolean doSend(BaseMailVO mailVO, String flag, Long coustomerId) {
		if (mailVO != null) {
			if (mailVO.getUsername() == null || "".equals(mailVO.getUsername())) {
				String from = getSendEmailAddr(coustomerId, flag);
				if (from == null) {
					mailVO.setFrom("service@szlhsoft.com");
					mailVO.setUsername("service@szlhsoft.com");
					mailVO.setPassword("360216530Www");
				} else {
					mailVO.setFrom(from);
					mailVO.setUsername(from);
					mailVO.setPassword(emailPwd);
				}
			}
			if (mailVO.getDisplayName() == null || "".equals(mailVO.getDisplayName()))
				mailVO.setDisplayName("service");
			if (mailVO.getMailType() == null)
				mailVO.setMailType("text/html;charset=utf8");
			try {
				log.info("trying send 1st gmail");
				// commonSend(mailVO);
				gmailSend(mailVO);
				log.info("1st send gmail success");
				return true;
			} catch (AddressException sfe) {
				log.error("1st gmail send error", sfe);
			} catch (MessagingException me) {
				// String estr = me.getMessage();
				log.error("1st gmail send error ", me);
				try {// 备用邮箱
					log.info("trying send 2nd mail");
					commonSend(mailVO);
					log.info("send 2nd mail sucess");
					return true;
				} catch (Exception ex) {
					log.error("2nd send error ", ex);
				}
			} catch (UnsupportedEncodingException ue) {
				log.error("1st gmail send error ", ue);
			}
		}
		return false;
	}

	public static void commonSend(BaseMailVO mailVO)
			throws AddressException, MessagingException, UnsupportedEncodingException {
		Properties props = new Properties(); // Setup mail server
		setProperties(props, "common");
		RayAuthenticator myauth = new RayAuthenticator(mailVO.getUsername(), mailVO.getPassword());
		Session session = Session.getInstance(props, myauth);
		session.setDebug(true);
		MimeMessage message = new MimeMessage(session);
		InternetAddress iaFrom = new InternetAddress(mailVO.getFrom());
		iaFrom.setPersonal(mailVO.getDisplayName());
		message.setFrom(iaFrom);
		setTOCC(mailVO, message);
		message.setSubject(mailVO.getSubject());
		message.setText(mailVO.getContent(), "utf-8", "html");
		setAttachMent(mailVO, message);
		message.saveChanges();
		Transport.send(message);
		log.info("Message sent.");
	}

	public static void gmailSend(BaseMailVO mailVO)
			throws AddressException, MessagingException, UnsupportedEncodingException {
		Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
		Properties props = new Properties();
		setProperties(props, "gmail");
		final String emailFrom = mailVO.getUsername();// Constants.EMAIL_FROM;
		final String emailFromPwd = mailVO.getPassword();// Constants.EMAIL_FROM_PWD;
		Session session = Session.getInstance(props, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(emailFrom, emailFromPwd);
			}
		});
		session.setDebug(true);
		Message msg = new MimeMessage(session);
		setParamter(mailVO, msg);
		setTOCC(mailVO, msg);
		setAttachMent(mailVO, msg);
		msg.saveChanges();
		Transport.send(msg);
		log.info("Message sent.");
	}

	private static String getSendEmailAddr(Long customerId, String flag) {
		if (customerId != null) {
			String idstr = String.valueOf(customerId);
			if (MAIL_LAN_CN.equals(flag)) {
				if (idstr.endsWith("0")) {
					return emailArryCN[0];
				} else if (idstr.endsWith("1") || idstr.endsWith("6")) {
					return emailArryCN[1];
				} else if (idstr.endsWith("2") || idstr.endsWith("7")) {
					return emailArryCN[2];
				} else if (idstr.endsWith("3") || idstr.endsWith("8")) {
					return emailArryCN[3];
				} else if (idstr.endsWith("4") || idstr.endsWith("9")) {
					return emailArryCN[4];
				} else {
					return emailArryCN[5];
				}
			} else {
				if (idstr.endsWith("0")) {
					return emailArryEN[0];
				} else if (idstr.endsWith("1") || idstr.endsWith("6")) {
					return emailArryEN[1];
				} else if (idstr.endsWith("2") || idstr.endsWith("7")) {
					return emailArryEN[2];
				} else if (idstr.endsWith("3") || idstr.endsWith("8")) {
					return emailArryEN[3];
				} else if (idstr.endsWith("4") || idstr.endsWith("9")) {
					return emailArryEN[4];
				} else {
					return emailArryEN[5];
				}
			}
		}
		return null;
	}

	private static void setProperties(Properties props, String type) {
		if ("gmail".equals(type)) {
			props.setProperty("mail.smtp.host", host);
			props.setProperty("mail.smtp.socketFactory.class", SSL_FACTORY);
			props.setProperty("mail.smtp.socketFactory.fallback", "false");
			props.setProperty("mail.smtp.port", "25");
			props.setProperty("mail.smtp.socketFactory.port", "465");
			props.setProperty("mail.smtp.auth", "true");
		} else {
			props.put("mail.smtp.host", host); // Get session
			props.put("mail.smtp.auth", "true"); // 这样才能通过验证
		}
	}

	// 设置邮件发送的容
	private static void setParamter(BaseMailVO mailVO, Message msg)
			throws UnsupportedEncodingException, MessagingException {
		msg.setFrom(new InternetAddress(mailVO.getFrom(), mailVO.getDisplayName()));
		// msg.setRecipients(Message.RecipientType.TO,
		// InternetAddress.parse(toEmail, false));
		msg.setSubject(mailVO.getSubject());
		msg.setSentDate(new Date());
		msg.setContent(mailVO.getContent(), mailVO.getMailType());
	}

	// 设置发送人
	private static void setTOCC(BaseMailVO mailVO, Message msg)
			throws UnsupportedEncodingException, MessagingException {
		if (mailVO.getTo() != null && mailVO.getTo().length > 0) {
			InternetAddress[] addrArry = new InternetAddress[mailVO.getTo().length];
			for (int i = 0; i < mailVO.getTo().length; i++) {
				addrArry[i] = new InternetAddress(mailVO.getTo()[i]);
			}
			msg.setRecipients(Message.RecipientType.TO, addrArry);
		}
		if (mailVO.getCc() != null && mailVO.getCc().length > 0) {
			InternetAddress[] addrArry = new InternetAddress[mailVO.getCc().length];
			for (int i = 0; i < mailVO.getCc().length; i++) {
				addrArry[i] = new InternetAddress(mailVO.getCc()[i]);
			}
			msg.setRecipients(Message.RecipientType.CC, addrArry);
		}
		if (mailVO.getBcc() != null && mailVO.getBcc().length > 0) {
			InternetAddress[] addrArry = new InternetAddress[mailVO.getBcc().length];
			for (int i = 0; i < mailVO.getBcc().length; i++) {
				addrArry[i] = new InternetAddress(mailVO.getBcc()[i]);
			}
			msg.setRecipients(Message.RecipientType.BCC, addrArry);
		}
	}

	@SuppressWarnings("rawtypes")
	private static void setAttachMent(BaseMailVO mailVO, Message msg)
			throws MessagingException, UnsupportedEncodingException {
		Vector file = mailVO.getFile();
		Multipart mp = new MimeMultipart();
		MimeBodyPart mbp = new MimeBodyPart();
		mbp.setContent(mailVO.getContent().toString(), "text/html;charset=gb2312");
		mp.addBodyPart(mbp);
		if (!file.isEmpty()) {// 有附件
			Enumeration efile = file.elements();
			while (efile.hasMoreElements()) {
				mbp = new MimeBodyPart();
				String filename = efile.nextElement().toString(); // 选择出每一个附件名
				FileDataSource fds = new FileDataSource(filename); // 得到数据源
				mbp.setDataHandler(new DataHandler(fds)); // 得到附件本身并至入BodyPart
				// mbp.setFileName(fds.getName()); //得到文件名同样至入BodyPart
				BASE64Encoder enc = new BASE64Encoder();
				mbp.setFileName("=?GBK?B?" + enc.encode(fds.getName().getBytes("GBK")) + "?=");
				mp.addBodyPart(mbp);
			}
			file.removeAllElements();
		}
		msg.setContent(mp); // Multipart加入到信件
	}

	public static void main(String[] args) throws AddressException, UnsupportedEncodingException, MessagingException {
		//
		
		BaseMailVO mailVO = new BaseMailVO();
		mailVO.setTo(new String[] { "wskiawv@163.com" });
		mailVO.setSubject("放学了别走！");
		StringBuffer content = new StringBuffer();
		content.append("<p>Dear lola，</p>");
		content.append("<p>Congratulations on your successful registration！The following is the 3dsMax/Maya Rendering Tutorial.</p>");
		content.append("<p><a href='https://www.baidu.com'>test1</a><br>");
		content.append("<a>test2</a><p>");
		content.append("<p>Best Regards,<br>RAYVISION Support<p>");
		content.append("<p>24 hour hotline：+86 130 5800 5448<br>");
		content.append("Email: service@szlhsoft.com<br>");
		content.append("Shenzhen Add:No.901-B,BAK Building,9keyan Road,Hi-Tech Industrial Park,Shenzhen,P.R.China<p>");
		mailVO.setContent(content.toString());
		Thread t = new mailSendThead(mailVO, "zh", 123L);
		t.start();
		 
		/*try {
			String ts = null;
			ts.indexOf(",");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			// e.printStackTrace();
			// sendErrorEmail(e, 1123466);
			StackTraceElement[] info = e.getStackTrace();
			StringBuffer content = new StringBuffer();
			if (info != null && info.length > 0)
				for (int i = 0; i < info.length; i++) {
					content.append(info[i].toString());
				}
			System.out.println("test====" + e.toString());
			// System.out.println("2"+System.err);
			// System.out.println("3"+e.getMessage());
			String s = e.getStackTrace()[0].toString();
			System.out.println(content.toString());
			sendErrorEmail(e, 123456L);
			// e.printStackTrace();
		}*/

		// doSend(mailVO,"en",123L);
		// /doSend("放学了别走！", "老子知道你住在哪里！一开始我是拒绝的。", "541273847@qq.com", "");
		// commonSend(mailVO);
	}

	public static void asyncSendMail(BaseMailVO mailVO, String language, Long coustomerId) {
		Thread t = new mailSendThead(mailVO, language, coustomerId);
		t.start();
	}

	// Configuration.getErrorManagerEmail("chen")
	public static void sendErrorEmail(Exception e, long customerId) {
		BaseMailVO mailVO = new BaseMailVO();
		mailVO.setTo(new String []{});
		mailVO.setSubject("系统错误邮件");
		StackTraceElement[] info = e.getStackTrace();
		StringBuffer content = new StringBuffer();
		content.append("<p>" + e.toString() + "</p>");
		if (info != null && info.length > 0)
			for (int i = 0; i < info.length; i++) {
				content.append("<p>" + info[i].toString() + "</p>");
			}
		mailVO.setContent(content.toString());
		MailUtil.asyncSendMail(mailVO, "zh", customerId);
	}

}

class RayAuthenticator extends javax.mail.Authenticator {
	private String strUser;
	private String strPwd;

	public RayAuthenticator(String user, String password) {
		this.strUser = user;
		this.strPwd = password;
	}

	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication(strUser, strPwd);
	}

}

class mailSendThead extends Thread {
	private BaseMailVO mailVO;
	private String flag;
	private Long coustomerId;

	public mailSendThead(BaseMailVO mailVO, String flag, Long coustomerId) {
		this.mailVO = mailVO;
		this.flag = flag;
		this.coustomerId = coustomerId;
	}

	public void run() {
		MailUtil mailsend = new MailUtil();
		mailsend.doSend(mailVO, flag, coustomerId);
	}
}
