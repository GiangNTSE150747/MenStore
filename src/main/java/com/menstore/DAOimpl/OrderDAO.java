/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.menstore.DAOimpl;

import com.menstore.DAO.IOrderDAO;
import com.menstore.model.Order;
import com.menstore.utils.DBUtils;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author MyPC
 */
public class OrderDAO implements IOrderDAO {

    @Override
    public int getNoOfRecords() {

        String sql = "SELECT COUNT(InvoiceID) as noOfRecords FROM Orders";

        try {

            Connection conn = DBUtils.getConnection();

            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                return rs.getInt("noOfRecords");
            }

        } catch (Exception ex) {

            ex.printStackTrace();

        }
        return 0;
    }

    @Override
    public boolean save(Order order) {
        String sql = "INSERT INTO Orders \n"
                + " VALUES(?,?,?,?,?,?,?,?)";

        try {

            Connection conn = DBUtils.getConnection();

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, order.getOrderId());
            ps.setDouble(2, order.getDiscountedMoney());
            ps.setDate(3, order.getOrderDate());
            ps.setDouble(4, order.getTotal());
            ps.setNString(5, order.getNote());
            ps.setNString(6, order.getStatus());
            ps.setString(7, order.getUserId());
            ps.setString(8, order.getVoucherId());

            if (ps.executeUpdate() > 0) {
                return true;
            }

        } catch (Exception ex) {

            ex.printStackTrace();

        }

        return false;
    }

    @Override
    public List<Order> list() {
        ArrayList<Order> list;
        list = new ArrayList<Order>();

        String sql = "select * from Orders";

        try {

            Connection conn = DBUtils.getConnection();

            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                order.setOrderId(rs.getString("InvoiceID"));
                order.setNote(rs.getString("Note"));
                order.setDiscountedMoney(rs.getInt("DiscountedPrice"));
                order.setTotal(rs.getInt("Total"));
                order.setOrderDate(rs.getDate("OrderDate"));
                order.setStatus(rs.getString("Status"));
                order.setVoucherId(rs.getString("VoucherID"));
                order.setUserId(rs.getString("UserID"));
                list.add(order);
            }

        } catch (Exception ex) {

            ex.printStackTrace();

        }
        return list;
    }

    @Override
    public List<Order> list(int start, int recordsPerPage, String direction, String by) {

        ArrayList<Order> list;
        list = new ArrayList<Order>();
        String sql = " DECLARE @col as varchar(255) = ?\n";

        String direc = direction.equals("up") ? "ASC" : "DESC";

        if (by.equals("discounted") || by.equals("total")) {
            sql += " select * from Orders \n"
                    + " ORDER BY CASE @col\n"
                    + "		WHEN 'discounted' THEN DiscountedPrice\n"
                    + "		WHEN 'total' THEN Total\n"
                    + "			END " + direc + "\n"
                    + " OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        } else if (by.equals("id")) {
            sql += " SELECT *\n"
                    + " FROM Orders\n"
                    + " ORDER BY InvoiceID " + direc + "\n"
                    + " OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        } else {
            sql += " SELECT *\n"
                    + " FROM Orders\n"
                    + " ORDER BY OrderDate " + direc + "\n"
                    + " OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        }
        try {

            Connection conn = DBUtils.getConnection();

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, by);
            ps.setInt(2, start);
            ps.setInt(3, recordsPerPage);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Order order = new Order();
                order.setOrderId(rs.getString("InvoiceID"));
                order.setNote(rs.getString("Note"));
                order.setDiscountedMoney(rs.getInt("DiscountedPrice"));
                order.setTotal(rs.getInt("Total"));
                order.setOrderDate(rs.getDate("OrderDate"));
                order.setStatus(rs.getString("Status"));
                order.setVoucherId(rs.getString("VoucherID"));
                order.setUserId(rs.getString("UserID"));
                list.add(order);
            }

        } catch (Exception ex) {

            ex.printStackTrace();

        }

        return list;

    }

    @Override
    public List<Order> list(int start, int recordsPerPage) {
        ArrayList<Order> list;
        list = new ArrayList<Order>();

        String sql = "select * from Orders"
                + " ORDER BY InvoiceID\n"
                + " OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        try {

            Connection conn = DBUtils.getConnection();

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, start);
            ps.setInt(2, recordsPerPage);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Order order = new Order();
                order.setOrderId(rs.getString("InvoiceID"));
                order.setNote(rs.getString("Note"));
                order.setDiscountedMoney(rs.getInt("DiscountedPrice"));
                order.setTotal(rs.getInt("Total"));
                order.setOrderDate(rs.getDate("OrderDate"));
                order.setStatus(rs.getString("Status"));
                order.setVoucherId(rs.getString("VoucherID"));
                order.setUserId(rs.getString("UserID"));
                list.add(order);
            }

        } catch (Exception ex) {

            ex.printStackTrace();

        }

        return list;
    }

    @Override
    public boolean delete(String orderId) {
        String sql = "DELETE FROM Orders WHERE InvoiceID = ?;";

        try {

            Connection conn = DBUtils.getConnection();

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, orderId);

            if (ps.executeUpdate() > 0) {
                return true;
            }

        } catch (Exception ex) {

            ex.printStackTrace();

        }

        return false;
    }

    @Override
    public boolean add(Order product) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean updateStatus(String id, String status) {
        String sql = "UPDATE Orders \n"
                + " SET Status = ?\n"
                + " WHERE InvoiceID LIKE ?";

        try {

            Connection conn = DBUtils.getConnection();

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setNString(1, status);
            ps.setString(2, id);

            if (ps.executeUpdate() > 0) {
                return true;
            }

        } catch (Exception ex) {

            ex.printStackTrace();

        }

        return false;
    }

    @Override
    public List<Order> search(String id) {
        ArrayList<Order> list;
        list = new ArrayList<Order>();

        String sql = "select * from Orders "
                + " where InvoiceID like ?";

        try {

            Connection conn = DBUtils.getConnection();

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                order.setOrderId(rs.getString("InvoiceID"));
                order.setNote(rs.getString("Note"));
                order.setDiscountedMoney(rs.getInt("DiscountedPrice"));
                order.setTotal(rs.getInt("Total"));
                order.setOrderDate(rs.getDate("OrderDate"));
                order.setStatus(rs.getString("Status"));
                order.setVoucherId(rs.getString("VoucherID"));
                order.setUserId(rs.getString("UserID"));
                list.add(order);
            }

        } catch (Exception ex) {

            ex.printStackTrace();

        }
        return list;
    }

}
