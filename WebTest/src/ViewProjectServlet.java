

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ViewProjectServlet
 */
@WebServlet("/ViewProjectServlet")
public class ViewProjectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection conn = MyDBConnection.dbConnect();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		
		ServletContext servletcontext = getServletContext();
		String username = (String) servletcontext.getAttribute("username");
		
		try
		{
			PreparedStatement ps = conn.prepareStatement("select * from project where empid in (select empid from employee where empname=?)");
			ps.setString(1, username);
			
			ResultSet rs = ps.executeQuery();
			
			out.println("<script> function check(projectid){");
			out.println("document.getElementById('projectid').value=projectid;}");
			out.println("</script>");
			
			if(rs.next()==false)
			{
				out.println("<br><h3><center>No Project Assign Yet..</center></h3>");
			}
			else
			{
				out.println("<div><center><br><br>");
				out.println("<form name='viewProject' action='ViewProjectServlet' method='post'>");
				out.println("<table class='view' border=1 width=80% height=15%>");
				out.println("<tr style='background-color:lightblue'><th>Project ID</th><th>Client</th><th>Technology</th><th>Start Date</th><th>Project Accept</th></tr>");
				
				do
				{
					int projectid = rs.getInt("projectid");
					String client = rs.getString("client");
					String tech = rs.getString("tech");
					Date startdate = rs.getDate("startdate");
					
					out.println("<tr style='background-color:lightpink'><td><center>"+projectid+"</center></td><td><center>"+client+"</center></td><td><center>"+tech+"</center></td><td><center>"
								+startdate+"</center></td><td><center><input type='radio' id='yes' name='accept' value='Accepted' required onclick='check("+projectid+")'><label for='yes'>Yes</label>"
										+ "<input type='radio' id='no' name='accept' value='Rejected' onclick='check("+projectid+")'><label for='no'>No</label></center><input type='hidden' id='projectid' name='projectid'></td></tr>");
				}while(rs.next());
				
				out.println("<tr><td colspan='7' style='text-align:center'><input type='submit' value='Submit'></td></tr>");
				out.println("</table></form></center></div>");
			}	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			out.println(e.getMessage());
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		int projectid = Integer.parseInt(request.getParameter("projectid"));
		String status = request.getParameter("accept");
		
		String message="";
		if(status.equalsIgnoreCase("Accepted"))
		{
			message = "<h3><center>Project ID "+projectid+" accepted successfully</center></h3>";
		}
		else if(status.equalsIgnoreCase("Rejected"))
		{
			message = "<h3><center>Project ID "+projectid+" rejected successfully</center></h3>";
		}

		PreparedStatement st;
		try {
			st = conn.prepareStatement("update project set status=? where projectid=?");
			st.setString(1, status);
			st.setInt(2, projectid);
			
			st.executeUpdate();
			this.doGet(request, response);
			out.println(message);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			out.println(e.getMessage());
		}
	}

}
