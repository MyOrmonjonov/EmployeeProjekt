package org.example.demo6.servlet;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/verifyCode")
public class VerifyCodeServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String enteredCode = req.getParameter("code");
        String sessionCode = (String) req.getSession().getAttribute("verificationCode");

        if (enteredCode == null || sessionCode == null || !enteredCode.equals(sessionCode)) {
            req.setAttribute("errorMessage", " code is incorrect.");
            req.getRequestDispatcher("verfyCoder.jsp").forward(req, resp);
        } else {

            resp.sendRedirect("Home.jsp");
            req.getSession().removeAttribute("verificationCode");
        }
    }
}
