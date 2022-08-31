<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style>


ul {
  display: inline-block;
  list-style-type: none;
  width:1000px;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: rgb(255, 223, 224);
  border:1px solid black;
  border-radius: 5px;
}

li {
  display:inline-block;
}

li a {
  display: block;
  color: black;
  text-align: center;
  padding: 15px;
  text-decoration: none;
  font-size:25px;
}

li a:hover {
  background-color: rgb(255, 201, 224);
}

div.table{
 	width:100%;
    height:20px;
    text-align: center;
}

table.center{
	margin-left:auto; 
    margin-right:auto;
    border-collapse:separate;
 	border-spacing:15px;
 	font-size:150%;
 	color: white;
}

input[type=submit] {
  display: inline-block;
  cursor: pointer;
  text-decoration: none;
  border: 0;
  line-height: 1;
  background: none;
  padding: .45em 1em;
  
  font-size:0.7em;
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
  
  font-size:0.7em;
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
<title>Login Page</title>
<script type="text/javascript">
function validLogin(){
	if(document.getElementById("userid").value == "")
	{
		parent.postMessage("userid","http://localhost:8181/JSPOnlineBookShopping/HomePage.jsp");
		return false;
	}
	if(document.getElementById("password").value == "")
	{
		parent.postMessage("password","http://localhost:8181/JSPOnlineBookShopping/HomePage.jsp");
		return false;
	}
};

</script>
</head>
<body>

<div class='table'>

<br><br>
<form action="LoginServlet" method="post" onsubmit="return validLogin()">
<table class="center">
	<tr>
		<td><label for="userid">Enter User ID: </label></td>
		<td><input type="text" name="userid" id="userid"></td>
	</tr>
	<tr>
		<td><label for="pwd">Enter Password: </label></td>
		<td><input type="password" name="password" id="password"></td>
	</tr>
	<tr>
		<td></td>
		<td><input type="submit" value="Login"> <input type="reset" value="Clear"></td>
	</tr>
</table>
</form>
</div>
</body>
</html>