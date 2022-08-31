

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection conn = MyDBConnection.dbConnect();

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String email = request.getParameter("email");
		String gender = request.getParameter("gender");
		String city = request.getParameter("city");

		PreparedStatement st;
		try {
			st = conn.prepareStatement("insert into register values(?,?,?,?,?)");
			st.setString(1, fname);
			st.setString(2, lname);
			st.setString(3, email);
			st.setString(4, gender);
			st.setString(5, city);
			
			st.executeUpdate();
			RequestDispatcher rd = request.getRequestDispatcher("SignUp.html");
			rd.include(request, response);
			out.println("<h3><center>Register has successfully Done!</center></h3>");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			out.println(e.getMessage());
		}
		
	}

}
