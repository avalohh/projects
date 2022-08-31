package com.mvc.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.bean.LoginBean;
import com.mvc.bean.PurchaseBean;
import com.mvc.dao.PurchaseDao;

/**
 * Servlet implementation class AdminViewOrderServlet
 */
@WebServlet("/AdminViewOrderServlet")
public class AdminViewOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PurchaseDao purchase = new PurchaseDao();
		List<PurchaseBean> list = purchase.viewPurchaseOrder();
		
		request.setAttribute("order", list);
		RequestDispatcher rd = request.getRequestDispatcher("AdminViewOrder.jsp");
		rd.forward(request, response);
	}
}
