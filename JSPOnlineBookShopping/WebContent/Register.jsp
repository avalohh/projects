<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register Page</title>
<style>
.box {
	margin-left:auto; 
    margin-right:auto;
	width: 700px;
	height:340px;
	background-color:rgba(255, 223, 224,0.8);
	
}
.center {
	margin-left:auto; 
    margin-right:auto;
    border-collapse:separate;
 	border-spacing:15px;
 	font-size:150%;
 	color: black;
 	padding-top:25px;
}
input[type=submit] {
  display: inline-block;
  cursor: pointer;
  text-decoration: none;
  border: 0;
  line-height: 1;
  background: none;
  padding: .45em 1em;
  
  font-size:0.6em;
  --clr: #10753d;
  --outline: 2px solid white;
  border: 2px solid var(--clr);
  background: var(--clr);
  color: white;
  outline: var(--outline);
  transition: outline-offset 200ms ease;
   margin-right: 10px;
}

input[type=submit]:hover,
input[type=submit]:focus {
  outline: var(--outline);
  outline-offset: -6px;
  background-color: #199450;
}


input[type=reset] {
  display: inline-block;
  cursor: pointer;
  text-decoration: none;
  border: 0;
  line-height: 1;
  background: none;
  padding: .45em 1em;
  
  font-size:0.6em;
  --clr: #a31231;
  --outline: 2px solid white;
  border: 2px solid var(--clr);
  background: var(--clr);
  color: white;
  outline: var(--outline);
  transition: outline-offset 200ms ease;
}

input[type=reset]:hover,
input[type=reset]:focus {
  outline(--outline);
  outline-offset: -6px;
  background-color:#c71e42;
}
</style>

<script type="text/javascript">
function register(){
	var mail = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
	var phonecheck = /^[0-9]{8,12}$/;
	if(document.getElementById("fname").value == "")
	{
		parent.postMessage("fname","http://localhost:8181/JSPOnlineBookShopping/HomePage.jsp");
		return false;
	}
	if(document.getElementById("lname").value == "")
	{
		parent.postMessage("lname","http://localhost:8181/JSPOnlineBookShopping/HomePage.jsp");
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
	if(document.getElementById("male").checked == false && document.getElementById("female").checked == false)
	{
		parent.postMessage("gender","http://localhost:8181/JSPOnlineBookShopping/HomePage.jsp");
		return false;
	}
};
</script>
</head>
<body>
<br><br>
<div class="box">
<form action="RegisterServlet" method="post" onsubmit="return register()">
<table class="center">
	<tr>
		<td><label for="fname">Enter First Name: </label></td>
		<td><input type="text" id="fname" name="fname"></td>
	</tr>
	<tr>
		<td><label for="lname">Enter Last Name: </label></td>
		<td><input type="text" id="lname" name="lname"></td>
	</tr>
	<tr>
		<td><label for="email">Enter Email: </label></td>
		<td><input type="text" id="email" name="email" placeholder="example@email.com"></td>
	</tr>
	<tr>
		<td><label for="phone">Enter Phone Number: </label></td>
		<td><input type="text" id="phone" name="phone" placeholder="98765421"></td>
	</tr>
	<tr>
		<td><label for="gender">Select your gender: </label></td>
		<td><input type="radio" id="male" name="gender" value="male">
			<label for="male">Male</label>
			<input type="radio" id="female" name="gender" value="female">
			<label for="female">Female</label></td>
	</tr>
	<tr>
		<td></td>
		<td><input type="submit" value="Register"> <input type="reset" value="Clear"></td>
	</tr>
</table>
</form>
</div>
</body>
</html>