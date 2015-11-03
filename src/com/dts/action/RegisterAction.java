package com.dts.action;


import java.sql.Connection;

import com.dts.dao.UserDao;
import com.dts.model.User;
import com.dts.util.DbUtil;
import com.dts.util.StringUtil;
import com.opensymphony.xwork2.ActionSupport;


public class RegisterAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String userName;
	private String password;
	private String error;
	
	public String getError() {
		return error;
	}
	public void setError(String error) {
		this.error = error;
	}
	
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
	DbUtil dbUtil=new DbUtil();
	UserDao userDao=new UserDao();
	@Override
	public String execute() throws Exception {
		Connection con=null;
		con=dbUtil.getCon();
		if(StringUtil.isEmpty(userName)||StringUtil.isEmpty(password)){
			error="用户名或密码不能为空";
			return ERROR;
		}else {
			User user=new User(userName,password);
			userDao.register(con, user);
			return SUCCESS;
		}

	}
	

}
