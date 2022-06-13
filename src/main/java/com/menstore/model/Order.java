/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.menstore.model;

import java.sql.Date;

/**
 *
 * @author MyPC
 */
public class Order {
    private String orderId;
    private double discountedMoney;
    private Date orderDate;
    private double total;
    private String note;
    private String status;
    private String userId;
    private String voucherId;

    public Order() {
    }

    public Order(String invoiceID, double discountedMoney, Date orderDate, double total, String note, String status, String userId, String voucherId) {
        this.orderId = invoiceID;
        this.discountedMoney = discountedMoney;
        this.orderDate = orderDate;
        this.total = total;
        this.note = note;
        this.status = status;
        this.userId = userId;
        this.voucherId = voucherId;
    }

    public String getOrderId() {
        return orderId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public double getDiscountedMoney() {
        return discountedMoney;
    }

    public void setDiscountedMoney(double discountedMoney) {
        this.discountedMoney = discountedMoney;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getVoucherId() {
        return voucherId;
    }

    public void setVoucherId(String voucherId) {
        this.voucherId = voucherId;
    }
    
}
