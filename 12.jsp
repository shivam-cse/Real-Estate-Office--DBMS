<%
 response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
      response.setHeader("Pragma","no-cache");
      response.setHeader("Expires","0");
      %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style >
      .opt{
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    padding-top: 25px;
    padding-bottom: 15px;

    }
    </style>
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

    </style>
    <style>
      body {
    background-image:url("https://images.pexels.com/photos/280229/pexels-photo-280229.jpeg");
    background-repeat: no-repeat;
    background-size: 100% 100%;
}
html {
    height: 100%
}
  </style>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>Apartments</title>
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
           <button type="submit" style=" font-size: 16px; cursor: pointer; margin-left: 60px;" onclick="location.href='1.jsp'">
            <i class="fa fa-home"></i>
          <span>Home</span>
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
    <!-- Optional JavaScript; choose one of the two! -->

     <%
          
          String Seller_ID=(String)session.getAttribute("userid");
          int seller_ID = 1;
         if(Seller_ID !=null && !"".equals(Seller_ID)) {
         seller_ID = Integer.parseInt(Seller_ID);  
         }
         

         try{
          Class.forName("com.mysql.jdbc.Driver");
           Connection con =  DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","ankit1431@");
              Statement stmt = null;
             stmt = con.createStatement();

             String sql = "SELECT area, apt_type, address,apt_size, no_of_rooms,price_exp FROM apartment where apartment_id in (select apartment_id from seller where id = "+seller_ID;

            ResultSet rs = stmt.executeQuery("SELECT area, apt_type, address,apt_size, no_of_rooms,price_exp FROM apartment natural join seller where id = "+seller_ID);
          %>
         <div class = "center">         
     <table style="background:#ffcccc; margin-left: 400px; margin-top: 200px;">
      <thead>
        <tr>
         <th>Area</th>
          <th>Address</th>
          <th>Apt_type</th>
          <th>Apt_size</th>
          <th>No_of_rooms</th>
          <th>Price Expected</th>
        </tr>
      </thead>
         <%
      while(rs.next()){
          %>
             <tbody>
        <tr>
          <td><%= rs.getString("area") %></td>
          <td><%= rs.getString("address") %></td>
          <td><%= rs.getString("apt_type") %></td>
          <td><%= rs.getInt("apt_size") %></td>
          <td><%= rs.getInt("no_of_rooms") %></td>
          <td><%= rs.getInt("price_exp") %></td>
        </tr>
   </tbody>
         <%
      }
      rs.close();
     }
     catch (Exception ex){
out.println(ex);
}
//out.println(ex);
%>
</table>
<br>
<button type="submit" style=" display:block; font-size: 25px; cursor: pointer; margin-left: 630px; margin-top: 50px; background: skyblue" onclick="location.href='5.jsp'" >
                    <span>Go To Dashboard</span>
                  </a>
                </button>
    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js" integrity="sha384-SR1sx49pcuLnqZUnnPwx6FCym0wLsk5JZuNx2bPPENzswTNFaQU1RDvt3wT4gWFG" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.min.js" integrity="sha384-j0CNLUeiqtyaRmlzUHCPZ+Gy5fQu0dQ6eZ/xAww941Ai1SxSY+0EQqNXNE6DZiVc" crossorigin="anonymous"></script>
    -->
  </body>
</html>