package com.hsaims.controller;

import java.io.IOException;

import com.hsaims.service.RequestStockService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "RequestStockServlet", urlPatterns = "/api/request")
public class RequestStockServlet extends HttpServlet{
   
	private static final long serialVersionUID = 1L;
	
	private RequestStockService requestSer;

	@Override
	public void init() throws ServletException {
		this.requestSer = new RequestStockService();
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		requestSer.getAllRecord(req, resp);
	}
	
}
