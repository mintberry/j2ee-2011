package com.tongji.j2ee.sp;

import java.io.IOException;
import java.util.Date;
import java.util.Properties;
import java.util.Vector;

import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class SendMailServlet extends HttpServlet {

	//TODO: create an email account to send email
	String from = "";
	String password = "";
	String mailserver = "";
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	public void sendMail(String to, String subject, String content){
		try {
			String messageText = content;
			Properties prop = new Properties();
			prop.put("mail.smtp.host", mailserver);
			prop.put("mail.smtp.auth", "true");
			Session sess = Session.getInstance(prop);
			sess.setDebug(true);
			MimeMessage message = new MimeMessage(sess);
			// ����Ϣ���������ռ��ˡ������ˡ����⡢����ʱ��
			InternetAddress mail_from = new InternetAddress(from);
			message.setFrom(mail_from);
			InternetAddress mail_to = new InternetAddress(to);
			message.setRecipient(Message.RecipientType.TO, mail_to);
			message.setSubject(subject);
			message.setSentDate(new Date());

			Multipart mul = new MimeMultipart(); // �½�һ��MimeMultipart��������Ŷ��BodyPart����
			BodyPart mdp = new MimeBodyPart(); // �½�һ������ż����ݵ�BodyPart����
			mdp.setContent(messageText, "text/html;charset=gb2312");
			mul.addBodyPart(mdp); // �������ż����ݵ�BodyPart���뵽MimeMulitipart������
			message.setContent(mul); // ��mul��Ϊ��Ϣ���������
			message.saveChanges();
			Transport transport = sess.getTransport("smtp");
			// ��smtp��ʽ��½���䣬��1�������Ƿ����ʼ��õ��ʼ�������SMTP��ַ����2������Ϊ�û�������3������Ϊ����
			transport.connect(mailserver, from, password);
			transport.sendMessage(message, message.getAllRecipients());
			transport.close();
		} catch (Exception e) {
			System.out.println("�����ʼ������Ĵ���" + e.getMessage());

		}
	}
	
	public void sendMails(Vector<String> to, String subject, String content){
		try {
			
		} catch (Exception e) {
			System.out.println("�����ʼ������Ĵ���" + e.getMessage());
		}
	}
	
	public void init() throws ServletException {
		// Put your code here
	}

}
