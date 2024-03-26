package com.bags.sixdoBag.model.user;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class EmailService {

    @Autowired
    private JavaMailSender emailSender;

    @Async
    public void sendEmail(MimeMessagePreparator messagePreparator) {
        try {
            emailSender.send(messagePreparator);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
