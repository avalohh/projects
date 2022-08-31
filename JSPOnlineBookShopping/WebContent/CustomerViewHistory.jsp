<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.mvc.dao.PurchaseDao,com.mvc.bean.PurchaseBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Transaction History</title>
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
	List<PurchaseBean> list = (List<PurchaseBean>)request.getAttribute("history");
%>
<h1 style="text-align:center">View Transaction History</h1>

<%if(list == null || list.isEmpty())
{ %>
	<h2 style='padding-top:120px'><center>Haven't purchased any books yet...</center></h2>
<%} else
{%>
	<table class="center">
		<tr>
			<th>Purchase Date</th>
			<th>Book Name</th>
			<th>Author</th>
			<th>Price($)</th>
			<th>Quantity</th>
			<th>Total Price($)</th>
		</tr>
	
		<%
		for(PurchaseBean purchase:list)
		{
		%>
		<tr>
			<td><center><%=purchase.getOrderdate()%></center></td>
			<td><center><%=purchase.getName()%></center></td>
			<td><center><%=purchase.getAuthor()%></center></td>
			<td><center><%=String.format("%.02f",purchase.getPrice())%></center></td>
			<td><center><%=purchase.getQuantity()%></center></td>
			<td><center><%=String.format("%.02f",purchase.getTotalprice())%></center></td>
		</tr>
		<%
		}
		%>
	</table>
<%} %>
</body>
</html>