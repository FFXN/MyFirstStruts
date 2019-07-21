package com.action;

import com.opensymphony.xwork2.ActionSupport;
import entity.User;

import java.util.List;

public class TypeConvAction extends ActionSupport {
    private List<User> users;

    public List<User> getUsers(){
        return users;
    }

    public void setUsers(List<User> users){
        this.users = users;
    }

    @Override
    public String execute() throws Exception {
        for (User user : users){
            System.out.println(user.getUserName());
        }
        return SUCCESS;
    }
}

