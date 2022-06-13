/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.menstore.DAOimpl;

import java.util.List;
import com.menstore.DAO.IOrderDetailDAO;
import com.menstore.model.OrderDetail;
import com.menstore.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author MyPC
 */
public class OrderDetailDAO implements IOrderDetailDAO {
    
    @Override
    public int getNoOfRecords() {

        String sql = "SELECT COUNT(InvoiceID) as noOfRecords FROM OrderDetail";

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
    public ArrayList<OrderDetail> list() {
         ArrayList<OrderDetail> list;
        list = new ArrayList<OrderDetail>();

        String sql = "select * from OrderDetail ";

        try {

            Connection conn = DBUtils.getConnection();

            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                OrderDetail orderDetail = new OrderDetail();
                orderDetail.setInvoiceId(rs.getString("InvoiceID"));
                orderDetail.setProductId(rs.getString("ProductID"));
                orderDetail.setSoldPrice(rs.getDouble("SoldPrice"));
                orderDetail.setQuantity(rs.getInt("Quantity"));
                list.add(orderDetail);
            }

        } catch (Exception ex) {

            ex.printStackTrace();

        }
        return list;
    }

    @Override
    public List<OrderDetail> list(String OrderId) {
         ArrayList<OrderDetail> list;
        list = new ArrayList<OrderDetail>();

        String sql = "select * from OrderDetail "
                + " Where InvoiceID like ?";

        try {

            Connection conn = DBUtils.getConnection();

            PreparedStatement ps = conn.prepareStatement(sql);
            
            ps.setString(1, OrderId);
            
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                OrderDetail orderDetail = new OrderDetail();
                orderDetail.setInvoiceId(rs.getString("InvoiceID"));
                orderDetail.setProductId(rs.getString("ProductID"));
                orderDetail.setSoldPrice(rs.getDouble("SoldPrice"));
                orderDetail.setQuantity(rs.getInt("Quantity"));
                list.add(orderDetail);
            }

        } catch (Exception ex) {

            ex.printStackTrace();

        }
        return list;
    }
    
    public List<OrderDetail> list(int start, int recordsPerPage) {
        ArrayList<OrderDetail> list;
        list = new ArrayList<OrderDetail>();

        String sql = "select * from OrderDetail"
                + " ORDER BY InvoiceID\n"
                + " OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        try {

            Connection conn = DBUtils.getConnection();

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, start);
            ps.setInt(2, recordsPerPage);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                OrderDetail orderDetail = new OrderDetail();
                orderDetail.setInvoiceId(rs.getString("InvoiceID"));
                orderDetail.setProductId(rs.getString("ProductID"));
                orderDetail.setSoldPrice(rs.getDouble("SoldPrice"));
                orderDetail.setQuantity(rs.getInt("Quantity"));
                list.add(orderDetail);
            }

        } catch (Exception ex) {

            ex.printStackTrace();

        }

        return list;
    }

    @Override
    public boolean save(OrderDetail orderDetail) {
        String sql = "INSERT INTO OrderDetail \n"
                + " VALUES(?,?,?,?)";

        try {

            Connection conn = DBUtils.getConnection();

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, orderDetail.getInvoiceId());
            ps.setString(2, orderDetail.getProductId());
            ps.setDouble(3, orderDetail.getSoldPrice());
            ps.setInt(4, orderDetail.getQuantity());

            return ps.execute();

        } catch (Exception ex) {

            ex.printStackTrace();

        }

        return false;
    }

}
