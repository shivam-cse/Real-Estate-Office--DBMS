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
		background: white;
		text-align: center;
	}
	.content {
		position: fixed;
		margin-left: 600px;
		margin-top: 250px;
		text-align: center;
	}
	.cont2 {
		position: fixed;
		margin-left: 560px;
		margin-top: 350px;
		text-align: center;
	}
	.cont3 {
		position: fixed;
		margin-left: 610px;
		margin-top: 450px;
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
<body style="background: white" >
	<%@ page import="java.sql.*" %>
  <%@ page import="java.util.*" %>
	 <% 
       if(session.getAttribute("userid")==null)
		  {
		    response.sendRedirect("2.jsp");
		}
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
		 	    	<i class="fa fa-sign-out"></i>
		 			<span>
		 				<%
		 				String x = (String)session.getAttribute("userid");
		 				 if(x!=null)
		 				 {
		 				 	%>
		 				 	logout
		 				 	<%
		 				 }
		 				%>
		 			</span>
		 			</a>
		 	    </button>
		 	   </td>
		 	</tr>
		 </table>
	</div>
	<div class="content">
	<table>
		<tr>
		 <td>
		 	   	 <button type="submit" style=" font-size: 28px; cursor: pointer; background: skyblue;" onclick="location.href='8.jsp'" >
		 	    	<i class="fa fa-home"></i>
		 			<span>Checkout Home</span>
		 	    </button>
		 	   </td>
		 	</tr>
		 </table>
		</div>
	<div class="cont2">
			<table>
				<tr>
		 <td>
		 	   	 <button type="submit" style=" font-size: 28px; cursor: pointer; background: skyblue" onclick="location.href='4.jsp'" >
		 	   	 	<i class="fa fa-refresh"></i>
		 			<span> Update Requirements </span>
		 	    </button>
		 	   </td>
		 	</tr>
	</table>
</div>
	<div class="cont3">
	<table>
		<tr>
		 <td>
		 	   	 <button type="submit" style=" font-size: 28px; cursor: pointer; background: skyblue;" onclick="location.href='7.jsp'" >
		 	    	<i class="fa fa-user-secret"></i>
		 			<span>Contact Agent</span>
		 	    </button>
		 	   </td>
		 	</tr>
		 </table>
		</div>
</div>
<%
Connection connect = null;
Statement statement = null;
ResultSet resultSet = null;
PreparedStatement ps = null;
Class.forName("com.mysql.jdbc.Driver");
connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/lab10project?user=root&password=16104653&useSSL=false");



String q = "Select * from buyer where id = ?";
ps = connect.prepareStatement(q);
String idx=(String)session.getAttribute("userid");

int abcde=0;
if(idx !=null && !"".equals(idx)) {
        abcde= Integer.parseInt(idx);
  }
ps.setInt(1, abcde);
resultSet = ps.executeQuery();

String area = "";
while (resultSet.next()) {
  area = resultSet.getString("area");
}
   session.setAttribute("areagb",area);
%>
</body>
</html>