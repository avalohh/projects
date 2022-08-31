package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mvc.bean.BookBean;
import com.mvc.util.DBConnection;

public class BookDao {

	public int addBook(BookBean bookBean)
	{
		Connection conn = DBConnection.dbConnect();
		
		String name = bookBean.getName();
		String author = bookBean.getAuthor();
		String category = bookBean.getCategory();
		int stock = bookBean.getStock();
		float price = bookBean.getPrice();
		String filename = bookBean.getFilename();
		String path = bookBean.getPath();

		int addCount = 0;
		try {
			PreparedStatement pst = conn.prepareStatement("insert into book values(bookid.nextval,?,?,?,?,?,?,?)");
            pst.setString(1, name);
            pst.setString(2, author);
            pst.setString(3, category);
            pst.setInt(4, stock);
            pst.setFloat(5, price);
            pst.setString(6, filename);
            pst.setString(7, path);
            
            addCount = pst.executeUpdate();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
		return addCount;
	}
	
	public int updateBook(String update, BookBean bookBean)
	{
		Connection conn = DBConnection.dbConnect();
		String name = bookBean.getName();
		int updateCount = 0;
	
		try {
			PreparedStatement st = null;
			if(update.equals("price"))
			{
				float price = bookBean.getPrice();
				st = conn.prepareStatement("update book set price = ? where name = ?");
				st.setFloat(1, price);
				st.setString(2, name);
			}
			else if (update.equals("stock"))
			{
				int stock = bookBean.getStock();
				st = conn.prepareStatement("update book set stock = ? where name = ?");
				st.setInt(1, stock);
				st.setString(2, name);
			}
			
			updateCount = st.executeUpdate();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return updateCount;
	}
	
	public List<BookBean> viewBook()
	{
		Connection conn = DBConnection.dbConnect();
		List<BookBean> list = new ArrayList<BookBean>();
		
		try{
			PreparedStatement ps = null;
			ps = conn.prepareStatement("select * from book");
			ResultSet rs = ps.executeQuery();
		
			while (rs.next())
			{
				int bookid = rs.getInt("bookid");
				String bookname = rs.getString("name");
				String author = rs.getString("author");
				String category = rs.getString("category");
				int stock = rs.getInt("stock");
				float price = rs.getFloat("price");
				
				BookBean bookBean = new BookBean();
				bookBean.setBookid(bookid);
				bookBean.setName(bookname);
				bookBean.setAuthor(author);
				bookBean.setCategory(category);
				bookBean.setStock(stock);
				bookBean.setPrice(price);
				
				list.add(bookBean);
			}
			conn.close();
		}catch(SQLException e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
	public List<BookBean> viewByName()
	{
		Connection conn = DBConnection.dbConnect();
		List<BookBean> list = new ArrayList<BookBean>();
		
		try{
			PreparedStatement ps = null;
			ps = conn.prepareStatement("select * from book order by name");
			ResultSet rs = ps.executeQuery();
		
			while (rs.next())
			{
				int bookid = rs.getInt("bookid");
				String bookname = rs.getString("name");
				String author = rs.getString("author");
				String category = rs.getString("category");
				int stock = rs.getInt("stock");
				float price = rs.getFloat("price");
				
				BookBean bookBean = new BookBean();
				bookBean.setBookid(bookid);
				bookBean.setName(bookname);
				bookBean.setAuthor(author);
				bookBean.setCategory(category);
				bookBean.setStock(stock);
				bookBean.setPrice(price);
				
				list.add(bookBean);
			}
			conn.close();
		}catch(SQLException e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
	public List<BookBean> viewByPrice()
	{
		Connection conn = DBConnection.dbConnect();
		List<BookBean> list = new ArrayList<BookBean>();
		
		try{
			PreparedStatement ps = null;
			ps = conn.prepareStatement("select * from book order by price");
			ResultSet rs = ps.executeQuery();
		
			while (rs.next())
			{
				int bookid = rs.getInt("bookid");
				String bookname = rs.getString("name");
				String author = rs.getString("author");
				String category = rs.getString("category");
				int stock = rs.getInt("stock");
				float price = rs.getFloat("price");
				
				BookBean bookBean = new BookBean();
				bookBean.setBookid(bookid);
				bookBean.setName(bookname);
				bookBean.setAuthor(author);
				bookBean.setCategory(category);
				bookBean.setStock(stock);
				bookBean.setPrice(price);
				
				list.add(bookBean);
			}
			conn.close();
		}catch(SQLException e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
	public List<BookBean> viewByCategory(String cat)
	{
		Connection conn = DBConnection.dbConnect();
		List<BookBean> list = new ArrayList<BookBean>();
		
		try{
			PreparedStatement ps = null;
			ps = conn.prepareStatement("SELECT * FROM book where upper(category) like upper('%"+cat+"%')");
			ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                String filename = rs.getString("filename");
                String name = rs.getString("name");
                int bookid = rs.getInt("bookid");
                String author = rs.getString("author");
                String category = rs.getString("category");
                int stock = rs.getInt("stock");
                float price = rs.getFloat("price");
	
				BookBean bookBean = new BookBean();
				bookBean.setFilename(filename);
				bookBean.setBookid(bookid);
				bookBean.setName(name);
				bookBean.setAuthor(author);
				bookBean.setCategory(category);
				bookBean.setStock(stock);
				bookBean.setPrice(price);
				
				list.add(bookBean);
			}
			conn.close();
		}catch(SQLException e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
	public List<BookBean> viewBySearch(String search)
	{
		Connection conn = DBConnection.dbConnect();
		List<BookBean> list = new ArrayList<BookBean>();
		
		try{
			PreparedStatement ps = null;
			ps = conn.prepareStatement("SELECT * FROM book where upper(name) like upper('%" + search + "%') or upper(author) like upper('%" + search + "%') or upper(category) like upper('%" + search + "%')");
			ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                String filename = rs.getString("filename");
                String name = rs.getString("name");
                int bookid = rs.getInt("bookid");
                String author = rs.getString("author");
                String category = rs.getString("category");
                int stock = rs.getInt("stock");
                float price = rs.getFloat("price");
	
				BookBean bookBean = new BookBean();
				bookBean.setFilename(filename);
				bookBean.setBookid(bookid);
				bookBean.setName(name);
				bookBean.setAuthor(author);
				bookBean.setCategory(category);
				bookBean.setStock(stock);
				bookBean.setPrice(price);
				
				list.add(bookBean);
			}
			conn.close();
		}catch(SQLException e)
		{
			e.printStackTrace();
		}
		return list;    
	}
}
