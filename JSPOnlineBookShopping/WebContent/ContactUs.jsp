<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Contact Us</title>
<style>
.box {
	margin-left:auto; 
    margin-right:auto;
	width: 700px;
	height:800px;
	background-color:rgba(255, 223, 224,0.8);
	
}
.center {
	margin-left:auto; 
    margin-right:auto;
    border-collapse:separate;
 	border-spacing:15px;
 	font-size:100%;
 	color: black;
 	padding-top:0px;
 	text-align:left;
}

.center th{
	width:100px;
}

.center td{
	width:300px;
}
.mapouter{
	margin:auto;
	height:170px;
	width:409px;
	padding-top:0px;
}

.fb{
	margin:auto;
	text-align:center;
}
.feedback {
	margin-left:auto; 
    margin-right:auto;
    border-collapse:separate;
 	border-spacing:15px;
 	font-size:100%;
 	color: black;
 	padding-top:0px;
 	text-align:left;
}

.feedback td{
	width:100px;
}

h1{
	padding-top:10px;
}
</style>
</head>
<script type="text/javascript">
function feedback(){
	var mail = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
	var phonecheck = /^[0-9]{8,12}$/;
	if(document.getElementById("name").value == "")
	{
		parent.postMessage("name","http://localhost:8181/JSPOnlineBookShopping/HomePage.jsp");
		return false;
	}
	if(document.getElementById("email").value == "")
	{
		parent.postMessage("email","http://localhost:8181/JSPOnlineBookShopping/HomePage.jsp");
		return false;
	}
	if(mail.test(document.getElementById("email").value) == false)
	{
		parent.postMessage("emailvalid","http://localhost:8181/JSPOnlineBookShopping/HomePage.jsp");
		return false;
	}
	if(document.getElementById("phone").value == "")
	{
		parent.postMessage("phone","http://localhost:8181/JSPOnlineBookShopping/HomePage.jsp");
		return false;
	}
	if(phonecheck.test(document.getElementById("phone").value) == false)
	{
		parent.postMessage("phonevalid","http://localhost:8181/JSPOnlineBookShopping/HomePage.jsp");
		return false;
	}
	if(document.getElementById("feedback").value == "")
	{
		parent.postMessage("feedbackvalid","http://localhost:8181/JSPOnlineBookShopping/HomePage.jsp");
		return false;
	}
};
</script>
<body>
<br>
<div class="box">
<h1 style="text-align:center">Contact Us</h1>
<table class="center">
	<tr>
		<th>Phone No</th>
		<td>6666 8888</td>
	</tr>
	<tr>
		<th>Fax No</th>
		<td>6677 8899</td>
	</tr>
	<tr>
		<th>Email</th>
		<td><a href="victhr@example.com">pandora@example.com</a></td>
	</tr>
	<tr>
		<th>Address</th>
		<td>
		391 Orchard Road 04 - 20 / 20A / 20B / 20C / 21 
		Takashimaya S.C., Ngee Ann City, Singapore 238872</td>
	</tr>
</table>

<div class="mapouter">
<iframe width="409" height="171" id="gmap_canvas" src="https://maps.google.com/maps?q=391%20Orchard%20Road%2004%20-%2020%20/%2020A%20/%2020B%20/%2020C%20/%2021%20Takashimaya%20S.C.,%20Ngee%20Ann%20City,%20Singapore%20238872&t=&z=13&ie=UTF8&iwloc=&output=embed" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"></iframe>
</div>
<br>
<div class="fb">
<form action="FeedbackServlet" method="post" onsubmit="return feedback()">
<table class="feedback">
	<caption style="font-size:150%;">Feedback<br></caption>
	
	<tr>
		<td><label for="name">Enter Name: </label></td>
		<td><input type="text" id="name" name="name" required></td>
	</tr>
	<tr>
		<td><label for="email">Enter your Email: </label></td>
		<td><input type="email" id="email" name="email" required></td>
	</tr>
	<tr>
		<td><label for="phone">Enter phone: </label></td>
		<td><input type="tel" id="phone" name="phone" required></td>
	</tr>
	<tr>
		<td colspan="2"><textarea name="feedback" rows="7" cols="50">Provide your feedback</textarea></td>
	</tr>
	<tr>
		<td colspan="2" style="text-align:center"><input type="submit" value="Submit"></td>
	</tr>
</table>
</form>
</div>
</div>
</body>
</html>