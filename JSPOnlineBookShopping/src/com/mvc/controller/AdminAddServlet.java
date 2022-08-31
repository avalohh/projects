package com.mvc.controller;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.mvc.bean.BookBean;
import com.mvc.dao.BookDao;

@WebServlet("/AdminAddServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)

public class AdminAddServlet extends HttpServlet {

    public static final String UPLOAD_DIR = "images";
    public String dbFileName = "";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String name = request.getParameter("name");
        String author = request.getParameter("author");
        String category = request.getParameter("category");
        int stock = Integer.parseInt(request.getParameter("stock"));
        float price = Float.parseFloat(request.getParameter("price"));
  
        Part part = request.getPart("file");//
        String fileName = extractFileName(part);//file name
        
        /**
         * *** Get The Absolute Path Of The Web Application ****
         */
        String applicationPath = getServletContext().getRealPath("");
        String uploadPath = applicationPath + File.separator + UPLOAD_DIR;
        System.out.println("applicationPath:" + applicationPath);
        File fileUploadDirectory = new File(uploadPath);
        if (!fileUploadDirectory.exists()) {
            fileUploadDirectory.mkdirs();
        }
        String savePath = uploadPath + File.separator + fileName;
        System.out.println("savePath: " + savePath);
        part.write(savePath + File.separator);

        dbFileName = UPLOAD_DIR + File.separator + fileName;
        part.write(savePath + File.separator);
        
        BookBean bookBean = new BookBean();
        bookBean.setName(name);
        bookBean.setAuthor(author);
        bookBean.setCategory(category);
        bookBean.setStock(stock);
        bookBean.setPrice(price);
        bookBean.setFilename(dbFileName);
        bookBean.setPath(savePath);
        
        BookDao bookDao = new BookDao();
        int addCount = bookDao.addBook(bookBean);
        
        if (addCount > 0) {
        	RequestDispatcher rd = request.getRequestDispatcher("AdminAddBook.jsp");
    		rd.include(request, response);
    		out.println("<script type='text/javascript'>");
            out.println("window.onload = function addSuccess(){parent.postMessage('add','http://localhost:8181/JSPOnlineBookShopping/AdminPortal.jsp');}");
            out.println("</script>");
            
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("AdminAddBook.jsp");
			rd.include(request, response);
			out.println("<script type='text/javascript'>");
	        out.println("window.onload = function addFail(){parent.postMessage('fail','http://localhost:8181/JSPOnlineBookShopping/AdminPortal.jsp');}");
	        out.println("</script>");
		}
    }
    // file name of the upload file is included in content-disposition header like this:
    //form-data; name="dataFile"; filename="PHOTO.JPG"

    private String extractFileName(Part part) {//This method will print the file name.
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }
}