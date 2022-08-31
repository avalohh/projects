package com.mvc.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.bean.FeedbackBean;
import com.mvc.bean.RegisterBean;
import com.mvc.dao.FeedbackDao;
import com.mvc.dao.RegisterDao;

/**
 * Servlet implementation class FeedbackServlet
 */
@WebServlet("/FeedbackServlet")
public class FeedbackServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		int phone = Integer.parseInt(request.getParameter("phone"));
		String feedback = request.getParameter("feedback");
		
		FeedbackBean feedbackBean = new FeedbackBean();
		feedbackBean.setName(name);
		feedbackBean.setEmail(email);
		feedbackBean.setPhone(phone);
		feedbackBean.setFeedback(feedback);
		
		FeedbackDao feedbackDao = new FeedbackDao();
		int feedbackCount = feedbackDao.feedback(feedbackBean);
		
		if (feedbackCount > 0) {
			RequestDispatcher rd = request.getRequestDispatcher("ContactUs.jsp");
			rd.include(request, response);
			out.println("<script type='text/javascript'>");
            out.println("window.onload = function addSuccess(){parent.postMessage('feedback','http://localhost:8181/JSPOnlineBookShopping/HomePage.jsp');}");
            out.println("</script>");
            
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("ContactUs.jsp");
			rd.include(request, response);
			out.println("<script type='text/javascript'>");
            out.println("window.onload = function addFail(){parent.postMessage('feedbackfail','http://localhost:8181/JSPOnlineBookShopping/HomePage.jsp');}");
            out.println("</script>");
		}
	}

}
