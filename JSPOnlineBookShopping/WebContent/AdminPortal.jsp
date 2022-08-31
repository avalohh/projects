<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Portal</title>
<script type="text/javascript" language="JavaScript">
    if (top.location != self.location) {
      top.location.href = self.location.href;
    }

    var eventMethod = window.addEventListener
	? "addEventListener"
	: "attachEvent";
	var eventer = window[eventMethod];
	var messageEvent = eventMethod === "attachEvent"
	? "onmessage"
	: "message";

	eventer(messageEvent, function (e) {

	if (e.data === "name" || e.message === "name") 
		alert('Please Enter Book Name!');
	else if(e.data === "author" || e.message === "author") 
		alert('Please Enter Author Name!');
	else if(e.data === "category" || e.message === "category") 
		alert('Please Select Category!');
	else if(e.data === "stock" || e.message === "stock") 
		alert('Please Select Stock quantity!');
	else if(e.data === "price" || e.message === "price") 
		alert('Please Enter Price!');
	else if(e.data === "pricevalid" || e.message === "pricevalid") 
		alert('Price is invalid! Ex:62.5');
	else if(e.data === "image" || e.message === "image") 
		alert('Please Upload Image!');
	else if(e.data === "update" || e.message === "update") 
		alert('Please select item to update');
	else if(e.data === "add" || e.message === "add") 
		alert('Added Successfully!');
	else if(e.data === "fail" || e.message === "fail") 
		alert('Failed to add book...');
	else if(e.data === "updateSuccess" || e.message === "updateSuccess") 
		alert('Updated Successfully!');
	else if(e.data === "updateFail" || e.message === "updateFail") 
		alert('Failed to update book...');
	
	console.log(e);
});
</script>
<style>
body{
	background-image: url('https://img.1ppt.com/uploads/allimg/1812/1_181201090931_1.jpg');
	background-repeat:no-repeat;
	background-attachment:fixed;
	background-size:100% 100%;
}
 
.sidenav{
	height:481px;
	width:215px;
	position:fixed;
	z-index:1;
	top:125px;
	left:50px;
	background-color:rgb(255, 99, 71, 0.8);
	overflow-x:hidden;
	padding-top:20px;
}

.sidenav a {
	text-align:left;
	padding: 10px 6px 10px;
	text-decoration: none;
	font-size: 25px;
	color: black;
	display: block;
}

.sidenav a:hover {
  color: #f1f1f1;
}

ul{
	list-style-type: none;
	<!--list-style-image: linear-gradient(to left bottom, red, blue);-->
}

iframe {
    background-color: rgba(255, 173, 205, 0.5);
    display: block;
    position:relative;
    left:350px;
}

div.iframe-container {
    dsiplay : flex;
    justify-content : center;
}

.list {
  position: relative;
}


.list li:last-child {
	text-align:left;
	padding: 80px 6px 10px;
}

</style>
</head>
<%!
public String userid()
{
	ServletContext servletcontext = getServletContext();
	String userid = (String) servletcontext.getAttribute("userid");
	return userid;
}

%>
<body>

<h1 style="text-align:center;font-size:270%">Welcome <%= userid()%></h1>

<div class="sidenav">
<ul class="list">
	<li><a href="AdminAddBook.jsp" target="iframe_a">Add Book</a></li>
	<li><a href="AdminUpdateServlet" target="iframe_a">Update Book</a></li>
	<li><a href="AdminViewBookServlet" target="iframe_a">View Books</a></li>
	<li><a href="AdminViewOrderServlet" target="iframe_a">View Orders</a></li>
	<li><a href="LogoutServlet" target="iframe_a">Logout</a></li>
</ul>

</div>

<div class="iframe-container"><br>
<iframe src='AdminFront.jsp' name="iframe_a" height="500px" width="1000px" title="iframe" sandbox="allow-top-navigation allow-scripts allow-forms" frameBorder="0"></iframe>
</div>

</body>
</html>