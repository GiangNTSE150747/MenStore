/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.menstore.DAOimpl;

import com.menstore.DAO.IVoucherDAO;
import com.menstore.model.Voucher;
import com.menstore.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author MyPC
 */
public class VoucherDAO implements IVoucherDAO {

    @Override
    public int loadDiscountedPercent(String voucherId) {
        int discountedPercent = find(voucherId).getDiscountedPercent();

        return discountedPercent;
    }

    @Override
    public Voucher find(String voucherId) {
        Voucher voucher = new Voucher();
        String sql = "select * from Voucher where VoucherID = ?";

        try {

            Connection conn = DBUtils.getConnection();

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, voucherId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                voucher.setVoucherID(rs.getString("VoucherID"));
                voucher.setDiscountedPercent(rs.getInt("Discount"));
                voucher.setDueDate(rs.getDate("DueDate"));
                voucher.setMaximumDiscount(rs.getDouble("Maximum_discount"));
                voucher.setRequired(rs.getDouble("Required"));
                voucher.setDescription(rs.getString("Description"));
            }
        } catch (Exception ex) {

            ex.printStackTrace();

        }

        return voucher;
    }

    @Override
    public int getNoOfRecords() {
        String sql = "SELECT COUNT(VoucherID) as noOfRecords FROM Voucher";

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
    public List<Voucher> list(int start, int recordsPerPage) {
        ArrayList<Voucher> list;
        list = new ArrayList<Voucher>();

        String sql = "SELECT *\n"
                + " FROM Voucher\n"
                + " ORDER BY VoucherID\n"
                + " OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        try {

            Connection conn = DBUtils.getConnection();

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, start);
            ps.setInt(2, recordsPerPage);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Voucher voucher = new Voucher();
                voucher.setVoucherID(rs.getString("VoucherID"));
                voucher.setDiscountedPercent(rs.getInt("Discount"));
                voucher.setDueDate(rs.getDate("DueDate"));
                voucher.setMaximumDiscount(rs.getDouble("Maximum_discount"));
                voucher.setRequired(rs.getDouble("Required"));
                voucher.setDescription(rs.getString("Description"));
                list.add(voucher);
            }

        } catch (Exception ex) {

            ex.printStackTrace();

        }

        return list;
    }

    @Override
    public List<Voucher> list(int start, int recordsPerPage, String direction, String by) {
        ArrayList<Voucher> list;
        list = new ArrayList<Voucher>();
        String sql = " DECLARE @col as varchar(255) = ?\n";

        String direc = direction.equals("up") ? "ASC" : "DESC";

        if (by.equals("maximum_discount") || by.equals("required") || by.equals("discount")) {
            sql += " SELECT *\n"
                    + " FROM Voucher\n"
                    + " ORDER BY CASE @col\n"
                    + "		WHEN 'maximum_discount' THEN Maximum_discount\n"
                    + "		WHEN 'required' THEN Required\n"
                    + "		WHEN 'discount' THEN Discount\n"
                    + "			END " + direc + "\n"
                    + " OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        } else if (by.equals("voucherID")) {
            sql += " SELECT *\n"
                    + " FROM Voucher\n"
                    + " ORDER BY VoucherID " + direc + "\n"
                    + " OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        } else if (by.equals("date")) {
            sql += " SELECT *\n"
                    + " FROM Voucher\n"
                    + " ORDER BY DueDate " + direc + "\n"
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
                Voucher voucher = new Voucher();
                voucher.setVoucherID(rs.getString("VoucherID"));
                voucher.setDiscountedPercent(rs.getInt("Discount"));
                voucher.setDueDate(rs.getDate("DueDate"));
                voucher.setMaximumDiscount(rs.getDouble("Maximum_discount"));
                voucher.setRequired(rs.getDouble("Required"));
                voucher.setDescription(rs.getNString("Description"));
                list.add(voucher);
            }

        } catch (Exception ex) {

            ex.printStackTrace();

        }

        return list;
    }

    @Override
    public boolean delete(String id) {
        String sql = "DELETE FROM Voucher WHERE VoucherID = ?;";

        try {

            Connection conn = DBUtils.getConnection();

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, id);

            if (ps.executeUpdate() > 0) {
                return true;
            }

        } catch (Exception ex) {

            ex.printStackTrace();

        }

        return false;
    }

    @Override
    public boolean add(Voucher voucher) {
         String sql = "INSERT INTO Voucher \n"
                + " VALUES(?,?,?,?,?,?)";

        try {

            Connection conn = DBUtils.getConnection();

            PreparedStatement ps = conn.prepareStatement(sql);
            
            ps.setString(1, voucher.getVoucherID());
            ps.setInt(2, voucher.getDiscountedPercent());
            ps.setDate(3, voucher.getDueDate());
            ps.setDouble(4, voucher.getMaximumDiscount());
            ps.setDouble(5, voucher.getRequired());
            ps.setNString(6, voucher.getDescription());

            if (ps.executeUpdate()>0) {
                return true;
            }

        } catch (Exception ex) {

            ex.printStackTrace();

        }

        return false;
    }

    @Override
    public boolean edit(Voucher voucher) {
        String sql = "UPDATE Voucher\n"
                + " SET Discount = ?, DueDate = ?, Maximum_discount = ?, Required = ?, Description = ?\n"
                + " WHERE VoucherID = ?";

        try {

            Connection conn = DBUtils.getConnection();

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(6, voucher.getVoucherID());
            ps.setInt(1, voucher.getDiscountedPercent());
            ps.setDate(2, voucher.getDueDate());
            ps.setDouble(3, voucher.getMaximumDiscount());
            ps.setDouble(4, voucher.getRequired());
            ps.setNString(5, voucher.getDescription());

             if (ps.executeUpdate()>0) {
                return true;
            }

        } catch (Exception ex) {

            ex.printStackTrace();

        }

        return false;
    }

}
