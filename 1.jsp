<%
 response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
			response.setHeader("Pragma","no-cache");
			response.setHeader("Expires","0");
			%>
<!DOCTYPE html>
<html>
<head>
	<title>
		Home 
	</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<style >
	body {
		text-align: center;
	}
	.content {
		position: fixed;
		margin-left: 300px;
		margin-top: 350px;
		text-align: center;
	}
	.cont2 {
		position: fixed;
		margin-left: 1000px;
		margin-top: 350px;
		text-align: center;
	}
	.cont3 {
		position: fixed;
		margin-left: 550px;
		margin-top: 150px;
		text-align: center;
	}
	.opt{
		position: fixed;
		top: 0;
		left: 0;
		right: 0;
		padding-top: 40px;
		padding-bottom: 20px;
		}

</style>
<body>
	<%@ page import="java.sql.*" %>
  <%@ page import="java.util.*" %>
	<%
	  int f=0;
	%>
	<div class="opt" style="background: black">
		 <table>
		 	<tr>
		 	   <td>
		 	   	 <button type="submit" style=" font-size: 16px; cursor: pointer; margin-left: 60px;" onclick="location.href='1.jsp'">
		 	    	<i class="fa fa-home"></i>
		 			<span>Home</span>
		 	    </button>
		 	   </td>
		 	<td>
		 	   	 <button type="submit" style=" font-size: 16px; cursor: pointer; margin-left: 1200px;">
		 	   	 	<a href="2.jsp" style="text-decoration-line: none">
		 	   	 		<%
		 	   	 		  if(session.getAttribute("userid")==null)
		 	   	 		  	{
		 	   	 		%>
		 	    	<i class="fa fa-user"></i>
		 			<span>Login</span>
		 			<% 
		 			  } 
		 			%>
		 			<%
		 	   	 		  if(session.getAttribute("userid")!=null)
		 	   	 		  	{
		 	   	 		  		f=1;
		 	   	 		%>
		 	    	<i class="fa fa-sign-out"></i>
		 			<span>Logout</span>
		 			<% 
		 			  } 
		 			%>
		 			</a>
		 	    </button>
		 	   </td>
		 	</tr>
		 </table>
	</div>
	<div class="cont3">
		<h1> Hello !! We Welcomes You Here </h1>
	</div>
	<div class="content" >
	<table>
		<tr>
		 <td>
		 	   	 <button type="submit" style=" font-size: 28px; cursor: pointer; background: skyblue;" >
		 	   	 	<%
                         if(f==1)
                         	{
		 	   	 	%>
		 	   	 	<a href="13.jsp" style="text-decoration-line: none">
		 	   	 		<%
                          }
		 	   	 		%>
		 	   	 	<%
                         if(f==0)
                         	{
		 	   	 	%>
		 	   	 	<a href="2.jsp" style="text-decoration-line: none">
		 	   	 		<%
                          }
		 	   	 		%>
		 	    	<i class="fa fa-search"></i>
		 			<span>Search For Homes </span>
		 			<i class="fa fa-home"></i>
		 	    </button>
		 	   </td>
		 	</tr>
		 </table>
		</div>
		<div class="cont2">
			<table>
				<tr>
		 <td>
		 	   	 <button type="submit" style=" font-size: 28px; cursor: pointer; background: skyblue" >
		 	   	 	<%
                         if(f==1)
                         	{
		 	   	 	%>
		 	   	 	<a href="5.jsp" style="text-decoration-line: none">
		 	   	 		<%
                          }
		 	   	 		%>
		 	   	 	<%
                         if(f==0)
                         	{
		 	   	 	%>
		 	   	 	<a href="2.jsp" style="text-decoration-line: none">
		 	   	 		<%
                          }
		 	   	 		%>
		 	    	<i class="fa fa-money"></i>
		 			<span>Sell Your Homes </span>
		 			<i class="fa fa-home"></i>
		 	    </button>
		 	   </td>
		 	</tr>
	</table>
</div>
</body>
</html>