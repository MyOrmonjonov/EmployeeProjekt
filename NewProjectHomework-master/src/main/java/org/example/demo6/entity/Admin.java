package org.example.demo6.entity;

import javax.servlet.http.HttpSession;

public class Admin {

    private String email;
    private String role;

    // Constructor
    public Admin(String email) {
        this.email = email;
        this.role = "admin"; // Har doim "admin" bo'ladi
    }

    // Getter and Setter for email
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    // Getter for role
    public String getRole() {
        return role;
    }

    // Admin sessiyasini saqlash
    public void saveToSession(HttpSession session) {
        session.setAttribute("email", this.email);
        session.setAttribute("role", this.role);
    }

    // Sessiyani tozalash
    public static void clearSession(HttpSession session) {
        if (session != null) {
            session.invalidate();
        }
    }

    @Override
    public String toString() {
        return "Admin{" +
                "email='" + email + '\'' +
                ", role='" + role + '\'' +
                '}';
    }
}
