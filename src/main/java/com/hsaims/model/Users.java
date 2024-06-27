package com.hsaims.model;

import java.sql.Timestamp;

public class Users {

	 private int id;
	    private String username;
	    private String password;
	    private String role;
	    private int departmentId;
	    private int roleId;
	    private Timestamp createdAt;
	    private Timestamp updatedAt;

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

	    public String getPassword() {
	        return password;
	    }

	    public void setPassword(String password) {
	        this.password = password;
	    }

	    public String getRole() {
	        return role;
	    }

	    public void setRole(String role) {
	        this.role = role;
	    }

	    public int getDepartmentId() {
	        return departmentId;
	    }

	    public void setDepartmentId(int departmentId) {
	        this.departmentId = departmentId;
	    }

	    public int getRoleId() {
	        return roleId;
	    }

	    public void setRoleId(int roleId) {
	        this.roleId = roleId;
	    }

	    public Timestamp getCreatedAt() {
	        return createdAt;
	    }

	    public void setCreatedAt(Timestamp createdAt) {
	        this.createdAt = createdAt;
	    }

	    public Timestamp getUpdatedAt() {
	        return updatedAt;
	    }

	    public void setUpdatedAt(Timestamp updatedAt) {
	        this.updatedAt = updatedAt;
	    }

}
