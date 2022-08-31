<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Pandora Bookshop</title>
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
		alert('Please Select Book Name!');
	else if(e.data === "purchase" || e.message === "purchase") 
		alert('Purchase Successfully!');
	else if(e.data === "fail" || e.message === "fail") 
		alert('Sorry..Fail to purchase..');
	else if(e.data === "insufficient" || e.message === "insufficient") 
		alert('Sorry..Insufficient Stock..');
	
	console.log(e);
});
</script>
<style>
body{
	background-image: url('https://st.depositphotos.com/1006753/4813/i/450/depositphotos_48134921-stock-photo-books-and-a-coffee-cup.jpg');
	background-repeat:no-repeat;
	background-attachment:fixed;
	background-size:100% 100%;
}
 
.sidenav{
	height:574px;
	width:215px;
	position:fixed;
	z-index:1;
	top:100px;
	left:50px;
	background-image: linear-gradient(#ebd2ab,#fffce8,#fccc88);
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
  color:#b34607;
  background-color: #eee;
}

ul{
	list-style-type: none;
	<!--list-style-image: linear-gradient(to left bottom, red, blue);-->
}

iframe {
    background-color: rgba(255, 252, 209,0.8);
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
	padding: 25px 3px 0px;
}

/* Add a red background color to navigation links on hover */
.navbar a:hover, .subnav:hover .subnavbtn, .subnav2:hover .subnav2btn {
  background-color: red;
}

/* Style the subnav content - positioned absolute */
.subnav-content,.subnav-content2 {
  display: none;
  background-color: red;
  width: 100%;
  z-index: 1;
}

/* Style the subnav links */
.subnav-content a{
  float: left;
  color: #ffb066;
  text-decoration: none;
  padding: 10px 6px 10px;
  font-size:20px;
}

.subnav-content2 a {
  float: left;
  color: #ffb066;
  text-decoration: none;
  padding: 10px 30px 10px 6px;
  font-size:20px;
}

/* Add a grey background color on hover */
.subnav-content a:hover,.subnav-content2 a:hover {
  background-color: #eee;
  color: black;
}

/* When you move the mouse over the subnav container, open the subnav content */
.subnav:hover .subnav-content, .subnav2:hover .subnav-content2 {
  display: block;
}

.search{
	display: block;
    position:relative;
    left:350px;
	text-align:center;
	width:970px;
	background-color:rgba(179, 176, 168,0.5);
	padding:15px 15px 15px;
}
.search input[type=text]{
  margin:auto;
  border: none;
  font-size: 25px;
}

.search input[type=image]{
	margin:auto;
}

.center{
	margin:auto;
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

<h1 style="text-align:center;font-size:250%;color:white">Hi, <%= userid()%></h1>

<div class="search">
<form action="CustomerSearchServlet" method="post" target="iframe_a">
<table class="center">
	<tr>
		<td><input type="text" id="search" name="search" placeholder="Search Book.." style="width:800px"></td>
		<td><input type="image" src="https://cdn4.iconfinder.com/data/icons/library-4/49/library-09-256.png" alt="search" width="40" height="40"></td>
	</tr>
</table>
</form>

</div>
<div class="sidenav">
<ul class="list">
	<div class="subnav">
    <li><a href="CustomerViewBookServlet" target="iframe_a">View Book</a></li>
    <div class="subnav-content">
      <a href="CustomerViewSortServlet?order=name" target="iframe_a">Sort by name</a>
      <a href="CustomerViewSortServlet?order=price" target="iframe_a">Sort by price</a>
    </div>
    </div>
    <div class="subnav2">
    <li><a>Category</a></li>
    <div class="subnav-content2">
      <a href="CustomerViewCategoryServlet?cat=fiction" target="iframe_a">Fiction</a>
      <a href="CustomerViewCategoryServlet?cat=novel" target="iframe_a">Novel</a>
      <a href="CustomerViewCategoryServlet?cat=memoir" target="iframe_a">Memoir</a>
      <a href="CustomerViewCategoryServlet?cat=comic" target="iframe_a">Comics</a>
      <a href="CustomerViewCategoryServlet?cat=horror" target="iframe_a">Horror</a>
      <a href="CustomerViewCategoryServlet?cat=mystery" target="iframe_a">Mystery</a>
    </div>
 	</div>
	<li><a href="CustomerPurchaseServlet" target="iframe_a">Purchase</a></li>
	<li><a href="CustomerTransactionServlet" target="iframe_a">Transaction History</a></li>
	<li><a href="LogoutServlet" target="iframe_a">Logout</a></li>
</ul>

</div>

<div class="iframe-container"><br>
<iframe src='CustFront.jsp' name="iframe_a" height="500px" width="1000px" title="iframe" sandbox="allow-top-navigation allow-scripts allow-forms" frameBorder="0"></iframe>
</div>
</body>
</html>