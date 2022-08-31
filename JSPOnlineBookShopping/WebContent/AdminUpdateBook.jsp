<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.mvc.dao.BookDao,com.mvc.bean.BookBean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Book</title>
</head>
<style>
.center {
	margin-left:auto; 
    margin-right:auto;
    border-collapse:separate;
 	border-spacing:15px;
 	font-size:150%;
 	color: black;
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
<script>
function validateUpdate() {
	let stockSelect = document.getElementById('stockSelect');
	stockSelect.style.display = 'none';
	stockSelect.required = false;
	let updateField = document.forms['updateBook']['update'];
	let selectedField = updateField.options[updateField.selectedIndex];
	
	if(selectedField.value != '') 
	{
		let value = document.forms['updateBook']['value'];
		value.style.display = 'block';
		document.getElementById('value').innerHTML = 'Enter Updated ' + selectedField.text + ':';
		if(selectedField.value == 'price')
		{
			value.placeholder = '23.5';
		}
		else if(selectedField.value == 'stock')
		{
			value.style.display = 'none';
			document.getElementById('stockSelect').style.display = 'block';
		}
	}
};
</script>
<script>
window.onload = function()
{
	var dd = document.getElementById('number').getElementsByTagName("select")[0];
	for(var i=1; i<101;i++)
	{
		var option = new Option;
		option.text = i;
		option.value = i;
		dd.options[i] = option;
	}
	
	let msg = "<%=request.getAttribute("msg")%>";
	if (msg != "null") {
		if(msg == "update")
			parent.postMessage('updateSuccess','http://localhost:8181/JSPOnlineBookShopping/AdminPortal.jsp');
		else if(msg == "failupdate")
			parent.postMessage('updateFail','http://localhost:8181/JSPOnlineBookShopping/AdminPortal.jsp');
		<% request.removeAttribute("msg");%>
	}
};

</script>
<script type="text/javascript">
function updateValid(){
	var RE = /^\d*\.?\d{0,2}$/;
	if(document.getElementById("selectname").value ==false)
	{
		parent.postMessage("name","http://localhost:8181/JSPOnlineBookShopping/AdminPortal.jsp");
		return false;
	}
	if(document.getElementById("update").value ==false)
	{
		parent.postMessage("update","http://localhost:8181/JSPOnlineBookShopping/AdminPortal.jsp");
		return false;
	}
	if(document.getElementById("update").value=='price' && document.getElementById("price").value =='')
	{
		parent.postMessage("price","http://localhost:8181/JSPOnlineBookShopping/AdminPortal.jsp");
		return false;
	}
	if(RE.test(document.getElementById("price").value) ==false)
	{
		parent.postMessage("pricevalid","http://localhost:8181/JSPOnlineBookShopping/AdminPortal.jsp");
		return false;
	}
	if(document.getElementById("update").value=='stock' &&document.getElementById("stockSelect").value ==false)
	{
		parent.postMessage("stock","http://localhost:8181/JSPOnlineBookShopping/AdminPortal.jsp");
		return false;
	}
};
</script>
<body>
<h1 style="text-align:center">Update Book</h1><hr><br>

<form name="updateBook" action="AdminUpdateServlet" method="post" onsubmit="return updateValid()">
<table class="center">
	<tr>
		<td><label for='name'>Select Book Name:</label></td>
		<td><div id="name"><select name='selectname' id='selectname'>
		<option value='' disabled selected hidden>Select</option>
		<% 
		List<BookBean> list = (List<BookBean>)request.getAttribute("list");
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
		<td><label for='update'>Select item to be updated:</label></td>
	
		<td><select name='update' id='update' onchange='validateUpdate()'>
			<option value='' disabled selected hidden>Select</option>
			<option value='price'>Price</option>
			<option value='stock'>Stock</option>
			</select>
		</td>
	</tr>
	<tr>
		<td><label id='value' for='value'>Enter Updated Price:</label></td>
		<td><input type='text' name='value' id='price'>
		<div id="number"><select id="stockSelect" name="stockSelect" style='display: none;'>
			<option value='0'>--Select Stock--</option>
		</select></div>
		</td>
	</tr>
	<tr>
		<td colspan="2" style="text-align:center"><div class="container"><input type="submit" value="Update" class="btn btn-5"></div></td>
	</tr>
</table>
</form>
</body>
</html>