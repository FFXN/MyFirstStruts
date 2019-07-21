package com.action;

import com.opensymphony.xwork2.ActionSupport;

public class HelloAction extends ActionSupport {
    private static final long serialVersionUID = 1L;
    private String hello;

    public String getHelo() {
        return hello;
    }

    public void setHelo(String helo) {
        this.hello = helo;
    }

    //重载execute方法

    @Override
    public String execute() throws Exception {
        hello = "hello,the first!";
        return SUCCESS;
    }
}
