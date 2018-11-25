package br.com.grupointegrado.email;

import br.com.grupointegrado.model.Contato;
import java.util.Properties;
import javax.mail.Address;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
 
public class JavaMailApp {
    
    public static void sendContatoEmail( Contato contato ) {
        Properties props = new Properties();
        
        /** Parâmetros de conexão com servidor Gmail */
        props.put( "mail.smtp.host", "smtp.gmail.com" );
        props.put( "mail.smtp.socketFactory.port", "465" );
        props.put( "mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory" );
        props.put( "mail.smtp.auth", "true" );
        props.put( "mail.smtp.port", "465" );

        Session session = Session.getDefaultInstance(
            props,
            new javax.mail.Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication( "carshop.integrado@gmail.com", "carshop2password" );
                }
            }
        );

        /** Ativa Debug para sessão */
        session.setDebug( true );

        try {

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("higor.halmeida@gmail.com")); //Remetente

            Address[] toUser = InternetAddress //Destinatário(s)
                .parse("higor.almeida@grupointegrado.br");  

            message.setRecipients(Message.RecipientType.TO, toUser);
            message.setSubject("Nova Mensagem de Carshop");//Assunto
            message.setText("Ola! Você tem uma nova mendagem de " + contato.getNome() + "."
                    + " \n E-mail: " + contato.getEmail()  
                    + " \n Mensagem: " + contato.getMensagem() );
            
            /**Método para enviar a mensagem criada*/
            Transport.send(message);

         } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
        
    }
    
    
    /*public static void main(String[] args) {
        Properties props = new Properties();
          
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "465");

        Session session = Session.getDefaultInstance(
                props,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication("higor.halmeida@gmail.com", "Eg5sy4gt");
                    }
                }
        );

        
        session.setDebug(true);

        try {

              Message message = new MimeMessage(session);
              message.setFrom(new InternetAddress("higor.halmeida@gmail.com")); //Remetente

              Address[] toUser = InternetAddress //Destinatário(s)
                         .parse("higor.almeida@grupointegrado.br");  

              message.setRecipients(Message.RecipientType.TO, toUser);
              message.setSubject("Enviando email com JavaMail");//Assunto
              message.setText("Enviei este email utilizando JavaMail com minha conta GMail!");
              
              Transport.send(message);

         } catch (MessagingException e) {
              throw new RuntimeException(e);
        }
    }*/
}
