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

import com.mvc.bean.BookBean;
import com.mvc.bean.LoginBean;
import com.mvc.bean.PurchaseBean;
import com.mvc.dao.BookDao;
import com.mvc.dao.PurchaseDao;

/**
 * Servlet implementation class CustomerTransactionServlet
 */
@WebServlet("/CustomerTransactionServlet")
public class CustomerTransactionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ServletContext servletcontext = getServletContext();
		String userid = (String) servletcontext.getAttribute("userid");
		String pwd = (String) servletcontext.getAttribute("pwd");
		
		LoginBean loginBean = new LoginBean();
		loginBean.setUsername(userid);
		loginBean.setPassword(pwd);
		
		PurchaseDao purchase = new PurchaseDao();
		List<PurchaseBean> list = purchase.viewHistory(loginBean);
		
		request.setAttribute("history", list);
		RequestDispatcher rd = request.getRequestDispatcher("CustomerViewHistory.jsp");
		rd.forward(request, response);
	}

}
