package com.mvc.controller;

import java.io.IOException;
import java.util.ArrayList;
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
 * Servlet implementation class CustomerViewSortServlet
 */
@WebServlet("/CustomerViewSortServlet")
public class CustomerViewSortServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BookDao bookDao = new BookDao();
		String sort = request.getParameter("order");
		List<BookBean> list = new ArrayList<BookBean>();
		
		if(sort.equals("name"))
			list = bookDao.viewByName();
		else if(sort.equals("price"))
			list = bookDao.viewByPrice();

		request.setAttribute("list", list);
		RequestDispatcher rd = request.getRequestDispatcher("CustomerViewBook.jsp");
		rd.forward(request, response);
	}

}
