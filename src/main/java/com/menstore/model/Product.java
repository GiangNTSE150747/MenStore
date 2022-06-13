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
public class Product {
    private String productId;
    private String productName;
    private String status;
    private String size;
    private float discount;
    private int price;
    private int quantity;
    private String categoryId;
    private String linkImage;

    public Product() {
    }

    public Product(String productId, String productName, String status, String size, float discount, int price, int quantity, String categoryId, String linkImage) {
        this.productId = productId;
        this.productName = productName;
        this.status = status;
        this.size = size;
        this.discount = discount;
        this.price = price;
        this.quantity = quantity;
        this.categoryId = categoryId;
        this.linkImage = linkImage;
    }

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String Status) {
        this.status = Status;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public float getDiscount() {
        return discount;
    }

    public void setDiscount(float discount) {
        this.discount = discount;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(String categoryId) {
        this.categoryId = categoryId;
    }

    public String getLinkImage() {
        return linkImage;
    }

    public void setLinkImage(String linkImage) {
        this.linkImage = linkImage;
    }

    @Override
    public String toString() {
        return "Product{" + "productId=" + productId + ", productName=" + productName + ", status=" + status + ", size=" + size + ", discount=" + discount + ", price=" + price + ", quantity=" + quantity + ", categoryId=" + categoryId + ", linkImage=" + linkImage + '}';
    }
    
    
}
