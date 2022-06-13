/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.menstore.model;

/**
 *
 * @author MyPC
 */
public class OrderDetail {
    private String invoiceId;
    private String productId;
    private double soldPrice;
    private int quantity;

    public OrderDetail() {
    }

    public OrderDetail(String invoiceId, String productId, double soldPrice, int quantity) {
        this.invoiceId = invoiceId;
        this.productId = productId;
        this.soldPrice = soldPrice;
        this.quantity = quantity;
    }

    public String getInvoiceId() {
        return invoiceId;
    }

    public void setInvoiceId(String invoiceId) {
        this.invoiceId = invoiceId;
    }

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public double getSoldPrice() {
        return soldPrice;
    }

    public void setSoldPrice(double soldPrice) {
        this.soldPrice = soldPrice;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
    
}
