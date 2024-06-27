package com.hsaims.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;

import com.hsaims.model.Users;
import com.hsaims.utils.DataValidation;
import com.hsaims.utils.DbConnection;

public class UsersRepo {

	private DbConnection db;

	public UsersRepo() {
		this.db = new DbConnection();
	}

	public Users findByUsername(String username) {
		ResultSet rs = db.selectStarFromTableWithWhere("users", "username ='" + username + "'");
		try {
			if (rs.next()) {
				Users user = new Users();
				user.setId(rs.getInt("user_id"));
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				user.setRole(rs.getString("role"));
				user.setDepartmentId(rs.getInt("department_id"));
				user.setRoleId(rs.getInt("role_id"));
				user.setCreatedAt(rs.getTimestamp("created_at"));
				user.setUpdatedAt(rs.getTimestamp("updated_at"));
				return user;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public String getUserRole(String username) {
		ResultSet rs = db
				.selectQuery("SELECT r.role_name FROM users u JOIN roles r ON u.role_id = r.role_id WHERE u.username ='"
						+ username + "'");
		try {
			if (rs.next()) {
				return rs.getString("role_name");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public int getUserId(String username, String password) {
		ResultSet rs = db.selectQuery(
				"SELECT user_id FROM users WHERE username ='" + username + "' AND password='" + password + "'");
		try {
			if (rs.next()) {
				return rs.getInt("user_id");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	public String getRoleName(int roleId) {
		ResultSet rs = db.selectQuery("SELECT role_name FROM roles WHERE role_id='" + roleId + "'");
		try {
			if (rs.next()) {
				return rs.getString("role_name");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public boolean authValid(int roleId, String urlPath, String httpMethod) {
		ResultSet rs = db.selectQuery("SELECT role_permission_id FROM role_permissions WHERE role_id='" + roleId
				+ "' AND url='" + urlPath + "' AND method='" + httpMethod + "'");
		try {
			if (rs.next()) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	public boolean validateUsername(String username) {
		boolean isValid = false;

		ArrayList<String> al = new ArrayList<>();
		al.add("user_id");

		ResultSet resultSet = db.selectColumnsFromTableWithWhere("users", al, "username ='" + username + "'");
		try {
			if (resultSet.next() && resultSet.getInt(1) > 0) {
				isValid = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return isValid;
	}

	public int save(Users user) {
		Map<String, Object> map = new LinkedHashMap<>();

		if (DataValidation.isValidUsername(user.getUsername())) {
			map.put("username", user.getUsername());
		} else {
			throw new RuntimeException("Username should contain both letters and numbers but minimum 5 characters");
		}

		if (DataValidation.isValidPassword(user.getPassword())) {
			map.put("password", user.getPassword());
		} else {
			throw new RuntimeException("Password is weak!!!");
		}

		map.put("role", user.getRole());
		map.put("role_id", user.getRoleId());
		map.put("department_id", user.getDepartmentId());

		return db.insertDataIntoTable("users", map);
	}
}
