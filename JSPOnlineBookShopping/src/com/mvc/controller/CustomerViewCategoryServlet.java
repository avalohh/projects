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
 * Servlet implementation class CustomerViewCategoryServlet
 */
@WebServlet("/CustomerViewCategoryServlet")
public class CustomerViewCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BookDao bookDao = new BookDao();
		String cat = request.getParameter("cat");
		List<BookBean> list = bookDao.viewByCategory(cat);

		request.setAttribute("list", list);
		RequestDispatcher rd = request.getRequestDispatcher("CustomerViewCategory.jsp");
		rd.forward(request, response);
	}

}
