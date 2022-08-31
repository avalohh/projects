

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
 * Servlet implementation class EmployerServlet
 */
@WebServlet("/EmployerServlet")
public class EmployerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection conn = MyDBConnection.dbConnect();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		ServletContext servletcontext = getServletContext();
		String username = (String) servletcontext.getAttribute("username");

		RequestDispatcher rd = request.getRequestDispatcher("Employer.html");
		rd.include(request, response);
		out.println("<div style='position:absolute; top: 120px; left:10px;'>");
		out.println("<p style='text-align:left'>Welcome " + username + "<br>");
		Date date = new Date();
		out.println("Date/Time: "+date+"</p></div></body></html>");
	}

}
