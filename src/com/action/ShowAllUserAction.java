package com.action;

import com.opensymphony.xwork2.ActionSupport;
import dao.UserDao;
import entity.User;

import java.util.List;

public class ShowAllUserAction extends ActionSupport {
    private List<User> users;

    public List<User> getUsers() {
        return users;
    }

    public void setUsers(List<User> users) {
        this.users = users;
    }

    @Override
    public String execute() throws Exception {
        setUsers(UserDao.selectAll());
        System.out.println("###" + users.get(0).getUserName());
        return SUCCESS;
    }
}
