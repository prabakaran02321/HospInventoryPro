package com.hsaims.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import com.hsaims.dao.StocksDAO;
import com.hsaims.repository.StocksRepo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class StocksService {
 public void addStocks(HttpServletRequest request, HttpServletResponse response) throws ParseException {
	 StocksDAO stocksDAO = new StocksDAO();
	 
     stocksDAO.setName(request.getParameter("stockName"));
     stocksDAO.setDescription(request.getParameter("description"));
     stocksDAO.setInitialQuantity(Integer.parseInt(request.getParameter("initialQuantity")));
     stocksDAO.setSupplierId(Integer.parseInt(request.getParameter("supplierId")));
     stocksDAO.setExpiryDate(new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("expiryDate")));

     StocksRepo stockRepo = new StocksRepo();
     stockRepo.save(stocksDAO);
 }
}
