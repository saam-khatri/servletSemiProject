package config;

import jakarta.mail.*;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

import java.util.Properties;

public class SendEmail <P>{
    P password = null;

    public SendEmail(P password){
        this.password = password;
    }
    public void sendEmail(String from, String to, String subject, String message)
    {
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", 587);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");  // Use TLS

        Authenticator auth = new Authenticator()
        {
            public PasswordAuthentication getPasswordAuthentication()
            {
                return new PasswordAuthentication(from, (String)password);

            }
        };
        Session session = Session.getInstance(props, auth);
        try {
            // Create the email message
            MimeMessage mm = new MimeMessage(session);
            mm.setFrom(new InternetAddress(from));
            mm.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            mm.setSubject(subject);
            mm.setText(message);

            // Send the email
            Transport.send(mm);

        } catch (MessagingException e) {
            e.printStackTrace();
        }

    }

}
