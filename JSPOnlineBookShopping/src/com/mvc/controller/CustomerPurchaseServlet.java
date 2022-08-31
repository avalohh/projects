package com.mvc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.bean.BookBean;
import com.mvc.bean.PurchaseBean;
import com.mvc.dao.BookDao;
import com.mvc.dao.PurchaseDao;

/**
 * Servlet implementation class CustomerPurchaseServlet
 */
@WebServlet("/CustomerPurchaseServlet")
public class CustomerPurchaseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BookDao bookDao = new BookDao();
		List<BookBean> list = bookDao.viewBook();
		
		request.setAttribute("list", list);
		RequestDispatcher rd = request.getRequestDispatcher("CustomerPurchase.jsp");
		rd.forward(request, response);
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
		
		ServletContext servletcontext = getServletContext();
		String userid = (String) servletcontext.getAttribute("userid");
		String pwd = (String) servletcontext.getAttribute("pwd");
		
		String name = request.getParameter("selectname");
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		java.sql.Date orderdate = new java.sql.Date(System.currentTimeMillis()); 
		
		BookBean book = new BookBean();
		book.setName(name);
		PurchaseDao purchaseDao = new PurchaseDao();
		boolean available = purchaseDao.stockAvailable(book, quantity);
		
		if(available == true)
		{
			int bookid = purchaseDao.getBookID(book);
			float price = purchaseDao.getPrice(book);
			float totalprice = price*quantity;
			
			PurchaseBean purchaseBean = new PurchaseBean();
			purchaseBean.setFname(userid);
			purchaseBean.setEmail(pwd);
			purchaseBean.setBookid(bookid);
			purchaseBean.setOrderdate(orderdate);
			purchaseBean.setQuantity(quantity);
			purchaseBean.setTotalprice(totalprice);
			
			PurchaseDao purchase = new PurchaseDao();
	        int purchaseCount = purchase.purchaseBook(purchaseBean);
	        
	        if (purchaseCount > 0)
			{
				request.setAttribute("msg", "purchase");  
			} else {
				request.setAttribute("msg", "fail");  
			}
			this.doGet(request, response);
		}
		else{
			request.setAttribute("msg", "insufficient");
			this.doGet(request, response);
		}
		
	}

}
