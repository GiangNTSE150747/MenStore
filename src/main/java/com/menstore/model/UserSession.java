
package com.menstore.model;

import java.util.Date;

/**
 *
 * @author DUNGHUYNH
 */
public class UserSession {

    private User user;
    private Date date;

    public UserSession() {
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }


}