
package com.menstore.model;

public class CartItem {
    private Product product;
    private double soldPrice;
    private int quantity;
    private double totalCost;

    public CartItem() {
    }

    public CartItem(Product product, double soldPrice, int quantity, double totalCost) {
        this.product = product;
        this.soldPrice = soldPrice;
        this.quantity = quantity;
        this.totalCost = totalCost;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
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
        calculatTotalCost();
    }

    public double getTotalCost() {
        return totalCost;
    }

    public void setTotalCost(double totalCost) {
        this.totalCost = totalCost;
    }
    
    protected void calculatSoldPrice(){
        setSoldPrice(product.getPrice()-(product.getPrice()*product.getDiscount()/100));
    }

    protected void calculatTotalCost(){
        calculatSoldPrice();
        setTotalCost(quantity*soldPrice);
    }
    
}
