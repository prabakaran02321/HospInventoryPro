package com.hsaims.repository;

import java.util.HashMap;
import java.util.Map;

import com.hsaims.dao.StocksDAO;
import com.hsaims.utils.DbConnection;

public class StocksRepo {
	 DbConnection con;
	 String tbName = "stocks";
 public void save(StocksDAO stocksDAO) {
	 
	  Map<String, Object> dataMap = new HashMap<>();
      dataMap.put("name", stocksDAO.getName());
      dataMap.put("description", stocksDAO.getDescription());
      dataMap.put("initial_quantity", stocksDAO.getInitialQuantity());
      dataMap.put("supplier_id", stocksDAO.getSupplierId());
      dataMap.put("expiry_date", new java.sql.Date(stocksDAO.getExpiryDate().getTime()));
      dataMap.put("created_at", new java.sql.Timestamp(System.currentTimeMillis()));
      dataMap.put("updated_at", new java.sql.Timestamp(System.currentTimeMillis()));

     con.insertDataIntoTable(tbName, dataMap);
     
     
	 
 }

}
