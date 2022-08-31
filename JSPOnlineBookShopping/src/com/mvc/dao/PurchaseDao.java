package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.mvc.bean.BookBean;
import com.mvc.bean.LoginBean;
import com.mvc.bean.PurchaseBean;
import com.mvc.util.DBConnection;

public class PurchaseDao {

	public int purchaseBook(PurchaseBean purchaseBean)
	{
		Connection conn = DBConnection.dbConnect();
		
		String fname = purchaseBean.getFname();
		String email = purchaseBean.getEmail();
		int bookid = purchaseBean.getBookid();
		java.sql.Date orderdate = purchaseBean.getOrderdate();
		int quantity = purchaseBean.getQuantity();
		float totalprice = purchaseBean.getTotalprice();

		int purchaseCount = 0;
		try {
			PreparedStatement st = conn.prepareStatement("insert into purchase values(orderid.nextval,?,?,?,?,?,?)");
			st.setString(1, fname);
			st.setString(2, email);
			st.setInt(3, bookid);
			st.setDate(4, orderdate);
			st.setInt(5, quantity);
			st.setFloat(6, totalprice);
            
            purchaseCount = st.executeUpdate();
            stockPurchased(bookid, quantity);
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
		return purchaseCount;
	}
	
	public void stockPurchased(int bookid, int quantity)
	{
		Connection conn = DBConnection.dbConnect();
		PreparedStatement st = null;
		try{
			st = conn.prepareStatement("select stock from book where bookid = ?");
			st.setInt(1, bookid);
			ResultSet rs = st.executeQuery();
			int stock = 0;
			
			while(rs.next())
			{
				stock = rs.getInt("stock");
			}
			
			int updatedStock = stock-quantity;
			
			st = conn.prepareStatement("update book set stock = ? where bookid = ?");
			st.setInt(1,updatedStock);
			st.setInt(2,bookid);
			st.executeUpdate();
            
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
	}
	
	public boolean stockAvailable(BookBean bookBean, int quantity)
	{
		Connection conn = DBConnection.dbConnect();
		PreparedStatement st = null;
		ResultSet rs = null;
		boolean available = false;
		int stock = 0;
		
		try{
			st = conn.prepareStatement("select stock from book where name = ?");
			st.setString(1, bookBean.getName());
			rs = st.executeQuery();
			
			while(rs.next())
			{
				stock = rs.getInt("stock");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(stock > quantity)
		{
			available = true;
		}
		return available;
	}
	
	public int getBookID(BookBean bookBean)
	{
		Connection conn = DBConnection.dbConnect();
		PreparedStatement st = null;
		ResultSet rs = null;
		int bookid = 0;
		
		try
		{
			st = conn.prepareStatement("select bookid from book where name = ?");
			st.setString(1, bookBean.getName());
			rs = st.executeQuery();

			while (rs.next())
			{
				bookid = rs.getInt("bookid");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return bookid;
	}
	
	public float getPrice(BookBean bookBean)
	{
		Connection conn = DBConnection.dbConnect();
		PreparedStatement st = null;
		ResultSet rs = null;
		float price = 0;
		
		try
		{
			st = conn.prepareStatement("select price from book where name = ?");
			st.setString(1, bookBean.getName());
			rs = st.executeQuery();

			while (rs.next())
			{
				price = rs.getFloat("price");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return price;
	}
	
	public List<PurchaseBean> viewHistory(LoginBean loginBean)
	{
		Connection conn = DBConnection.dbConnect();
		List<PurchaseBean> list = new ArrayList<PurchaseBean>();
		String userid = loginBean.getUsername();
		String pwd = loginBean.getPassword();
		
		try{
			PreparedStatement ps = null;
			ps = conn.prepareStatement("select orderdate,book.name,book.author,book.price,purchase.quantity,purchase.totalprice from purchase,book where purchase.bookid = book.bookid and purchase.fname=? and purchase.email=?");
			ps.setString(1,userid);
			ps.setString(2,pwd);
			ResultSet rs = ps.executeQuery();
		
			while (rs.next())
			{
				Date orderdate = rs.getDate("orderdate");
				String name = rs.getString("name");
				String author = rs.getString("author");
				float price = rs.getFloat("price");
				int quantity = rs.getInt("quantity");
				float totalprice = rs.getFloat("totalprice");
				
				PurchaseBean purchase = new PurchaseBean();
				purchase.setOrderdate((java.sql.Date) orderdate);
				purchase.setName(name);
				purchase.setAuthor(author);
				purchase.setPrice(price);
				purchase.setQuantity(quantity);
				purchase.setTotalprice(totalprice);
				
				list.add(purchase);
			}
			conn.close();
		}catch(SQLException e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
	public List<PurchaseBean> viewPurchaseOrder()
	{
		Connection conn = DBConnection.dbConnect();
		List<PurchaseBean> list = new ArrayList<PurchaseBean>();

		try{
			PreparedStatement ps = null;
			ps = conn.prepareStatement("select orderid, orderdate,fname,purchase.bookid,book.name,book.author,book.price,purchase.quantity,purchase.totalprice from purchase,book where purchase.bookid = book.bookid");
			ResultSet rs = ps.executeQuery();
		
			while (rs.next())
			{
				int orderid = rs.getInt("orderid");
				Date orderdate = rs.getDate("orderdate");
				String fname = rs.getString("fname");
				int bookid = rs.getInt("bookid");
				String name = rs.getString("name");
				String author = rs.getString("author");
				float price = rs.getFloat("price");
				int quantity = rs.getInt("quantity");
				float totalprice = rs.getFloat("totalprice");
				
				PurchaseBean purchase = new PurchaseBean();
				purchase.setOrderid(orderid);
				purchase.setOrderdate((java.sql.Date) orderdate);
				purchase.setFname(fname);
				purchase.setBookid(bookid);
				purchase.setName(name);
				purchase.setAuthor(author);
				purchase.setPrice(price);
				purchase.setQuantity(quantity);
				purchase.setTotalprice(totalprice);
				
				list.add(purchase);
			}
			conn.close();
		}catch(SQLException e)
		{
			e.printStackTrace();
		}
		return list;
	}
}
