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
public class Voucher {
    private String voucherID;
    private int discountedPercent;
    private Date dueDate;
    private double maximumDiscount;
    private double required;
    private String description;

    public Voucher() {
    }

    public Voucher(String voucherID, int discountedPercent, Date dueDate, double maximumDiscount, double required, String description) {
        this.voucherID = voucherID;
        this.discountedPercent = discountedPercent;
        this.dueDate = dueDate;
        this.maximumDiscount = maximumDiscount;
        this.required = required;
        this.description = description;
    }

    public String getVoucherID() {
        return voucherID;
    }

    public void setVoucherID(String voucherID) {
        this.voucherID = voucherID;
    }

    public int getDiscountedPercent() {
        return discountedPercent;
    }

    public void setDiscountedPercent(int discountedPercent) {
        this.discountedPercent = discountedPercent;
    }

    public Date getDueDate() {
        return dueDate;
    }

    public void setDueDate(Date dueDate) {
        this.dueDate = dueDate;
    }

    public double getMaximumDiscount() {
        return maximumDiscount;
    }

    public void setMaximumDiscount(double maximumDiscount) {
        this.maximumDiscount = maximumDiscount;
    }

    public double getRequired() {
        return required;
    }

    public void setRequired(double required) {
        this.required = required;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "Voucher{" + "voucherID=" + voucherID + ", discountedPercent=" + discountedPercent + ", dueDate=" + dueDate + ", maximumDiscount=" + maximumDiscount + ", required=" + required + ", description=" + description + '}';
    }
    
}
