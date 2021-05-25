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

<style>
.styled-table {
    border-collapse: collapse;
    margin:25px 30px;
    font-size: 2.9em;
    font-family: sans-serif;
    min-width: 400px;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
}
table, th, td {
  border: 2px solid black;
  border-collapse: collapse;
  
}

th, td {
  padding: 15px;
}

.styled-table thead tr {
    background-color: #009879;
    color: #ffffff;
    text-align: left;
}

.styled-table th,
.styled-table td {
    padding: 12px 15px;
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
  margin-top: 150px;
  margin-left: 400px;
  width: 50%;
  padding: 10px;
}

.button {
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 30px;
  margin: 4px 2px;
  cursor: pointer;
}

.button1 {background-color: #4CAF50;} /* Green */
.button2 {background-color: #008CBA;} /* Blue */

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

</style>
<style >
  .opt{
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    padding-top: 15px;
    padding-bottom: 10px;

    }
</style>

</head>
<body>
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
            <button type="submit" style=" display:block; font-size: 16px; cursor: pointer; margin-left: 50px;" onclick="location.href='1.jsp'" >
            <a href="1.jsp" style="text-decoration-line: none">
            <i class="fa fa-home"></i>
          <span>Home</span>
          </a>
          </button>
         </td>
          <td>
           <button type="submit" style=" font-size: 16px; cursor: pointer; margin-left: 50px;">
            <a href="7.jsp" style="text-decoration-line: none">
          <span>Contact Agent</span>
          </a>
          </button>
         </td>
      <td>
           <button type="submit" style=" font-size: 16px; cursor: pointer; margin-left: 1000px;">
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
//String buyerId = request.getParameter("buyerid");
//int buyerid = Integer.parseInt(buyerId);

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

String area = "", apt_type = "";
int apt_size = 0, nor = 0 , budget = 0;

while (resultSet.next()) {
	area = resultSet.getString("area");
	apt_type = resultSet.getString("apt_type");
	apt_size = resultSet.getInt("apt_size");
	nor = resultSet.getInt("no_of_rooms");
	budget = resultSet.getInt("budget");
}

                 //Avaliability = 'Available'
String ava="Avaliable";
				String query = "select * from apartment natural join seller where area = ? and apt_type = ? and apt_size >= ? and no_of_rooms >= ? and price_exp <= ? and avaliability = ?;";
				//String query = "Select * from Agent";
			    
	    
	%>
	
<div class = "center">					
<table style="background:#ffcccc;">
      <thead>
        <tr>
         <th>Seller Name</th>
         <th>Area</th>
          <th>Address</th>
          <th>apt_size</th>
          <th>no_of_rooms</th>
          <th>Price Expected</th>
        </tr>
      </thead>
  
<%
        session.setAttribute("areagb",area);
try{
	    
	    //statement = connect.createStatement();
	    ps = connect.prepareStatement(query);
	    ps.setString(1, area);
	    ps.setString(2, apt_type);
	    ps.setInt(3, apt_size);
	    ps.setInt(4, nor);
	    ps.setInt(5, budget);
      ps.setString(6,ava);
    	resultSet = ps.executeQuery();
    	while (resultSet.next()) {		 
 %> 
     
    <tbody>
        <tr>
          <td><%= resultSet.getString("seller_name") %></td>
          <td><%= resultSet.getString("area") %></td>
          <td><%= resultSet.getString("address") %></td>
          <td><%= resultSet.getInt("apt_size") %></td>
          <td><%= resultSet.getInt("no_of_rooms") %></td>
          <td><%= resultSet.getInt("price_exp") %></td>
        </tr>
   </tbody>

     		
<% } 

}catch(Exception e){
	System.out.println(e);
}

%>
 </table><br><br>
</div>
<br>
<button type="submit" style=" display:block; font-size: 25px; cursor: pointer; margin-left: 630px; margin-top: 50px; background: skyblue" >
          <a href="13.jsp" style="text-decoration-line: none">
                    <span>Go To Dashboard</span>
                  </a>
                </button>
</body>
</html>