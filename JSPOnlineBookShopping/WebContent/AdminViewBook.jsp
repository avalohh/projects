<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.mvc.dao.BookDao,com.mvc.bean.BookBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Book</title>
<style>
.center {
	margin-left:auto; 
    margin-right:auto;
 	font-size:120%;
 	color: black;
 	width:90%;
 	height:15%;
 	border:2px solid #1ABC9C;
 	border-collapse: collapse; 
}

th{
  background-color:lightblue;
  position: sticky;
  top: 0;
   box-shadow: 0 2px 2px -1px rgba(0, 0, 0, 0.4);
}

th,td{
  text-align:center;
  padding:5px 0;
}

tbody tr{
	background-color:white;
}

tbody tr:hover{
background:#BDC3C7;
  color:#FFFFFF;
}

tbody tr:nth-child(even){
	background-color:lightyellow;
}
tbody tr:nth-child(even):hover{
	background:#BDC3C7;
  color:black;
}
</style>
</head>
<body>
<%
	List<BookBean> list = (List<BookBean>)request.getAttribute("list");
%>
<h1 style="text-align:center">View Book</h1>

<%if(list == null || list.isEmpty())
{ %>
	<h2 style='padding-top:120px'><center>No Book Found...</center></h2>
<%} else
{%>
	<table class="center">
		<tr>
			<th>Book ID</th>
			<th>Book Name</th>
			<th>Author</th>
			<th>Category</th>
			<th>Stock</th>
			<th>Price($)</th>
		</tr>
	
		<%
		for(BookBean book:list)
		{
		%>
		<tr>
			<td><center><%=book.getBookid()%></center></td>
			<td><center><%=book.getName()%></center></td>
			<td><center><%=book.getAuthor()%></center></td>
			<td><center><%=book.getCategory()%></center></td>
			<td><center><%=book.getStock()%></center></td>
			<td><center><%=String.format("%.02f",book.getPrice())%></center></td>
		</tr>
		<%
		}
		%>
	</table>
<%} %>
</body>
</html>