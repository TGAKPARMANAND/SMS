package com.management.controller;

public class loginmodel {

	public String username;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String password;
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Override
	public String toString() {
		return "loginmodel [username=" + username + ", password=" + password + "]";
	}
	
	
	
	
}
