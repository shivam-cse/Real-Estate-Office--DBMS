<%
 response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
      response.setHeader("Pragma","no-cache");
      response.setHeader("Expires","0");
      %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<!doctype html>
<!doctype html>
<html lang="en">
  <head>
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
    .cont{
    	max-width: 350px;
		margin-top: 160px;
		margin-left: 530px;
		background: white;
		padding: 50px;
		text-align: left;
    }
    </style>
    <!-- Required meta tags -->
    <style>
      body {
    background-image:url("https://images.pexels.com/photos/186077/pexels-photo-186077.jpeg");
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
    <title>Update Apartment</title>
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
		 	   	 <button type="submit" style=" font-size: 16px; cursor: pointer; margin-left: 60px;" onclick="location.href='1.jsp'">
		 	    	<i class="fa fa-home"></i>
		 			<span>Home</span>
		 	    </button>
		 	   </td>
         <td>
           <button type="submit" style=" font-size: 16px; cursor: pointer; margin-left: 30px;" onclick="location.href='9.jsp'">
          <span> Back </span>
          </button>
         </td>
		 	<td>
		 	   	 <button type="submit" style=" font-size: 16px; cursor: pointer; margin-left: 1100px;">
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
       String Apartment_ID = request.getParameter("Apartment_ID");
       String Seller_ID = request.getParameter("Seller_ID");
       String Type = request.getParameter("Type");
       String Price = request.getParameter("Price");

       int apartment_ID = 1;
       if(Apartment_ID !=null && !"".equals(Apartment_ID)) {
       apartment_ID = Integer.parseInt(Apartment_ID);  
       }

       int seller_ID = 1;
       if(Seller_ID !=null && !"".equals(Seller_ID)) {
       seller_ID = Integer.parseInt(Seller_ID);  
      }

      int price = 0;
       if(Price !=null && !"".equals(Price)) {
       price = Integer.parseInt(Price);  
       }

     try{
       Class.forName("com.mysql.jdbc.Driver");
        Connection con =  DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","ankit1431@");
        
         String sql = "UPDATE  apartment set  apt_type = "+"'"+Type+"'"+ "where apartment_id="+apartment_ID;
         String sql2 = "UPDATE  seller set  price_exp ="+price+" where apartment_id="+apartment_ID+" and id ="+seller_ID;
         Statement stmt = null;
         stmt = con.createStatement();
         int count1 = 0;
         int count2 = 0;
         if(Type!=null && !"".equals(Type)){
           count1 = stmt.executeUpdate(sql);
        }
       
         count2 = stmt.executeUpdate(sql2);


if (count1 != 0 && count2 !=0) {%>
   <div class="alert alert-success alert-dismissible fade show" role="alert" style="margin-top: 70px;">
          <strong>Success!</strong> Your entry has been submitted successfully! 
        </div>
<%
} 
else if(Type!=null && !"".equals(Type)){ %>

       <div class="alert alert-danger alert-dismissible fade show" role="alert" >
          <strong>Error!</strong> THERE IS NO SUCH COMBINATION OF APARTEMENT_ID AND SELLER_ID PLESE FILL CORRECTLY
        </div>
<%
  
}
}
catch (Exception ex){
//out.println(ex);
%>
   
  <div class="alert alert-danger alert-dismissible fade show" role="alert" >
          <strong>Error!</strong> Some error is occured Please fill correctly
        </div>
        <%
}
%>

     <form action="10.jsp" method="post" style="margin-top: 150px ; margin-left: 500px; margin-right: 500px;">
    <div class="form-group">
         
        <label for="Apartment_ID" class="d-inline p-1 bg-dark text-white">Apartment ID</label><br>
        <input type="text" name="Apartment_ID" class="form-control" id="Apartment_ID">
    </div>
   <br>
 
 <div class="form-group" >
         
        <label for="Seller_ID" class="d-inline p-1 bg-dark text-white">Seller ID</label><br>
        <input type="text" name="Seller_ID" class="form-control" id="Seller_ID" >
    </div>
   <br>
    <div class="form-group">
         
        <label for="Type" class="d-inline p-1 bg-dark text-white">Type</label><br>
        <input type="text" name="Type" class="form-control" id="Type" >
    </div>
   <br>

    <div class="form-group">
        <label for="Price" class="d-inline p-1 bg-dark text-white">Price</label><br>
        <input type="text" name="Price" class="form-control" id="Price" > 
    </div>
    <button type="submit" class="btn btn-primary">Submit</button>
    </form>


    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js" integrity="sha384-SR1sx49pcuLnqZUnnPwx6FCym0wLsk5JZuNx2bPPENzswTNFaQU1RDvt3wT4gWFG" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.min.js" integrity="sha384-j0CNLUeiqtyaRmlzUHCPZ+Gy5fQu0dQ6eZ/xAww941Ai1SxSY+0EQqNXNE6DZiVc" crossorigin="anonymous"></script>
    -->
  </body>
</html>