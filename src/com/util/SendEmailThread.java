package com.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.ServletContext;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;



@Component
@Scope("prototype")
public class SendEmailThread extends Thread {
	private String toAddress;
	private String subject;
	private String content;
	private String activityType;

	private static final String from = "marketing@toddlytic.com";
	private static final String password = "cloudbasha12##";

	// private static final String from = "dilipcloud87@gmail.com";
	// private static final String password = "Mathi@87";

	

	public SendEmailThread() {

	}

	public String getToAddress() {
		return toAddress;
	}

	public void setToAddress(String toAddress) {
		this.toAddress = toAddress;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public void run() {

		// Sender's email ID needs to be mentioned

		// Get system properties
		Properties properties = System.getProperties();

		// Setup mail server
		properties.setProperty("mail.transport.protocol", "smtp");
		properties.setProperty("mail.host", "smtp.gmail.com");
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.port", "465");
		properties.put("mail.debug", "true");
		properties.put("mail.smtp.socketFactory.port", "465");
		properties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		properties.put("mail.smtp.socketFactory.fallback", "false");
		properties.setProperty("mail.user", "noreply@toddlytic.com");
		properties.setProperty("mail.password", "cloudbasha12##");
		/*
		 * properties.setProperty("mail.user", "dilipcloud87@gmail.com");
		 * properties.setProperty("mail.password", "Mathi@87");
		 */

		// Get the default Session object.
		Session session = Session.getDefaultInstance(properties, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(from, password);
			}
		});

		try {
			// Create a default MimeMessage object.
			MimeMessage message = new MimeMessage(session);

			// Set From: header field of the header.

			message.setFrom(new InternetAddress("noreply@toddlytic.com", "Toddlytic"));

			// Set To: header field of the header.
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(toAddress));

			// Set Subject: header field
			message.setSubject(subject);

			/* From Max */
			/*
			 * MimeMultipart multiPart = new MimeMultipart("related"); BodyPart
			 * messageBodyPart = new MimeBodyPart();
			 * messageBodyPart.setContent(content, "text/html; charset=utf-8");
			 * multiPart.addBodyPart(messageBodyPart);
			 * 
			 * DataSource fds = new
			 * FileDataSource("../WebContent/images/toddlyticWhiteLogo.png");
			 * messageBodyPart.setDataHandler(new DataHandler(fds));
			 * messageBodyPart.setHeader("Content-ID", "<image>");
			 * multiPart.addBodyPart(messageBodyPart);
			 * message.setContent(multiPart);
			 */
			/* End Max */

			message.setContent(content, "text/html; charset=utf-8");
			Transport.send(message);

			System.out.println("Sent message successfully....");
		} catch (MessagingException mex) {
			mex.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public String getActivityType() {
		return activityType;
	}

	public void setActivityType(String activityType) {
		this.activityType = activityType;
	}
}
