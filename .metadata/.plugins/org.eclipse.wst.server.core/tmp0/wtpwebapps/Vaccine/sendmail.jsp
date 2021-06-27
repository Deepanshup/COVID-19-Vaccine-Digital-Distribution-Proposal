<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "java.io.*,java.util.*,javax.mail.*"%>
    <%@ page import = "javax.mail.internet.*,javax.activation.*"%>
	<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>

	<%
   String result;
   
   // Recipient's email ID needs to be mentioned.
   String to = request.getParameter("useremail");

   // Sender's email ID needs to be mentioned
   String from = "projectjsp2021@gmail.com";
   String pass="deepanshu1@";

   // Assuming you are sending email from localhost
   String host = "smtp.gmail.com";
	
   Properties props=new Properties();
   props.put("mail.smtp.host",host);
   props.put("mail.transport.protocol","smtp");
   props.put("mail.smtp.auth","true");
   props.put("mail.smtp.starttls.enable", "true");
   props.put("mail.user",from);
   props.put("mail.password",pass);
   props.put("mail.smtp.port","587");
   // Get system properties object
   Properties properties = System.getProperties();


   // Get the default Session object.
    Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {

        @Override

        protected PasswordAuthentication getPasswordAuthentication() {

            return new PasswordAuthentication(from, pass);

        }

    });

    try {

        // Create a default MimeMessage object.

        MimeMessage message = new MimeMessage(mailSession);

        // Set From: header field of the header.

        message.setFrom(new InternetAddress(from));

        // Set To: header field of the header.

        message.addRecipient(Message.RecipientType.TO,

                new InternetAddress(to));

        // Set Subject: header field

        message.setSubject("COVID-19 Vaccine");

        // Now set the actual message

        message.setText("You will be vaccinated tommorow ,please come to your wards hospital tommorow positively.");

        // Send message

        Transport.send(message);

        result = "Your mail sent successfully....";

    } catch (MessagingException mex) {

        mex.printStackTrace();

        result = "Error: unable to send mail....";

    }

%>
<html>
   <head>
      <title>Send Email using JSP</title>
   </head>
   
   <body>
      <p align = "center">
         <% 
            out.println("Result: " + result + "\n");
         %>
         <center>
         	<a href="./userlist.jsp" align="center">
         	<button>Return to User list</button>
         </a>
         </center>
      </p>
   </body>
</html>