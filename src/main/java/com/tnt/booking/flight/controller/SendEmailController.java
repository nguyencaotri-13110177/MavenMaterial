package com.tnt.booking.flight.controller;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class SendEmailController {

    @RequestMapping(value = "/guiemail", method = RequestMethod.GET)
    public String guiemail1() {
        return "guiemail";
    }

    @RequestMapping(value = "/guiemail", method = RequestMethod.POST)
    @ResponseBody
    public String guiemail(ModelMap mm, @RequestParam(value = "EmailNhan") String EmailNhan, @RequestParam(value = "NoiDung") String NoiDung) {

        try {
            email(EmailNhan, NoiDung);            
            mm.addAttribute("thongbao", "Thư của bạn đã được gửi");
        } catch (Exception e) {
            e.printStackTrace();
            mm.addAttribute("thongbao", "Gửi thất bại");
        }

        return "guiemail";
    }
    
    public void email(String EmailNhan, String NoiDung) {

        final String user = "datvemaybay2017@gmail.com";
        final String pass = "19951879tri@";

        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, pass);
            }
        });

        try {
            MimeMessage me = new MimeMessage(session);
            me.setFrom(new InternetAddress(user));
            me.addRecipient(Message.RecipientType.TO, new InternetAddress(EmailNhan));            

            me.setSubject("T&TFlightTicket");

            Multipart mp = new MimeMultipart();
            MimeBodyPart htmlPart = new MimeBodyPart();
            htmlPart.setContent(NoiDung, "text/html; charset=utf-8");
            mp.addBodyPart(htmlPart);
            me.setContent(mp);
            
            Transport.send(me);
            //return true;
        } catch (Exception e) {
            e.printStackTrace();
            //return false;
        }
    }
}
