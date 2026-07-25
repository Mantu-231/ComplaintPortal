package com.project.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.project.db.DBConnection;

public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        res.setContentType("text/html");
        PrintWriter out = res.getWriter();

        try {

            // Get Login Data
            String email = req.getParameter("email");
            String password = req.getParameter("password");

            // Database Connection
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                    "SELECT * FROM users WHERE email=? AND password=?");
            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                // Create Session
                HttpSession session = req.getSession(true);

                // Store User Information
                session.setAttribute("user", rs.getString("name"));
                session.setAttribute("email", rs.getString("email"));
                session.setAttribute("role", rs.getString("role"));

                // Session Timeout (30 Minutes)
                session.setMaxInactiveInterval(30 * 60);

                // Redirect Dashboard
                res.sendRedirect("dashboard.jsp");

            } else {

                out.println("<h3 style='color:red;text-align:center;'>Invalid Email or Password</h3>");

            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {

            e.printStackTrace();
            out.println("<h3>Error : " + e.getMessage() + "</h3>");

        }
    }
}