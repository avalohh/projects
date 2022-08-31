package com.mvc.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

	public static Connection dbConnect()
	{
		Connection conn = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		//step-2
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "dbuser", "dbuser");
			if(conn!=null)
			{
				System.out.println("DB Connected Successfully..!!");
			}
			else
			{
				System.out.println("Sorry..!! Something went wrong..");
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return conn;
		
	}
	
}
