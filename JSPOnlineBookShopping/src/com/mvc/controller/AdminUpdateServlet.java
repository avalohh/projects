package com.mvc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.bean.BookBean;
import com.mvc.dao.BookDao;

/**
 * Servlet implementation class AdminUpdateServlet
 */
@WebServlet("/AdminUpdateServlet")
public class AdminUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BookDao bookDao = new BookDao();
		List<BookBean> list = bookDao.viewBook();
		
		request.setAttribute("list", list);
		RequestDispatcher rd = request.getRequestDispatcher("AdminUpdateBook.jsp");
		rd.forward(request, response);
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		
		String name = request.getParameter("selectname");
		String update = request.getParameter("update");
		String value = request.getParameter("value");
		
		BookBean bookBean = new BookBean();
		bookBean.setName(name);
		int updateCount = 0;
		
		if(update.equalsIgnoreCase("price"))
		{
			float price = Float.parseFloat(value);
			bookBean.setPrice(price);
			BookDao bookDao = new BookDao();
			updateCount = bookDao.updateBook("price",bookBean);
		}
		else if (update.equals("stock"))
		{
			int stock = Integer.parseInt(request.getParameter("stockSelect"));
			bookBean.setStock(stock);
			BookDao bookDao = new BookDao();
			updateCount = bookDao.updateBook("stock",bookBean);
		}
		
		
		if (updateCount > 0)
		{
			request.setAttribute("msg", "update");  
		} else {
			request.setAttribute("msg", "failupdate");  
		}
		this.doGet(request, response);
	}

}
