<%
 response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
      response.setHeader("Pragma","no-cache");
      response.setHeader("Expires","0");
      %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
<%@page import = "java.util.*" %>  
<%@page import = "java.sql.*" %>  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style type="text/css">

.styled-table {
    border-collapse: collapse;
    margin-top: 150px;
    font-size: 1.9em;
    font-family: sans-serif;
    min-width: 400px;
}
.styled-table tbody{
   background-color: #b3b3ff;
}
.styled-table thead tr {
    background-color: #009879;
    text-align: left;
}

.styled-table th,
.styled-table td {
    padding: 20px 20px;
}

.styled-table tbody tr {
    border-bottom: 1px solid #dddddd;
}

.styled-table tbody tr:nth-of-type(even) {
    background-color: #f3f3f3;
}

.styled-table tbody tr:last-of-type {
    border-bottom: 2px solid #009879;
}

.styled-table tbody tr.active-row {
    font-weight: bold;
    color: #009879;
}

.center {
  margin-left: 400px;
  margin-right: auto;
  padding-right: 0px;
 
}

li {
  float: left;
}

li a {
  display: block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

li a:hover {
  background-color: #111;
}


.button {
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 20px;
  margin: 4px 2px;
  cursor: pointer;
}
 .opt{
        position: fixed;
        top: 0;
        left: 0;
        right: 0;
        padding-top: 20px;
        padding-bottom: 20px;
        }

.button1 {background-color: #4CAF50;} /* Green */
.button2 {background-color: #008CBA;} /* Blue */

</style>
</head>
<body>
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
                  <button type="submit" style=" display:block; font-size: 16px; cursor: pointer; margin-left: 40px;" onclick="location.href='1.jsp'" >
                    <a href="1.jsp" style="text-decoration-line: none">
                    <i class="fa fa-home"></i>
                    <span>Home</span>
                    </a>
                </button>
            </td>
            <td>
                 <button type="submit" style=" font-size: 16px; cursor: pointer; margin-left: 1200px;">
                    <a href="2.jsp" style="text-decoration-line: none">
                    <i class="fa fa-sign-out"></i>
                    <span>Logout</span>
                    </a>
                </button>
               </td>
            </tr>
         </table>
    </div>

<%           
        String area="";
        int f=0;
        Connection connect = null;
				Statement statement = null;
				ResultSet resultSet = null;
				String query="";
        if(session.getAttribute("areagb")==null)
        {
          query = "select * from Agent ";
        }
        else
        {
          query = "select * from Agent where area = ?";
          area=(String)session.getAttribute("areagb");
          f=1;
        }				
%>

<div class = "center">
<table class="styled-table">
      <thead>
        <tr>
          <th>Agent Name</th>
          <th>Area</th>
          <th>Contact</th>
        </tr>
      </thead>
   

<%
try{
	    Class.forName("com.mysql.jdbc.Driver");
	    connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?user=root&password=ankit1431@&useSSL=false");
	    //statement = connect.createStatement();
	    PreparedStatement ps = connect.prepareStatement(query);
	    
      if(f==1)
      {
        ps.setString(1, area);
      }
    	resultSet = ps.executeQuery();
    	while (resultSet.next()) {		 
 %> 
     
    <tbody>
        <tr>
          <td><%= resultSet.getString(2) %></td>
          <td><%= resultSet.getString(4) %></td>
          <td><%= resultSet.getString(3) %></td>
        </tr>
   </tbody>
     		
<% } 

}catch(Exception e){
	System.out.println(e);
}

%>
</table>
</div>		
<br>
<button type="submit" style=" display:block; font-size: 25px; cursor: pointer; margin-left: 580px; margin-top: 50px; background: skyblue" onclick="history.back(-1)" >
                    <span>Go To Dashboard</span>
</body>
</html>