<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.mvc.dao.BookDao,com.mvc.bean.BookBean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Purchase Page</title>
<style>
.form {
	margin-left:auto; 
    margin-right:auto;
    border-collapse:separate;
 	border-spacing:15px;
 	font-size:150%;
 	color: black;
}
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

.center th{
  background-color:lightblue;
  position: sticky;
  top: 0;
   box-shadow: 0 2px 2px -1px rgba(0, 0, 0, 0.4);
}

.center th,td{
  text-align:center;
  padding:5px 0;
}

.center tbody tr{
	background-color:white;
}

.center tbody tr:hover{
background:#BDC3C7;
  color:#FFFFFF;
}

.center tbody tr:nth-child(even){
	background-color:lightyellow;
}
.center tbody tr:nth-child(even):hover{
	background:#BDC3C7;
  color:black;
}

iframe {
    background-color: transparent;
    display: block;
    margin: 0 auto;
}

div.iframe-container {
    dsiplay : flex;
    justify-content : center;
}

.container{
  display:flex;
  justify-content: center;
  align-items: center;
  align-content: center;
  flex-wrap: wrap;
  width: 120px;
  margin: 0 auto;
  min-height: 80px;
}

.btn{
  flex: 1 1 auto;
  padding: 8px;
  text-align: center;
  text-transform: uppercase;
  transition: 0.5s;
  background-size: 200% auto;
  color: black;
  text-shadow: 0px 0px 10px rgba(0,0,0,0.2);
  box-shadow: 0 0 20px #eee;
  border-radius: 10px;
  font-size:80%;
}

.btn:hover{
  background-position: right center; 
}

.btn-5 {
 background-image: linear-gradient(to right,#f6d365 0%, #fda085 51%, #f6d365 100%);
}
</style>
</head>
<script type="text/javascript">
function purchaseValid(){
	if(document.getElementById("selectname").value ==false)
	{
		parent.postMessage("name","http://localhost:8181/JSPOnlineBookShopping/CustPortal.jsp");
		return false;
	}
	if(document.getElementById("quantity").value ==false)
	{
		parent.postMessage("quantity","http://localhost:8181/JSPOnlineBookShopping/CustPortal.jsp");
		return false;
	}
};
</script>
<script>
window.onload = function()
{
	var dd = document.getElementById('number').getElementsByTagName("select")[0];
	for(var i=1; i<16;i++)
	{
		var option = new Option;
		option.text = i;
		option.value = i;
		dd.options[i] = option;
	}
	
	let msg = "<%=request.getAttribute("msg")%>";
	if (msg != "null") {
		if(msg == "purchase")
			parent.postMessage('purchase','http://localhost:8181/JSPOnlineBookShopping/AdminPortal.jsp');
		else if(msg == "fail")
			parent.postMessage('fail','http://localhost:8181/JSPOnlineBookShopping/AdminPortal.jsp');
		else if(msg == "insufficient")
			parent.postMessage('insufficient','http://localhost:8181/JSPOnlineBookShopping/AdminPortal.jsp');
		<% request.removeAttribute("msg");%>
	}
};
</script>
<body>
<%
	List<BookBean> list = (List<BookBean>)request.getAttribute("list");
%>

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
<br>
<form name="purchase" action="CustomerPurchaseServlet" method="post" onsubmit="return purchaseValid()">
<table class="form">
	<tr>
		<td><label for='value' style='font-size:25px;'>Select Book Name:</label></td>
		<td><div id="bookname"><select name='selectname' id='selectname' style='font-size:18px;'>
		<option value='' disabled selected hidden>Select Book</option>
		<% 
		for(BookBean book:list)
		{
		%>
		<option value="<%=book.getName()%>"><%=book.getName()%></option>
		<%
		}
		%>
		</select></div></td>
	</tr>
	<tr>
		<td><label for="quantity" style='font-size:25px;'>Select Quantity: </label></td>
		<td><div id="number"><select id="quantity" name="quantity" style='font-size:18px;'>
			<option value="0">--Select Quantity--</option>
		</select></div></td>
	</tr>
	<tr>
		<td colspan="2" style="text-align:center"><div class="container"><input type="submit" value="Purchase" class="btn btn-5"></div></td>
	</tr>
</table>
</form>
<div class="iframe-container"><br><br>
<iframe src='about:blank' name="iframe_b" height="200px" width="800px" title="iframe" sandbox="allow-top-navigation allow-scripts allow-forms" frameBorder="0">></iframe>
</div>

</body>
</html>