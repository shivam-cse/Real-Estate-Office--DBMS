<%
 response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
      response.setHeader("Pragma","no-cache");
      response.setHeader("Expires","0");
      %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style>
.content {
max-width:250px;
margin: auto;
font-family: verdana;
border:orange; border-width:5px; border-style:solid;
background-color: powderblue;
}
</style>
<style>
body  {background-color: MediumSpringGreen;}
</style>
<style>
h3 {font-size:40px;}
</style>
<meta charset="ISO-8859-1">
<title>Agent_Helper</title>
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>
    <%@page import = "java.sql.*"%> 
    <%@page import = "javax.sql.*"%> 
     <%@ page import = "java.io.*,java.util.*" %>
      <% 
       if(session.getAttribute("userid")==null)
		  {
		    response.sendRedirect("2.jsp");
		}
%>
      
<%

Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","ankit1431@");
String aid = request.getParameter("agentId");
String bid = request.getParameter("buyerId");
String sid = request.getParameter("sellerId");
String aptid = request.getParameter("aptId");
String pod = request.getParameter("pod");
String date = request.getParameter("date");
int agentId = Integer.parseInt(aid);
int buyerId = Integer.parseInt(bid);
int sellerId = Integer.parseInt(sid);
int apartmentId = Integer.parseInt(aptid);
int price = Integer.parseInt(pod);
String insert = "insert into purchase values(?,?,?,?,?,?)";
PreparedStatement st2 = con.prepareStatement(insert);
st2.setInt(1,agentId);
st2.setInt(2,buyerId);
st2.setInt(3,sellerId);
st2.setInt(4,apartmentId);
st2.setInt(5,price);
st2.setString(6,date);
int count6 = st2.executeUpdate();

response.sendRedirect("9.jsp");

%>     
</body>
</html>