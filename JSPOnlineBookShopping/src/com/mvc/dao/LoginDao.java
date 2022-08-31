package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mvc.bean.LoginBean;
import com.mvc.util.DBConnection;

public class LoginDao {

	public boolean authenticateAdmin(LoginBean loginBean)
	{
		String username = loginBean.getUsername();
		String password = loginBean.getPassword();
		
		Connection conn = DBConnection.dbConnect();
		
		boolean login = false;
		PreparedStatement ps = null;
		try{
			ps = conn.prepareStatement("select * from bookAdmin where userid = ?");
			ps.setString(1, username);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next())
			{
				if(rs.getString(2).equals(password))
				{
					login = true;
				}
			}
		}catch(SQLException e)
		{
			System.out.println(e.getMessage());
		}
		
		return login;
	}
	
	public boolean authenticateUser(LoginBean loginBean)
	{
		String username = loginBean.getUsername();
		String password = loginBean.getPassword();
		
		Connection conn = DBConnection.dbConnect();
		
		boolean login = false;
		PreparedStatement ps = null;
		try{
			ps = conn.prepareStatement("select * from bookcustomer where fname = ?");
			ps.setString(1, username);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next())
			{
				if(rs.getString("email").equals(password))
				{
					login = true;
				}
			}
		}catch(SQLException e)
		{
			System.out.println(e.getMessage());
		}
		
		return login;
	}
}
