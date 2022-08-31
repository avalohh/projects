package com.mvc.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.bean.LoginBean;
import com.mvc.dao.LoginDao;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		
		String username = request.getParameter("userid");
		String password = request.getParameter("password");
		
		LoginBean loginBean = new LoginBean();
		loginBean.setUsername(username);
		loginBean.setPassword(password);
		
		LoginDao loginDao = new LoginDao();
		
		if(username.equals("admin"))
		{
			boolean success = loginDao.authenticateAdmin(loginBean);
			if(success == true)
			{
				ServletContext servletcontext = getServletContext();
				servletcontext.setAttribute("userid", username);
				servletcontext.setAttribute("pwd", password);
				response.sendRedirect("AdminPortal.jsp");
			}
			else
			{
				RequestDispatcher rd = request.getRequestDispatcher("LoginPage.jsp");
				rd.include(request, response);
				out.println("<h2 style='padding-top:150px'><center><font color='red'>Login Failed..</font></center></h2>");
			}
		}
		else
		{
			boolean success = loginDao.authenticateUser(loginBean);
			if(success == true)
			{
				ServletContext servletcontext = getServletContext();
				servletcontext.setAttribute("userid", username);
				servletcontext.setAttribute("pwd", password);
				response.sendRedirect("CustPortal.jsp");
			}
			else
			{
				RequestDispatcher rd = request.getRequestDispatcher("LoginPage.jsp");
				rd.include(request, response);
				out.println("<h2 style='padding-top:150px'><center><font color='red'>Login Failed..</font></center></h2>");
			}
		}
	}

}
