<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.mvc.dao.BookDao,com.mvc.bean.BookBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Search Display</title>
</head>
<style>
.center {
	align:left;
 	font-size:120%;
 	color: black;
 	table-layout: fixed;
  	width: 80%;

}

.col{
	width: 15%;
}

</style>
<%
	List<BookBean> list = (List<BookBean>)request.getAttribute("search");
%>
<body>
<h1 style="text-align:center;margin:0;padding:0;padding-top:10px;">Search</h1>
<%if(list == null || list.isEmpty())
{ %>
	<h2 style='padding-top:120px'><center>No Book Found...</center></h2>
<%} else
{
	for(BookBean book:list)
	{
	%>
    <table class="center">
    	<br>
        <tr>
        	<th rowspan="6"><center><image src="<%=book.getFilename()%>" width="150" height="150"/></center></th>
        	<td class="col">Book ID: </td>
        	<td><%=book.getBookid()%></td>
        </tr>
        <tr>
        	<td class="col">Name: </td>
        	<td><%=book.getName()%></td>
        </tr>
        <tr>
        	<td class="col">Author: </td>
        	<td><%=book.getAuthor()%></td>
        </tr>
        <tr>
        	<td class="col">Category: </td>
        	<td><%=book.getCategory()%></td>
        </tr>
        <tr>
        	<td class="col">Stock: </td>
        	<td><%=book.getStock()%></td>
        </tr>
        <tr>
        	<td class="col">Price: </td>
        	<td>$<%=String.format("%.02f",book.getPrice())%></td>
        </tr>
    </table>
    <br><hr><br>
    <%
     }
}
    %><br>
</body>
</html>