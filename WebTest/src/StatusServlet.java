

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class StatusServlet
 */
@WebServlet("/StatusServlet")
public class StatusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection conn = MyDBConnection.dbConnect();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		
		try
		{
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from project");
			
			out.println("<h1><center>View Project Status Page</center></h1><hr>");
			out.println("<div><center><br><br>");
			out.println("<table class='view' border=1 width=80% height=15%>");
			out.println("<tr style='background-color:lightblue'><th>Project ID</th><th>Emp ID</th><th>Client</th><th>Technology</th><th>Start Date</th><th>Status</th></tr>");
			
			while(rs.next())
			{
				int projectid = rs.getInt("projectid");
				int empid = rs.getInt("empid");
				String client = rs.getString("client");
				String tech = rs.getString("tech");
				Date startdate = rs.getDate("startdate");
				String status = rs.getString("status");
				
				out.println("<tr style='background-color:lightpink'><td><center>"+projectid+"</center></td><td><center>"+empid+"</center></td><td><center>"+client+"</center></td><td><center>"+tech+"</center></td><td><center>"+startdate+"</center></td><td><center>"+status+"</center></td></tr>");
			}
			out.println("</table></center></div>");
		 
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			out.println(e.getMessage());
		}
	}

}
