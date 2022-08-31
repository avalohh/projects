<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Book</title>
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
};
</script>
<script type="text/javascript">

function addBook(){
	var RE = /^\d*\.?\d{0,2}$/;
	if(document.getElementById("name").value == "")
	{
		parent.postMessage("name","http://localhost:8181/JSPOnlineBookShopping/AdminPortal.jsp");
		return false;
	}
	if(document.getElementById("author").value == "")
	{
		parent.postMessage("author","http://localhost:8181/JSPOnlineBookShopping/AdminPortal.jsp");
		return false;
	}
	if(document.getElementById("category").value == false)
	{
		parent.postMessage("category","http://localhost:8181/JSPOnlineBookShopping/AdminPortal.jsp");
		return false;
	}
	if(document.getElementById("stock").value ==false)
	{
		parent.postMessage("stock","http://localhost:8181/JSPOnlineBookShopping/AdminPortal.jsp");
		return false;
	}
	if(document.getElementById("price").value == "")
	{
		parent.postMessage("price","http://localhost:8181/JSPOnlineBookShopping/AdminPortal.jsp");
		return false;
	}
	if(RE.test(document.getElementById("price").value)==false)
	{
		parent.postMessage("pricevalid","http://localhost:8181/JSPOnlineBookShopping/AdminPortal.jsp");
		return false;
	}
	if( document.getElementById("file").files.length == 0 )
	{
		parent.postMessage("image","http://localhost:8181/JSPOnlineBookShopping/AdminPortal.jsp");
		return false;
	}
};
</script>
<body>

<h1 style="text-align:center">Add Book Form</h1><hr><br>

<form action="AdminAddServlet" method="post" onsubmit="return addBook()" enctype="multipart/form-data">
<table class="center">
	<tr>
		<td><label for="name">Enter Book Name: </label></td>
		<td><input type="text" id="name" name="name" placeholder="Harry Potter"></td>
	</tr>
	<tr>
		<td><label for="author">Enter Author: </label></td>
		<td><input type="text" id="author" name="author" placeholder="J.K. Rowling"></td>
	</tr>
	<tr>
		<td><label for="category">Select Category: </label></td>
		<td><select name='category' id='category'>
			<option value='' disabled selected hidden>Select</option>
			<option value='Fiction'>Fiction</option>
			<option value='Novel'>Novel</option>
			<option value='Memoir'>Memoir</option>
			<option value='Comics'>Comics</option>
			<option value='Horror'>Horror</option>
			<option value='Mystery'>Mystery</option>
			</select></td>
	</tr>
	<tr>
		<td><label for="stock">Select Stock: </label></td>
		<td><div id="number"><select id="stock" name="stock">
			<option value="0">--Select Stock--</option>
		</select></div></td>
	</tr>
	<tr>
		<td><label for="price">Enter Price: </label></td>
		<td><input type="text" id="price" name="price" placeholder="25.75"></td>
	</tr>
	<tr>
        <td>Upload Image: </td>
        <td>
            <input type="file" name="file" id="file">
        </td>
    </tr>
	<tr>
		<td colspan="2" style="text-align:center"><div class="container"><input type="submit" value="Add" class="btn btn-5"></div></td>
	</tr>
</table>
</form>

</body>
</html>