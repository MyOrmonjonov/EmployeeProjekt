package org.example.demo6;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashSet;
import java.util.Set;

@WebFilter("/*")
public class Filter extends HttpFilter {

    private static final Set<String> OPEN_PAGES = new HashSet<>();

    static {
        OPEN_PAGES.add("/Login.jsp");
        OPEN_PAGES.add("/login");
        OPEN_PAGES.add("/register.jsp");
        OPEN_PAGES.add("/register");
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;

        HttpSession session = request.getSession(false);
        Object email = (session != null) ? session.getAttribute("email") : null;

        String path = request.getRequestURI();
        String contextPath = request.getContextPath();
        String relativePath = path.substring(contextPath.length());


        if (email != null || OPEN_PAGES.contains(relativePath)) {
            chain.doFilter(req, res);
        } else {
            response.sendRedirect(contextPath + "/Login.jsp");
        }
    }
}
