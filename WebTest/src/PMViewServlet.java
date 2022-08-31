

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PMViewServlet
 */
@WebServlet("/PMViewServlet")
public class PMViewServlet extends HttpServlet {
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
			ResultSet rs = stmt.executeQuery("select * from employee where emprole = 'Developer'");
			
			out.println("<h1><center>Developer List</center></h1><hr>");
			out.println("<div><center><br><br>");
			out.println("<form name='viewEmp' action='PMViewServlet' method='post'>");
			out.println("<table class='view' border=1 width=80% height=15%>");
			out.println("<tr style='background-color:lightblue'><th>Emp ID</th><th>Name</th><th>Contact</th><th>Email</th><th>Dept</th><th>Role</th><th>Assign Project</th></tr>");
			
			while(rs.next())
			{
				int empid = rs.getInt("empid");
				String empname = rs.getString("empname");
				int contact = rs.getInt("empcontact");
				String empdept = rs.getString("empdept");
				String emprole = rs.getString("emprole");
				String email = rs.getString("email");
				
				out.println("<tr style='background-color:lightpink'><td><center>"+empid+"</center></td><td><center>"+empname+"</center></td><td><center>"+contact+"</center></td><td><center>"+email+"</center></td><td><center>"
							+empdept+"</center></td><td><center>"+emprole+"</center></td><td><center><input type='radio' id='empid' name='empid' value='" + empid + "' required></center></td></tr>");
			}
			out.println("<tr><td colspan='7' style='text-align:center'><input type='submit' value='Assign Project'></td></tr>");
			out.println("</table></form></center></div>");
		 
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			out.println(e.getMessage());
		}
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		
		int empid = Integer.parseInt(request.getParameter("empid"));

		ServletContext servletcontext = getServletContext();
		servletcontext.setAttribute("empid", empid);
		response.sendRedirect("AssignServlet");
	}


}
