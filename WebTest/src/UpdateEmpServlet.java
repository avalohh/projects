

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
 * Servlet implementation class UpdateEmpServlet
 */
@WebServlet("/UpdateEmpServlet")
public class UpdateEmpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection conn = MyDBConnection.dbConnect();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		out.println("<h1><center>Update Employee Page</center></h1><hr>");

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
		
		out.println("<script>");
		out.println("function validateUpdate() {");
		out.println("let deptSelect = document.getElementById('deptSelect');");
		out.println("deptSelect.style.display = 'none';");
		out.println("deptSelect.required = false;");
		out.println("let updateField = document.forms['updateEmp']['update'];");
		out.println("let selectedField = updateField.options[updateField.selectedIndex];");
		out.println("if(selectedField.value != '') {");
		out.println("let value = document.forms['updateEmp']['value'];");
		out.println("value.style.display = 'block';");
		out.println("value.required = true;");
		out.println("document.getElementById('value').innerHTML = 'Enter Updated ' + selectedField.text + ':';");
		out.println("if(selectedField.value == 'email'){");
		out.println("value.placeholder = 'example@gmail.com';");
		out.println("}");
		out.println("else if(selectedField.value == 'dept'){");
		out.println("value.style.display = 'none';");
		out.println("value.required = false;");
		out.println("document.getElementById('deptSelect').style.display = 'block';");
		out.println("}");
		out.println("else if(selectedField.value == 'phone'){");
		out.println("value.type = 'tel';");
		out.println("value.placeholder = 'Enter new contact';");
		out.println("}");
		out.println("else if(selectedField.value == 'role'){");
		out.println("value.placeholder = 'Enter new role';");
		out.println("}");
		out.println("}");
		out.println("}");
		out.println("</script>");
		
		
		out.println("<div><center><br><br>");
		if (!listID.isEmpty()) 
		{
			out.println("<form name='updateEmp' action='UpdateEmpServlet' method='post'>");
			out.println("<table>");
			out.println("<tr><td><label for='empid'>Select Emp ID:</label></td>");
			out.println("<td><select name='empid' required>");
			out.println("<option value='' disabled selected hidden>Select</option>");
			for (int empid : listID) {
				out.println("<option value='" + empid + "'>" + empid + "</option>");
			}
			out.println("</select></td></tr>");
			out.println("<tr><td><label for='update'>Select item you want to update:</label></td>");
	
			out.println("<td><select name='update' placeholder='select' required onchange='validateUpdate()'>");
			out.println("<option value='' disabled selected hidden>Select</option>");
			out.println("<option value='email'>Email</option>");
			out.println("<option value='dept'>Department</option>");
			out.println("<option value='phone'>Contact No</option>");
			out.println("<option value='role'>Role</option>");
			out.println("</select></td></tr>");
			
			out.println("<tr><td><label id='value' for='value'>Enter Updated Email:</label></td>");
			out.println("<td><input type='text' name='value' required>");
			out.println("<select id='deptSelect' name='deptSelect' required style='display: none;'>");
			out.println("<option value='' disabled selected hidden>Select</option>");
			out.println("<option value='Admin'>Admin</option>");
			out.println("<option value='Account'>Account</option>");
			out.println("<option value='HR'>HR</option>");
			out.println("<option value='IT'>IT</option>");
			out.println("</select></td></tr>");
			
			out.println("<tr><td colspan='2' style='text-align:center'><input type='submit' value='Update'></td></tr>");
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
		String update = request.getParameter("update");
		String detail = request.getParameter("value");

		
		try {
			PreparedStatement st = null;
			if(update.equals("email"))
				st = conn.prepareStatement("update employee set email = ? where empid = ?");
			else if (update.equals("dept"))
			{
				detail = request.getParameter("deptSelect");
				st = conn.prepareStatement("update employee set empdept = ? where empid = ?");
			}
			else if (update.equals("phone"))
				st = conn.prepareStatement("update employee set empcontact = ? where empid = ?");
			else if (update.equals("role"))
				st = conn.prepareStatement("update employee set emprole = ? where empid = ?");
			
			st.setString(1, detail);
			st.setInt(2, empid);
			
			int updateCount = st.executeUpdate();
			this.doGet(request, response);
			if (updateCount > 0) {
				out.println("<h3><center>Employee ID "+empid+" updated successfully</center></h3>");
			} else {
				out.println("<h3><center>Failed to update Employee ID "+empid+"</center></h3>");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
			
		
	}		
}
