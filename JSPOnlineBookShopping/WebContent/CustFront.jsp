<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer Portal</title>
<style>
body{
	background-image: url('https://i.pinimg.com/736x/7c/ef/ab/7cefab6cf1f408a97afd22710c4e820b.jpg');
	background-repeat:no-repeat;
	background-attachment:fixed;
	background-size:100% 110%;
}

div {
	text-align:right;
	font-size:300%;
	padding-top:110px;
	padding-left:35px;
}

.blink{
	animation: blinker 1.5s linear infinite;
    color: red;
    font-family: "Comic Sans MS", "Comic Sans", cursive;
    text-align:left;
    padding:0;
    margin:0;
    -webkit-text-stroke-width: 1px;
    -webkit-text-stroke-color: black;
}
@keyframes blinker {
    50% {
        opacity: 0;
    }
}
</style>
</head>
<body>
<div>
<p style="color:white" class="blink"><b>Welcome to discover</b></p>
<p style="color:white" class="blink"><b>Pandora Bookshop!</b></p>
</div>
</body>
</html>