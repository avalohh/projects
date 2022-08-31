package com.mvc.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.bean.RegisterBean;
import com.mvc.dao.RegisterDao;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String email = request.getParameter("email");
		int phone = Integer.parseInt(request.getParameter("phone"));
		String gender = request.getParameter("gender");
		
		RegisterBean registerBean = new RegisterBean();
		registerBean.setFname(fname);
		registerBean.setLname(lname);
		registerBean.setEmail(email);
		registerBean.setPhone(phone);
		registerBean.setGender(gender);
		
		RegisterDao registerDao = new RegisterDao();
		int registerCount = registerDao.register(registerBean);
		
		if (registerCount > 0) {
			RequestDispatcher rd = request.getRequestDispatcher("Register.jsp");
			rd.include(request, response);
			out.println("<script type='text/javascript'>");
            out.println("window.onload = function addSuccess(){parent.postMessage('register','http://localhost:8181/JSPOnlineBookShopping/HomePage.jsp');}");
            out.println("</script>");
            
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("Register.jsp");
			rd.include(request, response);
			out.println("<script type='text/javascript'>");
            out.println("window.onload = function addFail(){parent.postMessage('fail','http://localhost:8181/JSPOnlineBookShopping/HomePage.jsp');}");
            out.println("</script>");
		}
		
	}

}
