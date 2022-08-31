

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DeleteServlet
 */
@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection conn = MyDBConnection.dbConnect();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<h1><center>Delete Employee Page</center></h1><hr>");

		List<Integer> listID = new ArrayList<>();
		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select empid from employee");
			while (rs.next())
			{
				listID.add(rs.getInt(1));
			}
		} catch (SQLException e) {
			out.println(e.getMessage());
		}
		
		out.println("<div><center><br><br>");
		if (!listID.isEmpty()) 
		{
			out.println("<form name='deleteEmp' action='DeleteServlet' method='post'>");
			out.println("<table>");
			out.println("<tr><td><label for='empid'>Select Emp ID:</label></td>");
			out.println("<td><select name='empid' required>");
			out.println("<option value='' disabled selected hidden>Select</option>");
			for (int empid : listID) {
				out.println("<option value='" + empid + "'>" + empid + "</option>");
			}
			out.println("</select></td></tr>");
			
			out.println("<tr><td colspan='2' style='text-align:center'><input type='submit' value='Delete'></td></tr>");
			out.println("</table></form>");
		}
		else 
		{
			out.print("<p>No Employee Record Found...</p>");
		}
		out.println("</center></div>");
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		int empid = Integer.parseInt(request.getParameter("empid"));

		try {
			PreparedStatement st;
			st = conn.prepareStatement("delete from employee where empid = ?");
			st.setInt(1, empid);
			
			int deleteCount = st.executeUpdate();
			
			this.doGet(request, response);
			if (deleteCount > 0) {
				out.println("<h3><center>Employee ID "+empid+" deleted successfully</center></h3>");
			} else {
				out.println("<h3><center>Failed to delete Employee ID "+empid+"</center></h3>");
			}
		} catch (SQLException e) {
			out.println(e.getMessage());
		}
	}

}
