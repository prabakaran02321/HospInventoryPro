package com.hsaims.repository;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.hsaims.model.RequestStock;
import com.hsaims.utils.DbConnection;

public class RequestStockRepo {
	
	private DbConnection db;
	
	public RequestStockRepo() {
		this.db = new DbConnection();
	}
	
	public int getNoOfRecords() {
		return db.getNoOfRecords("requests", "request_id");
	}

	public List<RequestStock> getRequestsRecord(int start, int total) {
	    List<RequestStock> list = new ArrayList<>();
	    try {
	        ResultSet rs = db.selectStarFromTablePagination("requests", start, total);
	        while (rs.next()) {
	            RequestStock request = new RequestStock();
	            request.setRequestId(rs.getInt("request_id"));
	            request.setStockId(rs.getInt("stock_id"));
	            request.setQuantity(rs.getInt("quantity"));
	            request.setRequestedBy(rs.getInt("requested_by"));
	            request.setDepartmentId(rs.getInt("department_id"));
	            request.setStatus(rs.getString("status"));
	            request.setCreatedAt(rs.getString("created_at"));
	            request.setUpdatedAt(rs.getString("updated_at"));
	            list.add(request);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return list;
	}

	public ResultSet getStockItems() {
	    try {
	    	ArrayList<String> al = new ArrayList<>();
	    	al.add("stock_id");
	    	al.add("name");
	       return db.selectColumnsFromTable("stocks", al);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return null;
	}
	
	public ResultSet getDepartments() {
	    try {
	    	ArrayList<String> al = new ArrayList<>();
	    	al.add("name");
	       return db.selectColumnsFromTable("departments", al);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return null;
	}
	
	public ResultSet save() {
	    try {
	    	ArrayList<String> al = new ArrayList<>();
	    	al.add("name");
	       return db.selectColumnsFromTable("departments", al);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return null;
	}
	
}
