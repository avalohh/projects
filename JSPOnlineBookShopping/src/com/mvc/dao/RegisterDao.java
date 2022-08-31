package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.mvc.bean.RegisterBean;
import com.mvc.util.DBConnection;

public class RegisterDao {

	public int register(RegisterBean registerBean)
	{
		String fname = registerBean.getFname();
		String lname = registerBean.getLname();
		String email = registerBean.getEmail();
		int phone = registerBean.getPhone();
		String gender = registerBean.getGender();
		
		Connection conn = DBConnection.dbConnect();
		int registerCount = 0;
		
		try
		{
			PreparedStatement st = null;
			st = conn.prepareStatement("insert into bookcustomer values(?,?,?,?,?)");
			st.setString(1, fname);
			st.setString(2, lname);
			st.setString(3, email);
			st.setInt(4, phone);
			st.setString(5, gender);
			
			registerCount = st.executeUpdate();
			conn.close();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return registerCount;
	}
}
