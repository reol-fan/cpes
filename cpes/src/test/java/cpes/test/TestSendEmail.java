package cpes.test;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;

public class TestSendEmail {
	
	public static void main(String[] args) throws MessagingException {
		JavaMailSenderImpl javaMailSender = new JavaMailSenderImpl();
		
		javaMailSender.setDefaultEncoding("UTF-8");
        MimeMessage mail = javaMailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(mail);
        helper.setSubject("测试java代码发送邮件");
        StringBuilder content = new StringBuilder();
        content.append("测试文本的内容，请注意查收邮件");
        helper.setText(content.toString(), true);
        helper.setTo("179308499@qq.com");
        javaMailSender.send(mail);
	}
}
