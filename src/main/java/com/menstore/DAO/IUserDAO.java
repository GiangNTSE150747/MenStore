/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.menstore.DAO;

import com.menstore.model.User;

/**
 *
 * @author MyPC
 */
public interface IUserDAO {
    int getNoOfRecords();
    
    boolean save(User user);
    
    boolean resetPoint(String userId);
    
    boolean checkExist(String username);
    
    boolean saveWalkInGuest(String id, String name, String phone, String address);
    
    boolean checkPassword(User user, String password);
    
    int changePassword(User user, String oldPassword, String newPassword);
    
    boolean updateInformation(User user);
    
    boolean updatePoint(String userId, int point);
}
