
package com.tech.blog.entities;


public class User {
    private int id;
    private String username;
    private String phone;
    private String email;
    private String password;
    private String profile;
    private String cover;

    public User(int id, String username, String phone, String email, String password) {
        this.id = id;
        this.username = username;
        this.phone = phone;
        this.email = email;
        this.password = password;
    }

    public User() {
    }

    public User(String username, String phone, String email, String password) {
        this.username = username;
        this.phone = phone;
        this.email = email;
        this.password = password;
    }
    
    public User(String username, String phone, String email, String password, String profile, String cover) {
        this.username = username;
        this.phone = phone;
        this.email = email;
        this.password = password;
        this.profile = profile;
        this.cover = cover;
    }
    
    public User(int id, String username, String phone, String email, String password, String profile, String cover) {
        this.id = id;
        this.username = username;
        this.phone = phone;
        this.email = email;
        this.password = password;
        this.profile = profile;
        this.cover = cover;
    }
    
    //GETERS AND SETTERS

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getProfile() {
        return profile;
    }

    public void setProfile(String profile) {
        this.profile = profile;
    }

    public String getCover() {
        return cover;
    }

    public void setCover(String cover) {
        this.cover = cover;
    }
    
}
