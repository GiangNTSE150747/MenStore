
package com.menstore.model;

public class User{
    private String userId;
    private String name;
    private String phoneNumber;
    private String address;
    private String username;
    private String password;
    private String role;
    private int point;

    public User() {
    }

    public User(String userId, String name, String phoneNumber, String address, String username, String password, String role, int point) {
        this.userId = userId;
        this.name = name;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.username = username;
        this.password = password;
        this.role = role;
        this.point = point;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public int getPoint() {
        return point;
    }

    public void setPoint(int point) {
        this.point = point;
    }

    @Override
    public String toString() {
        return "User{" + "userId=" + userId + ", name=" + name + ", phoneNumber=" + phoneNumber + ", address=" + address + ", username=" + username + ", password=" + password + ", role=" + role + ", point=" + point + '}';
    }
    
    
}
