package com.bang.hoo.domain;

public class User {
	private int userid;
	private String username;
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	@Override
	public String toString() {
		return "User [userid=" + userid + ", username=" + username + "]";
	}
	

}
