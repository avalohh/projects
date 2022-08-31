

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
 * Servlet implementation class AddEmpServlet
 */
@WebServlet("/AddEmpServlet")
public class AddEmpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection conn = MyDBConnection.dbConnect();

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String empname = request.getParameter("empname");
		int phone = Integer.parseInt(request.getParameter("phone"));
		String email = request.getParameter("email");
		String empdept = request.getParameter("empdept");
		String emprole = request.getParameter("emprole");

		PreparedStatement st;
		try {
			st = conn.prepareStatement("insert into employee values(empid.nextval,?,?,?,?,?)");
			st.setString(1, empname);
			st.setInt(2, phone);
			st.setString(3, empdept);
			st.setString(4, emprole);
			st.setString(5, email);
			
			st.executeUpdate();
			RequestDispatcher rd = request.getRequestDispatcher("AddEmp.html");
			rd.include(request, response);
			out.println("<h3><center>Employee "+empname+" added successfully</center></h3>");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			out.println(e.getMessage());
		}
	}

}
