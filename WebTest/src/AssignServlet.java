

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AssignServlet
 */
@WebServlet("/AssignServlet")
public class AssignServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection conn = MyDBConnection.dbConnect();

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		
		out.println("<script>");
		out.println("var today = new Date();");
		out.println("var dd = today.getDate();");
		out.println("var mm = today.getMonth()+1;");
		out.println("var yyyy = today.getFullYear();");
		
		out.println("if(dd<10)");
		out.println("{dd='0'+dd;}");
		out.println("if(mm<10)");
		out.println("{mm='0'+mm;}");
		
		out.println("today = yyyy+'-'+mm+'-'+dd;");
		out.println("document.getElementById('datafield').setAttribute('min',today);");
		out.println("</script>");
		
		out.println("<h1><center>Project Assign Form</center></h1><hr>");
		out.println("<div><center>");
		out.println("<form name='assignEmp' action='AssignServlet' method='post'>");
		out.println("<table>");
		
		out.println("<tr><td><label for='client'>Select Client:</label></td>");
		out.println("<td><select name='client' required>");
		out.println("<option value='' disabled selected hidden>Select</option>");
		out.println("<option value='Maxis'>Maxis</option>");
		out.println("<option value='Singtel'>Singtel</option>");
		out.println("<option value='Celcom'>Celcom</option>");
		out.println("<option value='Huawei'>Huawei</option>");
		out.println("<option value='Mid Valley'>Mid Valley</option>");
		out.println("</select></td></tr>");
		
		out.println("<tr><td><label for='tech'>Select Technology:</label></td>");
		out.println("<td><select name='tech' required>");
		out.println("<option value='' disabled selected hidden>Select</option>");
		out.println("<option value='Java'>Java</option>");
		out.println("<option value='Python'>Python</option>");
		out.println("<option value='PHP'>PHP</option>");
		out.println("<option value='C#'>C#</option>");
		out.println("<option value='AWS'>AWS</option>");
		out.println("</select></td></tr>");
		
		out.println("<tr><td><label for='date'>Start Date:</label></td>");
		out.println("<td><input id='datefield' type='date' name='date' min='2022-08-18' max='2080-01-01'></td></tr>");
		out.println("<tr><td colspan='2' style='text-align:center'><input type='submit' value='Assign'></td></tr>");
		out.println("</table></form></center></div>");
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		
		ServletContext servletcontext = getServletContext();
		int empid = (int) servletcontext.getAttribute("empid");
		String username = (String) servletcontext.getAttribute("username");
		String client = request.getParameter("client");
		String tech = request.getParameter("tech");
		String date = request.getParameter("date");
		try {
			Date startdate = new SimpleDateFormat("yyyy-MM-dd").parse(date);
			java.sql.Date sqldate = new java.sql.Date(startdate.getTime());
			PreparedStatement st;
			st = conn.prepareStatement("insert into project(projectid,empid,client,tech,startdate,pm) values(projectid.nextval,?,?,?,?,?)");
			st.setInt(1, empid);
			st.setString(2, client);
			st.setString(3, tech);
			st.setDate(4, sqldate);
			st.setString(5,username);
			
			int insertCount = st.executeUpdate();
			
			PreparedStatement ps = conn.prepareStatement("select empname from employee where empid = ?");
			ps.setInt(1, empid);
			ResultSet rs = ps.executeQuery();
			
			
			this.doGet(request, response);
			if (insertCount > 0) {
				while(rs.next())
				{
					out.println("<h3><center>Project assigned to "+rs.getString("empname")+" successfully</center></h3>");
				}
				
			} else {
				while(rs.next())
				{
					out.println("<h3><center>Failed to assign project to "+rs.getString("empname")+"</center></h3>");
				}
				
			}
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (SQLException e) {
			out.println(e.getMessage());
		}
	}

}
