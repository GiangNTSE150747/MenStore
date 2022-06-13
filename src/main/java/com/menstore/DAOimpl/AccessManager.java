package com.menstore.DAOimpl;

import com.menstore.model.User;
import com.menstore.model.UserSession;
import com.menstore.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;

public class AccessManager {

    public UserSession login(String username, String password) {
        UserSession userSession =  new UserSession();

        String sql = "select * from Users "
                + "Where UserName like ? AND Password like ?";

        try {

            Connection conn = DBUtils.getConnection();

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                String userId = rs.getString("UserID");
                String name = rs.getString("NameOfUser");
                String phoneNumber = rs.getString("PhoneNumber");
                String address = rs.getString("Address");
                String usernamedb = rs.getString("UserName");
                String passworddb = rs.getString("Password");
                String role = rs.getString("Role");
                int point = rs.getInt("Point");
                User user = new User(userId, name, phoneNumber, address, usernamedb, passworddb, role, point);
                Date date = new Date();

                userSession.setUser(user);
                userSession.setDate(date);
            }

            ps.close();
            conn.close();

            return userSession;
        } catch (Exception ex) {

            ex.printStackTrace();

        }

        return null;
    }

}
