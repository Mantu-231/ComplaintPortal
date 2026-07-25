package com.project.servlet;

import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.project.db.DBConnection;

public class DeleteServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws IOException {

        try {

            HttpSession session = req.getSession(false);

            if (session == null) {
                res.sendRedirect("login.jsp");
                return;
            }

            String role = (String) session.getAttribute("role");

            // Only Admin can delete
            if (role == null || !role.equalsIgnoreCase("Admin")) {
                res.getWriter().println("<h2 style='color:red;'>Access Denied! Only Admin can delete complaints.</h2>");
                return;
            }

            int id = Integer.parseInt(req.getParameter("id"));

            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                    "DELETE FROM complaints WHERE id=?");

            ps.setInt(1, id);

            ps.executeUpdate();

            ps.close();
            con.close();

            res.sendRedirect("dashboard.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}