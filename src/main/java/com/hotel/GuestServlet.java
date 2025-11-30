package com.hotel;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

//@WebServlet("/guests")
public class GuestServlet extends HttpServlet {

    // GET Request -> decide action
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if (action == null) action = "list";

        try {
            switch (action) {
                case "new":
                    showForm(req, resp);
                    break;

                case "edit":
                    showEditForm(req, resp);
                    break;

                case "delete":
                    deleteGuest(req, resp);
                    break;

                case "view":
                    viewGuest(req, resp);
                    break;

                default:
                    listGuests(req, resp);
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("error.jsp");
        }
    }

    // POST Request -> insert or update
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        try {
            if ("update".equals(action)) {
                updateGuest(req, resp);
            } else {
                insertGuest(req, resp);
            }
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("error.jsp");
        }
    }

    // List all guests
    private void listGuests(HttpServletRequest req, HttpServletResponse resp) throws Exception {

        List<Guest> guestList = new ArrayList<>();

        String sql = "SELECT * FROM guests WHERE is_active = 1 ORDER BY id DESC";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Guest g = new Guest();

                g.setId(rs.getInt("id"));
                g.setName(rs.getString("name"));
                g.setPhone(rs.getString("phone"));
                g.setEmail(rs.getString("email"));
                g.setAddress(rs.getString("address"));
                g.setIdProof(rs.getString("id_proof"));
                g.setCreatedAt(rs.getTimestamp("created_at"));
                g.setIsActive(rs.getBoolean("is_active"));

                guestList.add(g);
            }
        }

        req.setAttribute("guests", guestList);
        req.getRequestDispatcher("guests.jsp").forward(req, resp);
    }

    // Show create form
    private void showForm(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("guest-form.jsp").forward(req, resp);
    }

    // Show edit form
    private void showEditForm(HttpServletRequest req, HttpServletResponse resp)
            throws Exception {

        int id = Integer.parseInt(req.getParameter("id"));

        String sql = "SELECT * FROM guests WHERE id=?";
        Guest g = new Guest();

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                g.setId(rs.getInt("id"));
                g.setName(rs.getString("name"));
                g.setPhone(rs.getString("phone"));
                g.setEmail(rs.getString("email"));
                g.setAddress(rs.getString("address"));
                g.setIdProof(rs.getString("id_proof"));
                g.setIsActive(rs.getBoolean("is_active"));
            }
        }

        req.setAttribute("guest", g);
        req.getRequestDispatcher("guest-form.jsp").forward(req, resp);
    }

    // View details
    private void viewGuest(HttpServletRequest req, HttpServletResponse resp)
            throws Exception {

        int id = Integer.parseInt(req.getParameter("id"));

        String sql = "SELECT * FROM guests WHERE id=?";
        Guest g = new Guest();

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                g.setId(rs.getInt("id"));
                g.setName(rs.getString("name"));
                g.setPhone(rs.getString("phone"));
                g.setEmail(rs.getString("email"));
                g.setAddress(rs.getString("address"));
                g.setIdProof(rs.getString("id_proof"));
                g.setCreatedAt(rs.getTimestamp("created_at"));
                g.setIsActive(rs.getBoolean("is_active"));
            }
        }

        req.setAttribute("guest", g);
        req.getRequestDispatcher("guest-details.jsp").forward(req, resp);
    }

    // Insert guest
    private void insertGuest(HttpServletRequest req, HttpServletResponse resp) throws Exception {

        String sql = "INSERT INTO guests (name, phone, email, address, id_proof) VALUES (?, ?, ?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, req.getParameter("name"));
            ps.setString(2, req.getParameter("phone"));
            ps.setString(3, req.getParameter("email"));
            ps.setString(4, req.getParameter("address"));
            ps.setString(5, req.getParameter("id_proof"));

            ps.executeUpdate();
        }

        resp.sendRedirect("guests");
    }

    // Update guest
    private void updateGuest(HttpServletRequest req, HttpServletResponse resp) throws Exception {

        String sql = "UPDATE guests SET name=?, phone=?, email=?, address=?, id_proof=?, is_active=? WHERE id=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, req.getParameter("name"));
            ps.setString(2, req.getParameter("phone"));
            ps.setString(3, req.getParameter("email"));
            ps.setString(4, req.getParameter("address"));
            ps.setString(5, req.getParameter("id_proof"));
            ps.setInt(6, req.getParameter("is_active") != null ? 1 : 0);
            ps.setInt(7, Integer.parseInt(req.getParameter("id")));

            ps.executeUpdate();
        }

        resp.sendRedirect("guests");
    }

    // Soft delete
    private void deleteGuest(HttpServletRequest req, HttpServletResponse resp)
            throws Exception {

        String sql = "UPDATE guests SET is_active=0 WHERE id=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, Integer.parseInt(req.getParameter("id")));
            ps.executeUpdate();
        }

        resp.sendRedirect("guests");
    }
}
