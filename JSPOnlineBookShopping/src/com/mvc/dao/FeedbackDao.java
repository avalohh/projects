package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.mvc.bean.FeedbackBean;
import com.mvc.util.DBConnection;

public class FeedbackDao {

	public int feedback(FeedbackBean feedbackBean)
	{
		String name = feedbackBean.getName();
		String email = feedbackBean.getEmail();
		int phone = feedbackBean.getPhone();
		String feedback = feedbackBean.getFeedback();
		
		Connection conn = DBConnection.dbConnect();
		int feedbackCount = 0;
		
		try
		{
			PreparedStatement st = null;
			st = conn.prepareStatement("insert into bookfeedback values(?,?,?,?)");
			st.setString(1, name);
			st.setString(2, email);
			st.setInt(3, phone);
			st.setString(4, feedback);
			
			feedbackCount = st.executeUpdate();
			conn.close();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return feedbackCount;
	}
}
