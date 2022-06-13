/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.menstore.DAOimpl;

import com.menstore.DAO.IUserDAO;
import com.menstore.model.User;
import com.menstore.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author MyPC
 */
public class UserDAO implements IUserDAO {

    @Override
    public int getNoOfRecords() {

        String sql = "SELECT COUNT(UserID) as noOfRecords FROM Users";

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
    
    public User find(String id) {
        String sql = "Select * from Users Where UserID like ?";

        try {

            Connection conn = DBUtils.getConnection();

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, id);
            
            ResultSet rs = ps.executeQuery();
            User user = new User();
            while(rs.next()){
                user.setUserId(rs.getString("UserID"));
                user.setName(rs.getNString("NameOfUser"));
                user.setPhoneNumber(rs.getString("PhoneNumber"));
                user.setAddress(rs.getNString("Address"));
            }
            
            return user;

        } catch (Exception ex) {

            ex.printStackTrace();

        }

        return null;
    }

    @Override
    public boolean save(User user) {
        String sql = "INSERT INTO Users \n"
                + " VALUES(?,?,?,?,?,?,?,?)";

        try {

            Connection conn = DBUtils.getConnection();

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, user.getUserId());
            ps.setNString(2, user.getName());
            ps.setNString(3, user.getUsername());
            ps.setString(4, user.getPassword());
            ps.setString(5, user.getRole());
            ps.setInt(6, user.getPoint());
            ps.setString(7, user.getAddress());
            ps.setString(8, user.getPhoneNumber());

            if (ps.executeUpdate() > 0) {
                return true;
            }

        } catch (Exception ex) {

            ex.printStackTrace();

        }

        return false;
    }

    @Override
    public boolean saveWalkInGuest(String id, String name, String phone, String address) {
        String sql = "INSERT INTO Users \n"
                + " VALUES(?,?,null,null,'clone',0,?,?)";

        try {

            Connection conn = DBUtils.getConnection();

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, id);
            ps.setNString(2, name);
            ps.setNString(3, address);
            ps.setString(4, phone);

            if (ps.executeUpdate() > 0) {
                return true;
            }

        } catch (Exception ex) {

            ex.printStackTrace();

        }

        return false;

    }

    @Override
    public boolean checkExist(String username) {
        String sql = "SELECT * FROM Users "
                + " WHERE UserName like ?";

        try {

            Connection conn = DBUtils.getConnection();

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, username);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                return true;
            }

        } catch (Exception ex) {

            ex.printStackTrace();

        }
        return false;
    }

    @Override
    public boolean resetPoint(String id) {
        String sql = "UPDATE Users "
                + " SET Point = 0 "
                + " WHERE UserID like ? ";

        try {

            Connection conn = DBUtils.getConnection();

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, id);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                return true;
            }

        } catch (Exception ex) {

            ex.printStackTrace();

        }
        return false;
    }

    @Override
    public boolean checkPassword(User user, String password) {
        String sql = "Select password from Users where UserName like ?";

        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, user.getUsername());
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                if (password.equals(rs.getString("password"))) {
                    return true;
                } else {
                    return false;
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;
    }

    @Override
    public int changePassword(User user, String oldPassword, String newPassword) {
        String sql = "Update Users set password=? where username like ?";

        if (checkPassword(user, oldPassword)) {
            try {
                Connection conn = DBUtils.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);
                ps.setString(1, newPassword);
                ps.setString(2, user.getUsername());
                return (ps.executeUpdate());
            } catch (Exception ex) {
                ex.printStackTrace();
            }
            return -2; //fail
        }
        return -1;      //wrong pass
    }

    @Override
    public boolean updateInformation(User user) {
        if (user == null) {
            return false;
        }
        String sql = "Update Users set NameOfUser=? , PhoneNumber=? ,Address=? where userID like ?";

        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, user.getName());
            ps.setString(2, user.getPhoneNumber());
            ps.setString(3, user.getAddress());
            ps.setString(4, user.getUserId());
            return(ps.executeUpdate()>0);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean updatePoint(String userID, int point) {
         String sql = "UPDATE Users "
                + " SET Point = ? "
                + " WHERE UserID like ? ";

        try {

            Connection conn = DBUtils.getConnection();

            PreparedStatement ps = conn.prepareStatement(sql);
            
            ps.setInt(1, point);
            ps.setString(2, userID);


            if (ps.executeUpdate() > 0) {
                return true;
            }

        } catch (Exception ex) {

            ex.printStackTrace();

        }
        return false;
    }

}
