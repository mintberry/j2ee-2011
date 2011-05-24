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
	String from = "notifysse@gmail.com";
	String password = "wanghaozhu";
	String mailserver = "smtp.gmail.com";
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//sendMail("luffywuliao@gmail.com, notifysse@gmail.com", "test", "如题");
		Vector<String> to = new Vector<String>();
		to.add("notifysse@gmail.com");
		to.add("luffywuliao@gmail.com");
		sendMails(to, "grouptest", "RT");
	}
	
	public void sendMail(String to, String subject, String content){
		try {
			Properties prop = new Properties();
			prop.put("mail.smtp.host", mailserver);
			prop.put("mail.smtp.auth", "true");
			Session sess = Session.getInstance(prop);
			sess.setDebug(true);
			MimeMessage message = new MimeMessage(sess);
			
			InternetAddress mail_from = new InternetAddress(from);
			message.setFrom(mail_from);
			InternetAddress[] mail_to = {new InternetAddress(to)};
			message.setRecipients(Message.RecipientType.TO, mail_to);
			message.setSubject(subject);
			message.setSentDate(new Date());

			Multipart mul = new MimeMultipart(); 
			BodyPart mdp = new MimeBodyPart(); 
			mdp.setContent(content, "text/html;charset=gb2312");
			mul.addBodyPart(mdp); 
			message.setContent(mul);
			message.saveChanges();
			Transport transport = sess.getTransport("smtps");
			transport.connect(mailserver, from, password);
			transport.sendMessage(message, message.getAllRecipients());
			transport.close();
		} catch (Exception e) {
			System.out.println("Email sending error:" + e.getMessage());
		}
	}
	
	public void sendMails(Vector<String> to, String subject, String content){
		try {
			Properties prop = new Properties();
			prop.put("mail.smtp.host", mailserver);
			prop.put("mail.smtp.auth", "true");
			Session sess = Session.getInstance(prop);
			sess.setDebug(true);
			MimeMessage message = new MimeMessage(sess);
			
			InternetAddress mail_from = new InternetAddress(from);
			message.setFrom(mail_from);
			for(int i=0;i<to.size();i++){
				InternetAddress mail_to = new InternetAddress(to.get(i));
				message.addRecipient(Message.RecipientType.TO, mail_to);
			}
			message.setSubject(subject);
			message.setSentDate(new Date());

			Multipart mul = new MimeMultipart(); 
			BodyPart mdp = new MimeBodyPart(); 
			mdp.setContent(content, "text/html;charset=gb2312");
			mul.addBodyPart(mdp); 
			message.setContent(mul);
			message.saveChanges();
			Transport transport = sess.getTransport("smtps");
			transport.connect(mailserver, from, password);
			transport.sendMessage(message, message.getAllRecipients());
			transport.close();
		} catch (Exception e) {
			System.out.println("Email sending error:" + e.getMessage());
		}
	}
	
	public void init() throws ServletException {
		// Put your code here
	}

}
