package com.project.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.project.db.DBConnection;

public class AddComplaintServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        res.setContentType("text/html");
        PrintWriter out = res.getWriter();

        try {

            // Check Login
            HttpSession session = req.getSession(false);

            if (session == null || session.getAttribute("email") == null) {
                res.sendRedirect("login.jsp");
                return;
            }

            // Get Logged-in User Email
            String email = (String) session.getAttribute("email");

            // Get Form Data
            String name = req.getParameter("name");
            String role = req.getParameter("role");
            String category = req.getParameter("category");
            String description = req.getParameter("description");

            // Database Connection
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO complaints(name,email,role,category,description) VALUES(?,?,?,?,?)");

            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, role);
            ps.setString(4, category);
            ps.setString(5, description);

            int i = ps.executeUpdate();

            if (i > 0) {

                res.sendRedirect("dashboard.jsp");

            } else {

                out.println("<h3>Failed to add complaint!</h3>");

            }

            ps.close();
            con.close();

        } catch (Exception e) {

            e.printStackTrace();
            out.println("<h3>Error : " + e.getMessage() + "</h3>");

        }

    }
}