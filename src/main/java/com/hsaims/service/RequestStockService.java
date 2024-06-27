package com.hsaims.service;

import java.io.IOException;
import java.util.List;

import com.hsaims.model.RequestStock;
import com.hsaims.repository.RequestStockRepo;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class RequestStockService {
	
	private RequestStockRepo requestRepo;
	private RequestStock reqStock;
	
	public RequestStockService() {
		this.requestRepo = new RequestStockRepo();
		this.reqStock = new RequestStock();
	}
	
	public void createRequest(HttpServletRequest request, HttpServletResponse response) {
		
//		reqStock.setStockId(request.getParameter("stock"));
		
		
	}
	
	public void getAllRecord(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		int page = 1;
		int recordsPerPage = 3;
		int noOfRecords = requestRepo.getNoOfRecords();
//        3   =                             6         /      3        
		int noOfPages = (int) Math.ceil((double) noOfRecords / recordsPerPage);

		if (request.getParameter("page") != null) { 
			try {
				page = Integer.parseInt(request.getParameter("page"));
			} catch (NumberFormatException e) {
				page = 1; 
			}
		}

		if (page <= noOfPages) {
			List<RequestStock> list = requestRepo.getRequestsRecord((page - 1) * recordsPerPage, recordsPerPage);
			request.setAttribute("requestsList", list);
			request.setAttribute("recordsPerPage", recordsPerPage);
			request.setAttribute("noOfPages", noOfPages);
			request.setAttribute("currentPage", page);
			request.getRequestDispatcher("/jsp/request.jsp").forward(request, response);
		} else {
			response.sendError(HttpServletResponse.SC_NOT_FOUND, "Request record has only " + noOfPages + " pages");
		}

	}

}
