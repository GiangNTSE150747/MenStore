/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.menstore.DAO;

import com.menstore.model.Order;
import java.util.List;

/**
 *
 * @author MyPC
 */
public interface IOrderDAO {
    
    int getNoOfRecords();
    
    List<Order> list();
    
    List<Order> list(int start, int recordsPerPage);
    
    List<Order> list(int start, int recordsPerPage, String direction, String by);
    
    boolean save(Order order);
    
    boolean delete(String orderId);
    
    boolean add(Order product);
    
    boolean updateStatus(String id, String status);
    
    List<Order> search(String id);
            
}
