<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Online Book Shopping Portal</title>
<style>
body{
	background-image: url('https://images.pexels.com/photos/1831744/pexels-photo-1831744.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1');
	background-repeat:no-repeat;
	background-attachment:fixed;
	background-size:cover;
}

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

iframe {
    background-color: transparent;
    display: block;
    margin: 0 auto;
}

div.iframe-container {
    dsiplay : flex;
    justify-content : center;
}
div.table{
 	width:100%;
    height:20px;
    text-align: center;
}

</style>
<script type="text/javascript" language="JavaScript">
    if (top.location != self.location) {
      top.location.href = self.location.href;
    }

    window.history.forward();
    function noBack() {
        window.history.forward();
    }
    
    var eventMethod = window.addEventListener
	? "addEventListener"
	: "attachEvent";
	var eventer = window[eventMethod];
	var messageEvent = eventMethod === "attachEvent"
	? "onmessage"
	: "message";

	eventer(messageEvent, function (e) {

	if (e.data === "userid" || e.message === "userid") 
		alert('Please Enter Userid!');
	else if(e.data === "password" || e.message === "password") 
	alert('Please Enter Password!');
	else if(e.data === "fname" || e.message === "fname") 
		alert('Please Enter First Name!');
	else if(e.data === "lname" || e.message === "lname") 
		alert('Please Enter Last Name!');
	else if(e.data === "name" || e.message === "name") 
		alert('Please Enter Name!');
	else if(e.data === "email" || e.message === "email") 
		alert('Please Enter Email!');
	else if(e.data === "emailvalid" || e.message === "emailvalid") 
		alert('Email is invalid! Ex: example@email.com');
	else if(e.data === "phone" || e.message === "phone") 
		alert('Please Enter Phone Number!');
	else if(e.data === "phonevalid" || e.message === "phonevalid") 
		alert('Phone No is invalid! Ex: 32568466');
	else if(e.data === "gender" || e.message === "gender") 
		alert('Please Select Gender!');
	else if(e.data === "register" || e.message === "register") 
		alert('Registered Successfully!');
	else if(e.data === "fail" || e.message === "fail") 
		alert('Fail to register...');
	else if(e.data === "feedbackvalid" || e.message === "feedbackvalid") 
		alert('Please enter your feedback!');
	else if(e.data === "feedback" || e.message === "feedback") 
		alert('Thank you for your feedback!');
	else if(e.data === "feedbackfail" || e.message === "feedbackfail") 
		alert('Fail to submit feedback...');
	
	console.log(e);
});
</script>
</head>
<body>

<h1 style="text-align:center; color:white; font-size:270%;-webkit-text-stroke-width: 0.5px;
    -webkit-text-stroke-color: black;">Online Book Shopping Portal</h1>
    
<div class='table'>
<ul>
	<li><a href="AboutUs.jsp" target="iframe_a">About Us</a></li>
	<li><a href="Register.jsp" target="iframe_a">Register</a></li>
	<li><a href="LoginPage.jsp" target="iframe_a">Login</a></li>
	<li><a href="ContactUs.jsp" target="iframe_a">Contact Us</a></li>
</ul>
</div>

<div class="iframe-container"><br><br>
<iframe src="front.jsp" name="iframe_a" height="500px" width="1000px" title="iframe" sandbox="allow-top-navigation allow-scripts allow-forms" frameBorder="0"></iframe>
</div>
</body>
</html>