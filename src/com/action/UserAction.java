package com.action;

import com.opensymphony.xwork2.ModelDriven;
import entity.User;

public class UserAction implements ModelDriven {
    private User user;

    @Override
    public Object getModel() {
        if (user == null){
            user = new User();
        }
        return user;
    }

//    public String add(){
//        new UserManager().addUser(user);
//        return "success";
//    }

    public User getUser(){
        return user;
    }

    public void setUser(User user){
        this.user = user;
    }
}
