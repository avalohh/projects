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
 * Servlet implementation class AdminViewBookServlet
 */
@WebServlet("/AdminViewBookServlet")
public class AdminViewBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		BookDao bookDao = new BookDao();
		List<BookBean> list = bookDao.viewBook();
		
		request.setAttribute("list", list);
		RequestDispatcher rd = request.getRequestDispatcher("AdminViewBook.jsp");
		rd.forward(request, response);
	}

}
