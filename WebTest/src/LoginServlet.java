

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection conn = MyDBConnection.dbConnect();

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String usertype = request.getParameter("usertype");
		String username = request.getParameter("username");
		String pwd = request.getParameter("pwd");
		
		if(usertype.equalsIgnoreCase("employer"))
		{
			try {
				if(employerLogin(username, pwd)==true)
				{
					ServletContext servletcontext = getServletContext();
					servletcontext.setAttribute("username", username);
					response.sendRedirect("EmployerServlet");
				}
				else
				{
					RequestDispatcher rd = request.getRequestDispatcher("Login.html");
					rd.include(request, response);
					out.println("<h3><center><font color='red'>Login Failed..</font></center></h3>");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				out.println(e.getMessage());
			}
		}
		else
		{
			try {
				if(employeeLogin(username, pwd).equalsIgnoreCase("truepm"))
				{
					ServletContext servletcontext = getServletContext();
					servletcontext.setAttribute("username", username);
					response.sendRedirect("PMServlet");
				}
				else if(employeeLogin(username, pwd).equalsIgnoreCase("trueemp"))
				{
					ServletContext servletcontext = getServletContext();
					servletcontext.setAttribute("username", username);
					response.sendRedirect("EmployeeServlet");
				}
				else
				{
					RequestDispatcher rd = request.getRequestDispatcher("Login.html");
					rd.include(request, response);
					out.println("<h3><center><font color='red'>Login Failed..</font></center></h3>");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				out.println(e.getMessage());
			}
		}
	}
	
	boolean employerLogin(String userid, String pwd)throws SQLException
	{
		boolean login = false;
		PreparedStatement ps = conn.prepareStatement("select * from employer where userid = ?");
		ps.setString(1, userid);
		ResultSet rs = ps.executeQuery();
		
		while(rs.next())
		{
			if(rs.getString(2).equals(pwd))
			{
				login = true;
			}
		}
		return login;
	}
	
	String employeeLogin(String userid, String pwd)throws SQLException
	{
		String login = "false";
		PreparedStatement ps = conn.prepareStatement("select * from employee where empname = ?");
		ps.setString(1, userid);
		ResultSet rs = ps.executeQuery();
		
		while(rs.next())
		{
			if(rs.getString("email").equalsIgnoreCase(pwd) && rs.getString("emprole").equalsIgnoreCase("Project Manager"))
			{
				login = "truepm";
			}
			else if(rs.getString("email").equalsIgnoreCase(pwd) && rs.getString("emprole").equalsIgnoreCase("Developer"))
			{
				login = "trueemp";
			}
		}
		return login;
	}
}
