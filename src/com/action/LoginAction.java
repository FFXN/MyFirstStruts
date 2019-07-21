package com.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport {
    private String userName;
    private String password;

    private String msg;//结果消息属性

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    //重写处理用户请求的excute()方法

    @Override
    public String execute() throws Exception {
        if ("root".equals(this.userName) && "root".equals(this.password)){
            msg = "登录成功，" + this.userName + " " + this.password;

            //获取ActionContext实例，通过它来访问Servlet API
            ActionContext context = ActionContext.getContext();
            //看session（范围是浏览器）中是否已经存放了用户名，如果存在说明已经登录，
            // 否则是第一次登录成功。
            if (null != context.getSession().get("uName")){
                msg = this.userName + "你已经登录过了。";
            }else {
                context.getSession().put("uName", this.userName);
            }
            return SUCCESS;
        }else {
            msg = "登录失败。";
            return ERROR;
        }
    }
}
