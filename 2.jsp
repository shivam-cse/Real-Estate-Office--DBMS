<%
 response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
			response.setHeader("Pragma","no-cache");
			response.setHeader("Expires","0");
			%>
<!DOCTYPE html>
<html>
<head>
	<title>
		User Login 
	</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<style >
	body {
		background: white;
		text-align: center;
	}
	.content {
		max-width: 350px;
		margin-top: 160px;
		margin-left: 530px;
		background: white;
		padding: 50px;
		text-align: left;
	}
	.opt{
		position: fixed;
		top: 0;
		left: 0;
		right: 0;
		padding-top: 25px;
		padding-bottom: 15px;

		}
</style>
<body style="background: purple" >
	<%@ page import="java.sql.*" %>
  <%@ page import="java.util.*" %>
  <%
  session.removeAttribute("userid");
  %>
	<nav class="opt" style="background: black">
		 <table>
		 	<tr>
		 	    <button type="submit" style=" display:block; font-size: 16px; cursor: pointer; margin-left: 40px;" onclick="location.href='1.jsp'" >
		 	    	<a href="1.jsp" style="text-decoration-line: none">
		 	    	<i class="fa fa-home"></i>
		 			<span>Home</span>
		 			</a>
		 	    </button>
		 	</tr>
		 </table>
	</nav>
	<div class="content" >
		<form action="2b.jsp" method="Post">
			<h1 style="text-align: center">
				Sign In 
			</h1>
	<table>
		 <tr>
		 	<td>
		 		<input type="text" placeholder="Login Id" name="id" size="35px" required="" style="font-size: 15px">
		 		<br/><br/>
		 	</td>
		 </tr>
		 <tr>
		 	<td>
		 		<input type="Password" placeholder="Password" name="pass" size="35px" required="" style="font-size: 15px">
		 		<br/>
		 	</td>
		 </tr>
		 <tr>
		 	<td>
		 		<p style="font-size: 18px">
		 			Login As :
		 		<select name="Login" style="cursor: pointer;">
		 			<option>Agent</option>
		 			<option>Seller</option>
		 			<option>Buyer</option>
		 		</select>
		 	</p>
		 	</td>
		 </tr>
		 <tr>
		 	<td>
		 		<button type="submit" style="background-color:skyblue; margin-left:auto; margin-right:110px; display:block; font-size: 16px; cursor: pointer;" >Login</button>
		 		<%
		 		 if(session.getAttribute("error")!=null)
		 		 { session.removeAttribute("error");

		 		 	%>
		 		 	 <p style="text-align: center; color: red ">
		 		 	 	Incorrect User Id or Password !!
		 		 	 </p>
		 		 	<%
		 		 }
		 		%>
		 	</td>
		 </tr>
		 <tr>
		 	<td>
		 		<p style="text-align: center; font-size: 18px">
		 			New Here ??<a href="3.jsp" style="text-decoration-line: none; cursor: pointer;">Register Now</a>
		 		</p>
		 	</td>
		 </tr>
	</table>
</form>
</div>
</body>
</html>