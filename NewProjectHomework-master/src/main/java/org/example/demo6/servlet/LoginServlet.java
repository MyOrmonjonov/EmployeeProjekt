package org.example.demo6.servlet;

import jakarta.mail.Message;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import jakarta.mail.Session;
import jakarta.mail.Authenticator;
import jakarta.mail.PasswordAuthentication;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Properties;
import java.util.Random;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private static final String SYSTEM_EMAIL = "muhammadyusufname@gmail.com";
    private static final String SYSTEM_PASSWORD = "huibfiqyiabrafhi";
    private static final String ADMIN_EMAIL = "admin@example.com";
    private static final String STORED_PASSWORD = "123";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        if (!isValidEmail(email)) {
            req.setAttribute("errorMessage", "Invalid email format.");
            req.getRequestDispatcher("Login.jsp").forward(req, resp);
            return;
        }


        if (password == null || password.isEmpty()) {
            req.setAttribute("errorMessage", "Password cannot be empty.");
            req.getRequestDispatcher("Login.jsp").forward(req, resp);
            return;
        }

        if (!password.equals(STORED_PASSWORD)) {
            req.setAttribute("errorMessage", "Incorrect email or password.");
            req.getRequestDispatcher("Login.jsp").forward(req, resp);
            return;
        }


        String verificationCode = String.format("%06d", new Random().nextInt(999999));
        HttpSession session = req.getSession();
        session.setAttribute("email", email);
        session.setAttribute("verificationCode", verificationCode);

        if (ADMIN_EMAIL.equals(email)) {
            session.setAttribute("role", "admin");
        } else {
            session.setAttribute("role", "user");
        }


        boolean emailSent = sendVerificationEmail(email, verificationCode);

        if (emailSent) {
            resp.sendRedirect("verfyCoder.jsp");
            System.out.println("Code"+verificationCode);
        } else {
            req.setAttribute("errorMessage", "Failed to send verification email.");
            req.getRequestDispatcher("Login.jsp").forward(req, resp);
        }
    }

    private boolean isValidEmail(String email) {
        String emailRegex = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$";
        return email != null && email.matches(emailRegex);
    }

    private boolean sendVerificationEmail(String recipientEmail, String verificationCode) {
        try {
            Properties properties = new Properties();
            properties.put("mail.smtp.host", "smtp.gmail.com");
            properties.put("mail.smtp.port", "587");
            properties.put("mail.smtp.auth", "true");
            properties.put("mail.smtp.starttls.enable", "true");

            Session session = Session.getInstance(properties, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(SYSTEM_EMAIL, SYSTEM_PASSWORD);
                }
            });

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(SYSTEM_EMAIL));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipientEmail));
            message.setSubject("Your Verification Code");
            message.setText("Your verification code is: " + verificationCode);

            Transport.send(message);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
